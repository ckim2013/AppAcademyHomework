import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.fetchSearchGiphys = props.fetchSearchGiphys;
    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
    this.resetState = this.resetState.bind(this);
    this.state = {searchTerm: ""};
  }

  handleChange(e) {
    this.setState({searchTerm: e.target.value});
  }

  handleSubmit(e) {
    e.preventDefault();
    console.log(this.state.searchTerm);
    this.fetchSearchGiphys(this.state.searchTerm).then(this.resetState);
  }

  resetState() {
    this.setState({searchTerm: ""});
    console.log("HELLO");
  }

  render () {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>Search
            <input onChange={this.handleChange} type="text" value={this.state.searchTerm} />
          </label>
          <input type="submit" value="SUBMIT"/>
          // Needs to be input not button you stupid pubnub!
        </form>
        <GiphysIndex giphys={this.props.giphys}/>
      </div>
    );
  }
}

export default GiphysSearch;
