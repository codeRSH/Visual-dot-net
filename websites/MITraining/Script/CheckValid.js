var amt;

function CheckRequiredFields(x)
{
    //alert(x)
   if(x == "")
    {
        return false;
    }
   else
    {
        return true;
    }
}



function CheckInteger(x)
{
    if (isNaN(x))
     {
        return false;
     }
     else
     {
        return true;
     }
}



function CheckEmail(str)
{
//alert(str)
    if (str != "")
    {
        return (str.indexOf(".") > 2) && (str.indexOf("@") > 0);
    }
    else
    {
        return true;
    }
}                                                         

function validDate(fld) {
				var testMo, testDay, testYr, inpMo, inpDay, inpYr, msg
				var inp = fld.value
				status = ""
				
				var testDate = new Date(inp)
				
				testMo = testDate.getMonth() + 1
				testDay = testDate.getDate()
				testYr = testDate.getFullYear()
				
				inpMo = parseInt(inp.substring(0, inp.indexOf("/")), 10)
				inpDay = parseInt(inp.substring((inp.indexOf("/") + 1), inp.lastIndexOf("/")), 10)
				inpYr = parseInt(inp.substring((inp.lastIndexOf("/") + 1), inp.length), 10)
				
				if (isNaN(inpMo) || isNaN(inpDay) || isNaN(inpYr)) {
					msg = "There is some problem with your date entry."
				}
				if (isNaN(testMo) || isNaN(testDay) || isNaN(testYr)) {
					msg = "Couldn't convert your entry to a valid date. Try again."
				}
				if (testMo != inpMo || testDay != inpDay || testYr != inpYr) {
					msg = "Check the range of your date value."
				}
				if (msg) {
					alert(msg)
					setTimeout("doSelection(document.forms['" + 
					fld.form.name + "'].elements['" + fld.name + "'])", 0)
					return false
				} else {
					
					status = (testDate.toLocaleDateString) ? testDate.toLocaleDateString() : 
						"Date OK"
					return true
				}
			}
			
			


// simple RegEx patterns to make life easy.

var reOneOrMoreDigits = /[\d+]/;

var reNoDigits = /[^\d]/gi;



function doMask(textBox) {



	var keyCode = event.which ? event.which : event.keyCode;



	// enter, backspace, delete and tab keys are allowed thru

	if(keyCode == 13 || keyCode == 8 || keyCode == 9 || keyCode == 46)

		return true;



	// get character from keyCode....dealing with the "Numeric KeyPad" 

	// keyCodes so that it can be used

	var keyCharacter = cleanKeyCode(keyCode);



	// grab the textBox value and the mask

	var val = textBox.value;

	var mask = textBox.mask;



	// simple Regex to check if key is a digit

	if(reOneOrMoreDigits.test(keyCharacter) == false)

		return false;

	

	// get value minus any masking by removing all non-numerics

	val = val.replace(reNoDigits,'');			



	// add current keystroke

	val += keyCharacter;



	// mask it...val holds the existing TextBox.value + the current keystroke

	textBox.value = val.maskValue(mask);

	

	setCaretAtEnd(textBox);



	return false;

}

// puts starting chars in field

function onFocusMask(textBox) {

	var val = textBox.value;

	var mask = textBox.mask;

	if(val.length == 0 || val == null) {

		var i = mask.indexOf('#');

		textBox.value = mask.substring(0,i);

	}

	setCaretAtEnd(textBox);

	// set just in case.

	textBox.maxlength = mask.length;

}

// blank field if no digits entered

function onBlurMask(textBox) {

	var val = textBox.value;

	// if no digits....nada entered.....blank it.

	if(reOneOrMoreDigits.test(val) == false) {

		textBox.value = '';

	}

}

String.prototype.maskValue = function(mask) {

	var retVal = mask;

	var val = this;



	//loop thru mask and replace #'s with current value one at a time

	// better way of doing this ???

	for(var i=0;i<val.length;i++) {

		retVal = retVal.replace(/#/i, val.charAt(i));

	}

	// get rid of rest of #'s

	retVal = retVal.replace(/#/gi, "");

	return retVal;

}

// The Numeric KeyPad returns keyCodes that ain't all that workable.

//

// ie: KeyPad '1' returns keyCode 97 which String.fromCharCode converts to an 'a'.

//

// This cheesy way allows the Numeric KeyPad to be used

function cleanKeyCode(key)

{

	switch(key)

	{

		case 96: return "0"; break;

		case 97: return "1"; break;

		case 98: return "2"; break;

		case 99: return "3"; break;

		case 100: return "4"; break;

		case 101: return "5"; break;

		case 102: return "6"; break;

		case 103: return "7"; break;

		case 104: return "8"; break;

		case 105: return "9"; break;

		default: return String.fromCharCode(key); break;

	}

}

// From:

// http://www.faqts.com/knowledge_base/view.phtml/aid/1159/fid/130

function setCaretAtEnd (field) {

  if (field.createTextRange) {

    var r = field.createTextRange();

    r.moveStart('character', field.value.length);

    r.collapse();

    r.select();

  }

}






