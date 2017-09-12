const currentDate = () => {
  let date = new Date ();
  let tempDay = parseInt(date.getDate()) - 2;
  let day = ("0" + tempDay.toString()).slice(-2);
  let tempMonth = parseInt(date.getMonth()) + 1;
  let month = ("0" + tempMonth.toString()).slice(-2);
  let year = (date.getFullYear());
  return (year + '-' + month + '-' + day);
};

const initialState = {
  baseCurrency: "Please select",
  rates: {},
  date: currentDate()
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case "SWITCH_CURRENCY":
      return {
        baseCurrency: action.baseCurrency,
        rates: action.rates,
        date: action.date
      };
    case "SWITCH_DATE":
      return {
        baseCurrency: state.baseCurrency,
        rates: state.rates,
        date: action.date,
      };
    default:
      return state;
  }
};

// window.reducer = reducer;

export default reducer;
