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
      <ItemReport source='/admin/high_list' box='report' />
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
        <p>this is react</p>
        <ShowList className={this.state.box} item={this.state.list} />
      </div>
    )
  }
});

var ShowList = React.createClass({
  render: function () {
    return (
      <p>{this.props.item}</p>
    )
  }
});


