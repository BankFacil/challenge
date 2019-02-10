import Route from '@ember/routing/route';

export default Route.extend({
    model() {
        return {
            chatRooms: ['Chat 1', 'Chat 2']
        }
    }
});
