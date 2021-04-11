import React from 'react';
import styles from './messagesPanel.css';

const MessagesPanel = ({ children }) => (
  <ul className={styles.base}>
    { children }
  </ul>
);

export default MessagesPanel;
