/* globals React */
'use strict';

var GetLowItems = React.createClass({
  render: function () {
    return (
      <ItemReport source='/admin/low_list' box={this.props.box} />
    )
  }
});

var GetHighItems = React.createClass({
  render: function () {
    return (
      <ItemReport source='/admin/high_list' box={this.props.box} />
    )
  }
});

var ItemReport = React.createClass({

  getInitialState: function () {
    return {
      list: this.props.list,
      box: this.props.box
    }
  },

  componentWillMount: function () {
    jQuery.ajax({
      method: 'GET',
      url: this.props.source
    }).done(function (response) {
      this.setState({
        list: response
      });
    }.bind(this));
  },

  render: function () {
    return (
      <div className=''>
        <ShowList className={this.state.box} item={this.state.list} />
      </div>
    )
  }
});

var ShowList = React.createClass({
  render: function () {
    var list = this.props.item;
    if (list) {
      var items = list.map(function (item) { return (<li>{item.name}</li>); });
      return (<div>{items}</div>);
    } else {
      return (<div/>);
    }

  }
});


