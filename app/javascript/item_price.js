window.addEventListener('load', () => {
  // 金額を入力した数値をpriceInputという変数に格納する
  const priceInput = document.getElementById("item-price"); //入力値
  priceInput.addEventListener("input", () => { //入力することで発火
    const addTaxDom = document.getElementById("add-tax-price"); //販売手数料のidにaddTaxDomをセット
    addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 ); //入力値×0.1を小数点以下切り捨てで表示
    const addPofitDom = document.getElementById("profit"); //販売利益のidにaddProfitDomをセット
    addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 )) //販売利益idのHTMLに入力値-入力値×0.1を小数点以下切り捨てで表示
  })
});
