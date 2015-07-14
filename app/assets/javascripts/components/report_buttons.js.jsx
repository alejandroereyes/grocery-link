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
    var sendBox = this.state.on ? 'report-goes-here' : 'hidden';
    return (
      <div>
        <div onClick={this.handleClick} className='btn btn-default'>{word}</div>
        <GetHighItems box={sendBox} />
      </div>
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
    var sendBox = this.state.on ? 'report-goes-here' : 'hidden';
    return (
      <div>
        <div onClick={this.handleClick} className='btn btn-default'>{word}</div>
        <GetLowItems box={sendBox} />
      </div>
    )
  },

  handleClick: function () {
    var status = this.state.on ? false : true;
    this.setState({on: status})
  }
});
