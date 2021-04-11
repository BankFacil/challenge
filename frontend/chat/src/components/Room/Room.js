import React, { Fragment } from 'react';
import Tabs from '@material-ui/core/Tabs';
import Tab from '@material-ui/core/Tab';

import styles from './room.css';

const Room = ({children}) => (
  <Fragment>
    <Tabs value={0} className={styles.wrapper}>
      <Tab label="Room 1" />
    </Tabs>
    {children}
  </Fragment>
)

export default Room;
