// JavaScript Document
$(document).ready(function () {
  //职位搜索-热门搜索选项卡
  var oLihot = document.getElementById("tabcompany1").getElementsByTagName("li");
  var oUlhot = document.getElementById("contentcompany1").getElementsByTagName("ul");
  for(var i = 0; i < oLihot.length; i++)
  {
		oLihot[i].index = i;
		oLihot[i].onclick = function ()
        {
        	console.log($("#cid").val());
           for(var n = 0; n < oLihot.length; n++)
	          oLihot[n].className="";		
			  this.className = "Active";		
			  for(var n = 0; n < oUlhot.length; n++) 
				 oUlhot[n].style.display = "none";	
				 oUlhot[this.index].style.display = "block";
				 if(oUlhot[this.index].title == ""){			
					 $.parser.parse(oUlhot[this.index]);
					 oUlhot[this.index].title = "parsed";
				 }
	   }	
   }
})