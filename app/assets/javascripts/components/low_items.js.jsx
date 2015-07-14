/* globals React */
'use strict';

var LowItemReport = React.createClass({

  getInitialState: function () {
    return {
      lowList: this.props.low_list
    }
  },

  render: function () {
    return (
      <div className=''>
        <p>this is react</p>
        <ShowList item={this.state.lowList} />
      </div>
    )
  },

});

var ShowList = React.createClass({
  render: function () {
    return (
      <p>{this.props.item}</p>
    )
  }
});
