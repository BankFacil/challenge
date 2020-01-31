TEST_SHIPPING_ADDRESS = {
    'street': 'Evergreen Terrace 742',
    'zipcode': 5635,
    'city': 'Springfield',
    'country': 'USA'}

HOMER_SIMPSON = {
    'name': 'Homer J.',
    'surname': 'Simpson',
    'email': 'homer_simpson@fox.com',
    'shipping_address': TEST_SHIPPING_ADDRESS,
    'billing_address': TEST_SHIPPING_ADDRESS}

HOMER_SIMPSON_NO_EMAIL = {
    'name': 'Homer J.',
    'surname': 'Simpson',
    'e-mail': '',
    'shipping_address': TEST_SHIPPING_ADDRESS,
    'billing_address': TEST_SHIPPING_ADDRESS}

BOOK = {
    'name': 'La pasion de Artemisia',
    'category': 'book'
}

SOCKS = {
    'name': 'Happy Socks',
    'category': 'item'
}

SPOTIFY_SUBSCRIPTION = {
    'name': 'Spotify',
    'category': 'subscription',
    'active': False,
    'membership_plan': 'standard'
}

NETFLIX_SUBSCRIPTION = {
    'name': 'Netflix',
    'category': 'subscription',
    'active': False,
    'membership_plan': 'premium'
}

HULU_SUBSCRIPTION = {
    'name': 'Hulu',
    'category': 'subscription',
    'active': False,
    'membership_plan': 'basic'
}

LOGGER_HEADER = 'INFO:root:'

BOOK_NOTIFICATON = '----Tax-exempt item as provided in the Constitution Art. 150, VI, d.----\n '

BOOK_LABEL = "{}{} {} \n {}".format(BOOK_NOTIFICATON, HOMER_SIMPSON['name'],
                                    HOMER_SIMPSON['surname'], HOMER_SIMPSON['shipping_address'])

ITEM_LABEL = "{} {} \n {}".format('', HOMER_SIMPSON['name'],
                                  HOMER_SIMPSON['surname'], HOMER_SIMPSON['shipping_address'])

MOVIE = {
    'name': 'Despicable me',
    'category': 'media',
    'media_type': 'movie'
}

SONG = {
    'name': 'Nabucco Overture',
    'category': 'media',
    'media_type': 'mp3'
}
