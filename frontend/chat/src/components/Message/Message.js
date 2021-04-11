import React from 'react';
import PropTypes from 'prop-types';
import Paper from '@material-ui/core/Paper';
import styles from './message.css';

const Message = ({text}) => (
  <div 
    className={styles.base}
    ref={el => el && el.scrollIntoView({ behavior: "smooth" })}
  >
    <Paper>
      <div className={styles.msgWrapper}>
        {text}
      </div>
    </Paper>
  </div>
);

Message.propTypes = {
  text: PropTypes.string.isRequired
}

export default Message;
