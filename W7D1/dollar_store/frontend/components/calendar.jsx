import React from 'react';
import {selectDate} from '../actions';

class Calendar extends React.Component {
  constructor (props) {
    super(props);
  }

  changeDate (e) {
    console.log(this.props);
    this.props.store.dispatch(selectDate(e.target.value));
  }

  render () {
    const {date} = this.props.store.getState();
    console.log(date);
    return (
      <div>
        <label>
          <input onChange={this.changeDate.bind(this)} value={date} type="date"/>
        </label>
      </div>
    );
  }
}

export default Calendar;
