window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {    
    const inputValue = priceInput.value;  
    console.log(inputValue);

  const priceContent = document.getElementById("add-tax-price");
  priceContent.innerHTML = (Math.floor(inputValue*0.1))

  const priceProfit = document.getElementById('profit')
  priceProfit.innerHTML = (Math.floor(inputValue*0.9))

  })

 
  
})