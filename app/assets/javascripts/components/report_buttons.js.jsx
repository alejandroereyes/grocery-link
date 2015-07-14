/* globals React */
'use strict';

var HighReportButton = React.createClass ({

  getInitialState: function () {
    return {
      on: false,
      source: '/admin/high_list',
    }
  },

  render: function () {
    var word = this.state.on ? 'Close Report' : 'Get Report';
    return (
      <div onClick={this.handleClick} className='btn btn-default'>{word}</div>
    )
  },

  handleClick: function () {
    var status = this.state.on ? false : true;
    this.setState({on: status})
  }
});

var LowReportButton = React.createClass ({

  getInitialState: function () {
    return {
      on: false,
      source: 'admin/low_list',
    }
  },

  render: function () {
    var word = this.state.on ? 'Close Report' : 'Get Report';
    return (
      <div onClick={this.handleClick} className='btn btn-default'>{word}</div>
    )
  },

  handleClick: function () {
    var status = this.state.on ? false : true;
    this.setState({on: status})
  }
});
