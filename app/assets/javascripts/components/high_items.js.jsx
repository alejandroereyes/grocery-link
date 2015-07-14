/* globals React */
'use strict';

var HighItemReport = React.createClass({

  getInitialState: function () {
    return {
      highList: this.props.high_list
    }
  },

  render: function () {
    return (
      <div className=''>
        <p>this is react</p>
        <ShowList item={this.state.highList} />
      </div>
      )
  }
});

var ShowList = React.createClass ({
  render: function () {
    return (
      <p>{this.props.item}</p>
    )
  }
});
