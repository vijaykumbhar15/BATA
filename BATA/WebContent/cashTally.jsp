<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Cash Inventory</title>

	<link rel="stylesheet" href="css/demo.css">
	<link rel="stylesheet" href="css/form-basic.css">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
	 
	    
	    <ul class="nav navbar-nav navbar-right">
	      <li><a href="showStoreManagerForm.jsp ">Back</a></li>
	    </ul>
	  
	</nav>
	<div class="main-content">

        <!-- You only need this form and the form-basic.css -->

        <form class="form-basic" name= "cashtally" method="post" action="#" onsubmit="ClearFields();" oninput="pk.value+date.value">

            <div class="form-title-row">
                <h1>Cash Inventory</h1>
            </div>
						
			
			<div class="form-row">
                <label>
                    <span>Store Code</span>
                    <input type="number" name="storecode" id="storecode" tabIndex="1">
                </label>
            </div>
			<input type="text" name="date" id="date" hidden>
			<input type="text" name="pk" id="pk" hidden>
			
			<div class="form-row">
                <label>
                    <span>Opening Cash In Hand</span>
                    <input type="number" name="openingcash" id="openingcash" tabIndex="2">
                </label>
            </div>

            <div class="form-row">
                <label>
                    <span>Turnover as Per POS</span>
                    <input type="number" name="turnover" id="turnover" tabIndex="3">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Impresst Cash</span>
                    <input type="text" name="impresstcash" id="impresstcash" tabIndex="4">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Total A</span>
                    <input type="number" name="totala" id="totala" readonly>
                </label>
            </div>
		
			<div class="form-row">
                <label>
                    <span>Cash Remitamce (CMS)</span>
                    <input type="number" name="cms" id="cms" tabIndex="5">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Credit Card Remittance</span>
                    <input type="number" name="ccremittance" id="ccremittance" tabIndex="6">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>DD Remitamce</span>
                    <input type="number" name="ddremittance" id="ddremittance" tabIndex="7">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Pending Expenses</span>
                    <input type="number" name="expenses" id="expenses" tabIndex="8">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Current Credit Card </span>
                    <input type="number" name="ccc" id="ccc" tabIndex="9">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Loyalty Points</span>
                    <input type="number" name="lp" id="lp" tabIndex="10">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Gift Vouchers</span>
                    <input type="number" name="gv" id="gv" tabIndex="11">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Wallets</span>
                    <input type="number" name="wallet" id="wallet" tabIndex="12">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Electricity Bill </span>
                    <input type="number" name="electricity" id="electricity" tabIndex="13">
                </label>
            </div>
			
			
			<div class="form-row">
                <label>
                    <span>Notes of 2000</span>
                    <input type="number" name="rs2000" id="rs2000" tabIndex="14">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Notes of 500</span>
                    <input type="number" name="rs500" id="rs500" tabIndex="15">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Notes of 200</span>
                    <input type="number" name="rs200" id="rs200" tabIndex="16">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Notes of 100</span>
                    <input type="number" name="rs100" id="rs100" tabIndex="17">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Notes of 50</span>
                    <input type="number" name="rs50" id="rs50" tabIndex="18">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Notes of 20</span>
                    <input type="number" name="rs20" id="rs20" tabIndex="19">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Notes of 10</span>
                    <input type="number" name="rs10" id="rs10" tabIndex="20">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Coins</span>
                    <input type="number" name="coins" id="coins" tabIndex="21">
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Cash in Hand</span>
                    <input type="number" name="cash" id="cash" tabIndex="22" readonly>
                </label>
            </div>
			
			
						
			<div class="form-row">
                <label>
                    <span>Total B</span>
                    <input type="number" name="totalb" id="totalb" readonly>
                </label>
            </div>
			
			<div class="form-row">
                <label>
                    <span>Shortage / Excess</span>
                    <input type="number" name="result" id="result" readonly>
                </label>
            </div>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript">

