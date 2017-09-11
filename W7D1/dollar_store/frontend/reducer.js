// const currentDate = () => {
//   let date = new Date ();
//
//   let day = ("0" + date.getDate()).slice(-2);
//   let month = ("0" + date.getMonth()).slice(-2);
//   let year = (date.getYear());
//
//   return (year + '-' + month + '-' + day);
// };

const initialState = {
  baseCurrency: "Please select",
  rates: {}
};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch(action.type) {
    case "SWITCH_CURRENCY":
      return {
        baseCurrency: action.baseCurrency,
        rates: action.rates
      };
    default:
      return state;
  }
};

// window.reducer = reducer;

export default reducer;
