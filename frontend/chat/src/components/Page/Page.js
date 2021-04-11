import React from 'react';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';

import styles from './page.css';

const Page = ({children}) => (
  <div className={styles.wrapper}>
    <Grid container justify="center">
      <Grid item xs={12} md={7}>
        <Paper>
          {children}
        </Paper>
      </Grid>
    </Grid>
  </div>
)

export default Page;
