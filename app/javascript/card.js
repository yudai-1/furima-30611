const pay = () => {
  Payjp.setPublicKey("pk_test_e46304e848d1c845edd36b80")
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("card[number]"),
      cvc: formData.get("card[cvc]"),
      exp_month: formData.get("card[exp-month]"),
      exp_year: `20${formData.get("card[exp-year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      
      }

      document.getElementById("card-number").removeAttribute("card[number]");
      document.getElementById("card-cvc").removeAttribute("card[cvc]");
      document.getElementById("card-exp-month").removeAttribute("card[exp-month]");
      document.getElementById("card-exp-year").removeAttribute("card[exp-year]");  

      document.getElementById("charge-form").submit();          
    });    
  });
};

window.addEventListener("load", pay);
