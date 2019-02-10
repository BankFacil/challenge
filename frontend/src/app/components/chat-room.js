import Component from '@ember/component';
import ChatRoom from '../objects/chat-room';

export default Component.extend({
    chat: null,
    mensagem: null,
    init() {
        const name = this.get('name');
        const chatRoom = ChatRoom.create({ name: name });

        this._super(...arguments);
        this.set('chat', chatRoom);
    },
    actions: {
        enviar() {
            const mensagem = this.get('mensagem');
            if (!mensagem)
                return false;

            this.get('chat').add(mensagem);
            this.set('mensagem', null);
        }
    }
});
