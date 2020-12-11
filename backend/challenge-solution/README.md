Payment Service
==========

Fictitious payment service.

### Building
#### Requires:
- Python >= 3.8.2

#### Environment:
```bash
python -m pip install --upgrade pip
pip install virtualenv
git clone git@github.com:ademirfteo/payment-service.git
python -m venv payment-service
```

#### Dependencies:
```bash
cd payment-service
source Scripts/activate
pip install cherrypy==18.5.0
pip install simplejson==3.17.0
pip install pytest
```

### Testing
```bash
pytest src/
```

### Running
```bash
python src/main.py
```

### Using sample
#### Making a payment:
```bash
curl -X POST -H 'Content-Type: application/json' -d '{"customer": 1, "products": [2, 4, 6, 8, 12], "creditcard": "43567890-987654367"}' http://localhost:51234/service/pay | python -m json.tool
```
#### Checking for active memberships:
```bash
curl http://localhost:51234/service/membership?customer=1 | python -m json.tool
```
