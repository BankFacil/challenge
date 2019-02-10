import Object from '@ember/object';

export default Object.extend({
    nome: null,
    mensagens: null,
    init() {
        this._super(...arguments);
        this.set('mensagens', []);
    },
    add(item) {
        this.get('mensagens').pushObject(item);
    },
    remove(item) {
        this.get('mensagens').removeObject(item);
    },
    empty() {
        this.get('mensagens').setObjects([]);
    }
});