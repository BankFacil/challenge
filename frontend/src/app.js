// could have used babel to use const / let / arrow functions safely
// avoid hoisting mistakes and so on
"use strict";

// defining main variables 
const messagesElementsHolder = document.getElementById('messages-holder')
const messagesElements = messagesElementsHolder.getElementsByClassName('messages')
const newChatButton = document.getElementById('new-chat')

// Messages prototype to create objects
const Messages = function(messages) {
this.messageForm = messages.querySelector('form'),
this.simulateDiv = messages.querySelector('.simulate'),
this.messageSendButton = this.messageForm.querySelector('button'),
this.messageTextInput = this.messageForm.querySelector('input'),
this.messageList = messages.querySelector('.message-list')
}

// Filter new chats and apply listeners to them
function createChats() {
Array.from(messagesElements)
    .filter(messages => messages.classList.contains('messages-new'))
    .map(messages => {
    const messageObj = new Messages(messages)
    messageObj.messageForm.addEventListener('submit', (e) => {
        e.preventDefault()
        sendMessage(messageObj, 'me')
    })
    messageObj.messageSendButton.addEventListener('click', (e) => {
        e.preventDefault()
        sendMessage(messageObj, 'me')
    })
    messageObj.simulateDiv.addEventListener('click', (e) => {
        e.preventDefault()
        let mockMessageObj = messageObj
        mockMessageObj.messageTextInput.value = "Simulated response"
        sendMessage(messageObj, 'friend')
    })

    // [TO-DO] add ajax, long polling and so on
    messages.classList.remove('messages-new')})
}

// if not empty, add message to the list
function sendMessage(messageObj, who) {
let messageTextInputValue = messageObj.messageTextInput.value
if(messageTextInputValue !== "") {
    const liList = messageObj.messageList.querySelectorAll('li')
    const lastLi = liList[liList.length - 1]
    var li
    if(!lastLi.classList.contains(who)) {
    li = document.createElement('li')
    li.classList.add(who)
    li.innerText = messageObj.messageTextInput.value
    messageObj.messageList.appendChild(li)
    } else {
    li = lastLi
    li.innerHTML += "<br>" + messageObj.messageTextInput.value
    }
    messageObj.messageTextInput.value = ""
    messageObj.messageList.scrollTop = messageObj.messageList.scrollHeight
}
}

// initiate the first chat
createChats()

// on newChat click add new chat and createChats for new chats 
newChatButton.addEventListener('click', function(e) {
e.preventDefault()
messagesElementsHolder.appendChild(newChat())
createChats()
})

// I'm not so sure how to use web components YET, but I'm willing to learn it the right way soon
function newChat() {
/* remove */ const simulateDiv = document.createElement('div')
/* remove */ const initialLi = document.createElement('li')

const messages = document.createElement('div')
const messageList = document.createElement('ul')
const messageInput = document.createElement('div')
const form = document.createElement('form')
const input = document.createElement('input')
const button = document.createElement('button')

/* remove */ simulateDiv.classList.add('simulate')
/* remove */ simulateDiv.innerHTML = "Click here to simulate a bot response"
/* remove */ initialLi.classList.add('friend')
/* remove */ initialLi.innerHTML = "Hi! How can I help you?"

messages.classList.add('messages', 'messages-new')
messageList.classList.add('message-list')
messageInput.classList.add('message-input')
form.setAttribute('method', 'post')
input.setAttribute('type', 'text')
button.setAttribute('type', 'button')

/* remove */ messages.appendChild(simulateDiv)
/* remove */ messageList.appendChild(initialLi)

messages.appendChild(messageList)
form.appendChild(input)
form.appendChild(button)
messageInput.appendChild(form)
messages.appendChild(messageInput)
return messages
}