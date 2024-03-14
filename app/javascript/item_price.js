document.addEventListener("turbo:load", function() {
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = Math.floor(inputValue/10)
 
  const addProfitDom = document.getElementById("profit");
  addProfitDom.innerHTML = (inputValue-Math.floor(inputValue/10))
})
})