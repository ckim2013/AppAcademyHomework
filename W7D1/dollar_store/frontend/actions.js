export const selectCurrency = (baseCurrency, rates, date) => {
  return {
    type: "SWITCH_CURRENCY",
    baseCurrency,
    rates,
    date
  };
};

export const selectDate = (date) => {
  return {
    type: "SWITCH_DATE",
    date
  };
};
