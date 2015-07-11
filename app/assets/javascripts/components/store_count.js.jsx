/* globals React */
'use strict';

var StoreCountContainer = React.createClass({

  componentWillReceiveProps: function (nextProps) {
    this.setState({storeCount: nextProps});
    console.log(nextProps);
  },

  fetchStoreCount: function () {
    $.get(
      this.props.url, function (data) {
      // this.setState({storeCount: data});
      }.bind(this)
    );
  },

  getInitialState() {
    return { storeCount: this.props.storeCount };
  },

  render() {
    this.fetchStoreCount();
    return (
      <div className="panel panel-default">
        <div className="panel-heading">Store Count</div>
        <div className="panel-body">{this.state.storeCount}</div>
      </div>
      );
  }
});

