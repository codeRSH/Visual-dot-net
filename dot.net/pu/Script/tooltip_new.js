
/***********************************************
java script for tooltip
***********************************************/

var type_for_tooltip='';
var x_pos=0;
var offsetxpoint=-60 //Customize x offset of tooltip
var offsetypoint=20 //Customize y offset of tooltip
var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""
//alert(tipobj)
function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thecolor, thewidth)
{
	if (ns6||ie)
	{

		if (typeof thewidth!="undefined") 
		{
			//if ((screen.width>=1024) && (screen.height>=768))
			tipobj.style.width=thewidth+"px"
			//else
			//tipobj.style.width=200+"px"
		}
		if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
		//alert(tipobj.innerHTML)
		tipobj.innerHTML=thetext
		//alert(tipobj.innerHTML)
		//tipobj.style.display=''
		enabletip=true
		return false
	}
}

function positiontip(e){
if (enabletip){
var curX=(ns6)?e.pageX : event.clientX+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.clientY+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var rightedge=ie&&!window.opera? ietruebody().clientWidth-event.clientX-offsetxpoint : window.innerWidth-e.clientX-offsetxpoint-20
var bottomedge=ie&&!window.opera? ietruebody().clientHeight-event.clientY-offsetypoint : window.innerHeight-e.clientY-offsetypoint-20

var leftedge=(offsetxpoint<0)? offsetxpoint*(-1) : -1000

//if the horizontal distance isn't enough to accomodate the width of the context menu
if (rightedge<tipobj.offsetWidth)
{
//move the horizontal position of the menu to the left by it's width
//section added by Gaurav on 7 Nov 2006 to handle position of Tip in top band
	//added to find screen resolution
	if(ie)
	{
		if ((screen.width>=1024) && (screen.height>=768))
		{
			x_pos=610;
			tipobj.style.left=635+"px";
		}
		else
		{
			x_pos=650;
			tipobj.style.left=550+"px";
		}
	}
	else
	{
		//alert(tipobj.style.fontsize);
		//tipobj.style.left=window.pageXOffset+e.clientX-tipobj.offsetWidth+"px";
		x_pos=560;
		//tipobj.style.left=618+"px"; //for 1024*768
		//tipobj.style.left=480+"px"; // for 800*600
		tipobj.style.left=550+"px";
	}
	if(type_for_tooltip=='payment_tip')
		tipobj.style.left=150+"px";
//alert('1');
	//tipobj.style.left=ie? ietruebody().scrollLeft+event.clientX-tipobj.offsetWidth+"px" : window.pageXOffset+e.clientX-tipobj.offsetWidth+"px"
//end of section added by Gaurav on 7 Nov 2006 to handle position of Tip in top band
}
else if (curX<leftedge)
{
//alert('2');
	x_pos=5;
	tipobj.style.left=5+"px";
	if(type_for_tooltip=='payment_tip')
		tipobj.style.left=150+"px";
}
else
{
//alert('3');
//position the horizontal position of the menu where the mouse is positioned
	x_pos=curX+offsetxpoint;
	//alert(x_pos);
	tipobj.style.left=curX+offsetxpoint+"px";
	if(type_for_tooltip=='payment_tip')
		tipobj.style.left=150+"px";
}

if(x_pos<100)
{
	if ((screen.width>=1024) && (screen.height>=768))
		tipobj.style.left=150+"px";
	else
	{
		//alert(type_for_tooltip)
		//if(type=='top_band_tip')
		if(type_for_tooltip=='top_band_tip')
			tipobj.style.left=150+"px";
		else
			tipobj.style.left=140+"px";
	}
}
//same concept with the vertical position
if (bottomedge<tipobj.offsetHeight)
{
	//section added by Gaurav on 7 Nov 2006 to handle position of Tip in top band
	if(ie)
	{
		if(type_for_tooltip=='clustering_profession_tip')
                {
                        tipobj.style.top=35+"px";
                }
		else
		{
			if(ietruebody().scrollTop+event.clientY-tipobj.offsetHeight-offsetypoint<0)
				tipobj.style.top=18+"px";
			else
			{
				tipobj.style.top=ietruebody().scrollTop+event.clientY-tipobj.offsetHeight-offsetypoint+"px"
				tipobj.style.top=245+"px";
			}
			if(type_for_tooltip=='mem_comparison_tip')
			{
				tipobj.style.top=530+"px";
			}
		}
	}
	else if(navigator.userAgent.indexOf("Firefox")==-1)
	{
		if(type_for_tooltip=='clustering_profession_tip')
			tipobj.style.top=32+"px";
	}
	else
	{
		if(type_for_tooltip=='clustering_profession_tip')
		{
			tipobj.style.top=35+"px";
		}
		else
		{
			if(window.pageYOffset+e.clientY-tipobj.offsetHeight-offsetypoint<0)
				tipobj.style.top=10+"px";
			else
				tipobj.style.top=window.pageYOffset+e.clientY-tipobj.offsetHeight-offsetypoint+"px"
			//alert(tipobj.style.top)
		}
	}
	
	//tipobj.style.top=ie? ietruebody().scrollTop+event.clientY-tipobj.offsetHeight-offsetypoint+"px" : window.pageYOffset+e.clientY-tipobj.offsetHeight-offsetypoint+"px"
	//end of section added by Gaurav on 7 Nov 2006 to handle position of Tip in top band
}
else
tipobj.style.top=curY+offsetypoint+"px"
tipobj.style.visibility="visible"
if(tipobj.style.top<0)
	{
		tipobj.style.top=20+"px";
	}

}

}

function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
}
}

document.onmousemove=positiontip

function ddrivetip_new(photochecksum,photo_type,width)
{
	var width;
	//devjs.infoedge.com to be removed and ser2.jeevansathi.com to be uncommented for live	
	if(photo_type=='ALBUMPHOTO1')
		//var img1="<img src='http://ser2.jeevansathi.com/profile/photo_serve.php?profileid="+photochecksum+"&photo=ALBUMPHOTO1'>";
		var img1="<img src='/profile/photo_serve.php?profileid="+photochecksum+"&photo=ALBUMPHOTO1'>";
	else if(photo_type=='ALBUMPHOTO2')
		//var img1="<img src='http://ser2.jeevansathi.com/profile/photo_serve.php?profileid="+photochecksum+"&photo=ALBUMPHOTO2'>";
		var img1="<img src='/profile/photo_serve.php?profileid="+photochecksum+"&photo=ALBUMPHOTO2'>";
	else if (photo_type=='B_RS')
                var img1="<img src='/P/images/Bold-Listing-Layer.gif'>";
        else if (photo_type=='B_DOL')
                var img1="<img src='/P/images/Bold-Listing-Layer_dol.gif'>";
        else if (photo_type=='M_RS')
                var img1="<img src='/P/images/matri-profile-layer.gif'>";
        else if (photo_type=='M_DOL')
                var img1="<img src='/P/images/matri-profile-layer_dol.gif'>";
	else
		//var img1="<img src='http://ser2.jeevansathi.com/profile/photo_serve.php?profileid="+photochecksum+"&photo=PROFILEPHOTO'>";
		//var img1="<img src='http://devjs.infoedge.com/profile/photo_serve.php?profileid="+photochecksum+"&photo=PROFILEPHOTO'>";
		var img1="<img src='ser2.jeevansathi.com/profile/photo_serve.php?profileid="+photochecksum+"&photo=PROFILEPHOTO'>";
	if (width==undefined)
		width=150;
	ddrivetip(img1,'#FFFFFF',width);
}


