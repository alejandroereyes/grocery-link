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
        <div className='row'>
          <div className='col-md-12'>
            <div onClick={this.handleClick} className='btn btn-default'>{word}</div>
          </div>
        </div>
        <div className='row'>
          <div className='col-md-12'>
            {this.renderData()}
          </div>
        </div>
      </div>
    )
  },

  renderData: function () {
    if (this.state.on) {
       return (<GetHighItems />);
    } else {
       return '';
    }
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
        <div className='row'>
          <div className='col-md-12'>
            <div onClick={this.handleClick} className='btn btn-default'>{word}</div>
          </div>
        </div>
        <div className='row'>
          <div className='col-md-12'>
            {this.renderData()}
          </div>
        </div>
      </div>
    )
  },

  renderData: function () {
    if (this.state.on) {
       return (<GetLowItems />);
    } else {
       return '';
    }
  },

  handleClick: function () {
    var status = this.state.on ? false : true;
    this.setState({on: status})
  }
});
