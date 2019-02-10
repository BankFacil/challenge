import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('chat-room', 'Integration | Component | chat room', {
  integration: true
});

test('it renders', function(assert) {
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });
  
  this.render(hbs`{{chat-room name="Chat Teste"}}`);

  assert.equal(this.$('h1').text().trim(), 'Chat Teste');
});
