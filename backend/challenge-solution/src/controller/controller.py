#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import cherrypy, json, simplejson

from log import logger
from errors import *
from . import helper as hp
from repository import repository as rps
from usecase import usecase as uc
from entity import entity as ett


PATH = "/service/"
ACCESSCONTROL = "*"
STATUS_BAD_REQUEST = 400
STATUS_INTERNAL_SERVER_ERROR = 500

repo = rps.Repository()
hlp = hp.Helper(repo)
ucs = uc.UseCase(repo)

class Controller(object):
	"""Class responsible for starting a server with routes for use cases. It receives a host and a port as parameters."""
	def __init__(self, host, port):
		self.host = host
		self.port = port

	def StartServer(self):
		global_conf = {
			'global': {
				'server.socket_host': self.host,
				'server.socket_port': self.port,
			}
		}
		logger.debug("Starting the server with the settings: {}.".format(global_conf))

		application_conf = {
			'/': {
				'tools.response_headers.headers': [('Content-Type', 'application/json; charset=utf-8'), ('token', '')],
				'request.dispatch': cherrypy.dispatch.MethodDispatcher(),
				'tools.CORS.on': True,
			}
		}

		cherrypy.tools.CORS = cherrypy.Tool('before_handler', CORS)
		cherrypy.config.update(global_conf)
		cherrypy.config.update(application_conf)
		cherrypy.tree.mount(HandlerPayment(), PATH+'pay', application_conf)
		cherrypy.tree.mount(HandlerMembership(), PATH+'membership', application_conf)
		cherrypy.engine.start()
		cherrypy.engine.block()

@cherrypy.expose
class HandlerPayment(object):
	"""Class responsible for handling payment requests."""

	@cherrypy.tools.accept(media='application/json')
	def POST(self):
		try:
			response = ett.Response()
			params = simplejson.loads(cherrypy.request.body.read(int(cherrypy.request.headers['Content-Length'])))
			data = hlp.validate(params)
			response.body.content = ucs.payment(data)

		except Exception as e:
			response.header = errorHandler(e)
			response.body.status = "FAIL"

		else:
			response.body.status = "SUCCESS"

		finally:
			cherrypy.response.status = response.header.code
			return json.dumps(response, default=ett.serialize)


@cherrypy.expose
class HandlerMembership(object):
	"""Class responsible for handling membership requests."""

	@cherrypy.tools.accept(media='application/json')
	def GET(self, customer):
		try:
			response = ett.Response()
			params = {"customer": customer}
			hlp.validateCustomer(params)
			response.body.content = ucs.membership(params)

		except Exception as e:
			response.header = errorHandler(e)
			response.body.status = "FAIL"

		else:
			response.body.status = "SUCCESS"

		finally:
			cherrypy.response.status = response.header.code
			return json.dumps(response, default=ett.serialize)


def errorHandler(error):
	logger.error(error)
	friendlyError = ett.ResponseHeader()
	cause = unwrapError(error)

	if cause.code in range(4000, 4999):
		friendlyError.code = STATUS_BAD_REQUEST
		friendlyError.status = "Bad Request."
		friendlyError.detail = str(cause)
		return friendlyError

	friendlyError.code = STATUS_INTERNAL_SERVER_ERROR
	friendlyError.status = "Internal Server Error."
	return friendlyError


def CORS():
	cherrypy.response.headers["Access-Control-Allow-Origin"] = ACCESSCONTROL
	cherrypy.response.headers["Access-Control-Allow-Headers"] = "Authorization"
