function PasGenHTML(length)
{
var chars="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
var res="";
var r;
var i;
  for (i=1;i<=length;i++)
    {
     r=Math.floor(Math.random()*chars.length);
     res=res+chars.substring(r,r+1);
    }   
res = res.replace("&","&amp;");
res = res.replace(">","&gt;");
res = res.replace("<","&lt;");

return res
}

function genPassword() 
{
 if ((document.getElementById('ctl00_ContentPlaceHolder1_passLengthTextBox').value < 3) || (document.getElementById('ctl00_ContentPlaceHolder1_passLengthTextBox').value > 21)) 
 {
	 document.getElementById('generatedPassLbl').innerHTML = ''; 	 
 }
 else {
 var p = PasGenHTML(document.getElementById('ctl00_ContentPlaceHolder1_passLengthTextBox').value);
	 document.getElementById('ctl00_ContentPlaceHolder1_txtPassword').value = '';
	 document.getElementById('ctl00_ContentPlaceHolder1_txtConfirm').value = '';
	 document.getElementById('generatedPassLbl').innerHTML = '<b>Ваш пароль:</b>  &nbsp;<font face="Courier New">' + p +'</font>';
	 document.getElementById('ctl00_ContentPlaceHolder1_txtPassword').value = p;
	 document.getElementById('ctl00_ContentPlaceHolder1_txtConfirm').value = p;
 }
}