$(window).bind("pageshow", function(event) {
    if (event.originalEvent.persisted) {
        window.location.reload(); 
    }
});


		var inputs = document.querySelectorAll("input,select");
	
	for (var i = 0 ; i < inputs.length; i++) {
						inputs[i].addEventListener("keypress", function(e)
														{
														if (e.which == 13) {
																			e.preventDefault();
																			var nextInput = document.querySelectorAll('[tabIndex="' + (this.tabIndex + 1) + '"]');
																			if (nextInput.length === 0) {
																										nextInput = document.querySelectorAll('[tabIndex="1"]');
																										}
																			nextInput[0].focus();
																			}
														}
													)	
												} 
	
	$(function(){
	
            $('#openingcash, #impresstcash, #turnover, #storecode').keyup(function(){
               var openingcash = parseFloat($('#openingcash').val()) || 0;
			   var turnover = parseFloat($('#turnover').val()) || 0;
               var impresstcash = parseFloat($('#impresstcash').val()) || 0;
               $('#totala').val(openingcash + turnover + impresstcash);		  

var date = new Date();
document.getElementById("date").value = (date.getMonth() + 1) + '/' + date.getDate() + '/' + date.getFullYear();
			   
			   var pk = document.getElementById('storecode').value; //Project Title
				   pk  += document.getElementById('date').value; //Project type
				   document.getElementById('pk').value=pk;
            });
			
			
			$('#cms, #ccremittance, #ddremittance, #lp, #gv, expenses, #wallet, #ccc, #cash').keyup(function(){
               var cms = parseFloat($('#cms').val()) || 0;
			   var ccremittance = parseFloat($('#ccremittance').val()) || 0;
			   var ddremittance = parseFloat($('#ddremittance').val()) || 0;
               var lp = parseFloat($('#lp').val()) || 0;
			   var gv = parseFloat($('#gv').val()) || 0;
			   var expenses = parseFloat($('#expenses').val()) || 0;
			   var wallet = parseFloat($('#wallet').val()) || 0;
			   var ccc = parseFloat($('#ccc').val()) || 0;
			   var cash = parseFloat($('#cash').val()) || 0;
			   var r2000 = (parseFloat($('#rs2000').val())*2000) || 0;
			   var r500 = (parseFloat($('#rs500').val())*500) || 0;
			   var r200 = (parseFloat($('#rs200').val())*200) || 0;
			   var r100 = (parseFloat($('#rs100').val())*100) || 0;
			   var r50 = (parseFloat($('#rs50').val())*50) || 0;
			   var r20 = (parseFloat($('#rs20').val())*20) || 0;
			   var r10 = (parseFloat($('#rs10').val())*10) || 0;
			   var coins = parseFloat($('#rscoins').val()) || 0;
			   
			   $('#cash').val(r2000 + r500 + r200 + r100 + r50 + r20 + r10 + coins );	
               $('#totalb').val( cms + ccremittance + ddremittance + lp + gv + expenses + wallet + ccc + cash );
			   $('#result').val( parseFloat($('#totala').val()) - parseFloat($('#totalb').val()));  
			   
			   
            });
			
         });
		 
		 
		 const scriptURL = 'https://script.google.com/macros/s/AKfycbx1pFjLA5EbzoMgAQnoITwLuIILyxdigE4T06NUi1q8uctEvs0o/exec'
		const form = document.forms['cashtally']
	form.addEventListener('submit', e => {
    e.preventDefault()
    fetch(scriptURL, { method: 'POST', body: new FormData(form)})
      .then(response => console.log('Success!', response))
      .catch(error => console.error('Error!', error.message))
  })
  
 function ClearFields() {
		
	document.getElementById("submitbtn").style.visibility= "hidden";
	//document.getElementById("submitbtn").disabled = true;
	setTimeout(function(){ window.location.href = "rptcashtally.html"; }, 3000);
	

/*	
     document.getElementById("storecode").value = "";
     document.getElementById("openingcash").value = "";
	 document.getElementById("turnover").value = "";
	 document.getElementById("impresstcash").value = "";
	 document.getElementById("totala").value = "";
	 document.getElementById("cms").value = "";
	 document.getElementById("ccremittance").value = "";
	 document.getElementById("ddremittance").value = "";
	 document.getElementById("expenses").value = "";
	 document.getElementById("ccc").value = "";
	 document.getElementById("lp").value = "";
	 document.getElementById("gv").value = "";
	 document.getElementById("wallet").value = "";
	 document.getElementById("electricity").value = "";
	 document.getElementById("rs2000").value = "";
	 document.getElementById("rs500").value = "";
	 document.getElementById("rs200").value = "";
	 document.getElementById("rs100").value = "";
	 document.getElementById("rs50").value = "";
	 document.getElementById("rs20").value = "";
	 document.getElementById("rs10").value = "";
	 document.getElementById("coins").value = "";
	 document.getElementById("cash").value = "";
	 document.getElementById("totalb").value = "";
	 document.getElementById("result").value = "";
*/
}
		 
	</script>
	
            <div class="form-row">
                <button type="submit" id="submitbtn" tabIndex="23">Submit Cash Tally</button>
            </div>

        </form>

    </div>
</body>
</html>