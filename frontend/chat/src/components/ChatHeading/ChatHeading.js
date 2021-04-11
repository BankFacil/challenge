import React from 'react';
import PropTypes from 'prop-types';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';

const ChatHeading = ({ title }) => (
  <div>
    <AppBar position="static">
      <Toolbar>
        <Typography variant="title" color="inherit">
          { title }
        </Typography>
      </Toolbar>
    </AppBar>
  </div>
);

ChatHeading.propTypes = {
  title: PropTypes.string.isRequired
};

export default ChatHeading;
