class Customer():
    def __init__(self, name: str, wallet: int):
        self.name = name
        self.wallet = wallet
        self.email_messages = []

    def send_email(self, message: str):
        self.email_messages.append(message)
