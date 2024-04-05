  const price = () => {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("keyup", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue/10)
 
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = (inputValue-Math.floor(inputValue/10))
});
};
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);