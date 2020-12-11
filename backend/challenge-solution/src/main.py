#!/usr/bin/env python
# encoding: utf-8
# encoding: iso-8859-1
# encoding: win-1252

import logging, os, platform

from log import logger
from errors import *
from controller import controller as ctrl


DEFAULT_HOST = "127.0.0.1"
DEFAULT_PORT = 51234

def main():
	"""Method responsible only for initializing the application."""
	try:
		logger.info("Starting...")
		pid = os.getpid()
		so = platform.system()
		logger.info("PID: {} -> Platform: {}.".format(pid, so))
		ctrl.Controller(DEFAULT_HOST, DEFAULT_PORT).StartServer()

	except Exception as e:
		err = wrapError(startApplicationError, e)
		err = setErrorContext(err, "pid", pid)
		err = setErrorContext(err, "platform", so)
		logger.critical(err)

	finally:
		logger.info("Finished.")

if __name__ == "__main__":
	main()
