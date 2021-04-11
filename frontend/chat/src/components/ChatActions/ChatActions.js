import React from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Grid from '@material-ui/core/Grid';
import styles from './chatActions.css';

const ChatActions = ({ onSubmitMessage, onMessageTyping, message }) => (
  <div className={styles.base}>
    <Grid container alignItems="center" spacing={16}>
      <Grid item xs={9} md={10}>
        <TextField
          placeholder="Type your message here"
          className={styles.textField}
          value={message}
          autoFocus
          fullWidth
          onChange={(ev) => onMessageTyping(ev.target.value)}
          onKeyPress={(ev) => ev.key === 'Enter' && onSubmitMessage(message)}
        />
      </Grid>
      <Grid 
        className={styles.sendWrapper}
        item
        xs={3}
        md={2}
        justify="center"
      >
        <Button 
          onClick={() => message && onSubmitMessage(message)}
          variant="contained"
          color="primary"
          className={styles.sendBtn}
        >
          Send
        </Button>   
      </Grid>
    </Grid>
  </div>
);

export default ChatActions;
