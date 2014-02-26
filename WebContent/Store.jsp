<!DOCTYPE html >
<html >
<head>
<title>Store Page Indent Record System-Polybond Insulations</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style3.css" media="screen" />
<link rel="shortcut icon" href="/images/favicon.ico" />
</head>
<body>
<script language="javascript" type="text/javascript">
var i;
var flag;
//var sno=i;
var con=0;
var d1= new Date();

function newindent()
{
	

	
	
	
	if(con==1)
	{ 
		if(!(confirm("Filled Indent will be erased Continue?")))
		{return;
			}
	}
/*	var divvar=document.getElementById("slogan");
	var  tb=document.createElement('table');
	var tr=document.createElement('tr');
		var td=document.createElement('td');
	td.innerHTML="one";
	tr.appendChild(td);
	tb.appendChild(tr);
	divvar.appendChild(tb);
	*/  
	
	var divvar=document.getElementById("slogan");
	divvar.style.height="auto";
	var d= new Date();
	d = d.toLocaleString();
i=1;
	
	var string = "<h2>Enter New Indent Details</h2><form id='indent' action='Indent.action' method='post'><table  ><tr><td>From</td><td><input type='text' name='from' required></td><td align='right' width='140px'> Indent Number:&nbsp; </td><td><input type='text' value='${indentnumber}' name='indentno' readonly='readonly'/></td><td align='right' width='140px'>Indent Date:&nbsp; </td> <td><label for='indentdate'> <date name='indentdate'>"+d+"</date></label></td> </tr></table><hr style='color:#FFFF ; height:7px '/><table id='ordertable'><tr><td>S NO.</td><td> Material Description </td><td>Department</td><td> Unit</td> <td> Quantity Required</td><td> Quantity In Stock</td><td> Quantity To Be Purchased</td><td> When Required </td><td>Place Of Uses </td><td> Remark</td><td></td></tr><tr id='row1'><td>"+i+"</td><td> <input type='text' name='description1' required /></td> <td> <select name='department1' required><option value='mech'>Mechanical</option><option value='elect'>Electrical</option><option value='prod'>Production</option><option value='admin'>Administration</option><option value='other'>Other</option></select> </td><td> <input type='number' name='unit1' min='0' class='smalltext'  required/> </td><td> <input type='number' name='requiredqty1' min='0' class='smalltext' required /> </td><td> <input type='number' min='0' name='stockqty1' class='smalltext'  required/> </td><td> <input type='number' min='0' name='purchaseqty1' class='smalltext'  required/> </td><td> <input type='date' min="+d+" name='required1'  required /> </td><td> <input type='text' name='place1' class='smalltext'  required/> </td>  <td> <input type='text' name='remark1' id='remarktext' /> </td><td></td></tr></table><table><tr><td ><a href='javascript:;' id='addrow' onclick='addrow()' class='button'>Add Row</a></td><td ><input type='submit' value='Submit' class='button-red' /></td></tr></table></form>";

	
divvar.innerHTML=string;

var ele=document.createElement('INPUT');
ele.type='hidden';
ele.name='rows';
ele.id='rows';
ele.value=1;
var frm=document.getElementById('indent');

frm.appendChild(ele);
con=1;

}
/*function ss()
{con=0;
	(document.getElementById('slogan')).innerHTML='Indent Submitted'
	var tabl=document.getElementById('ordertable');
	var rowcount=tabl.rows.length;
	var ele=document.createElement('INPUT');
	ele.type='hidden';
	ele.name='rows';
	ele.value=rowcount;
	document.getElementById('indent').appendChild(ele);
	
	var q="${rows}";
	document.writeln(q);
	
	}*/

function deleter(r)
{  //document.write("flag");
	var p = r.parentNode.parentNode.rowIndex;
document.getElementById('ordertable').deleteRow(p);



//var dd= document.getElementById('row0');
//document.getElementById("ordertable").deleteRow(0);
i--;

	}



function updatesno(m)
{var counter=0;
	try{
	 var table=document.getElementById('ordertable');
	 //var n=m+1;
	 //document.write("called");
	 
	 for ( counter=m+1;counter<=table.rows.length;counter++)
	 {	
		var x = table.rows[parseInt(""+(counter-1))].cells;
		x[0].innerHTML=""+(counter-1);
		//document.write("loop");
		 
	 }}catch(e){alert(e+" counter: 	"+counter);}
	 
	 //table.rows[++m].cells[0].innerHtml=m;	 
	//document.write(m);
	
	
	}

function addrow()
{
//	document.write("flag");
	i++;
	if(i>10)
	{i=10;
		return;} 
		
var otable=document.getElementById("ordertable");
	
	var row=otable.insertRow(i);
	var cell =new Array();
	//var element =new Array();
	for(var j=0;j<=10;j++)
	{
		cell[j]= row.insertCell(j);
		}
   cell[0].id="s"+i;
   cell[0].innerHTML=""+i;	
   
   element1 = document.createElement("input");
   	element1.type="text";
	element1.name="description"+i;
	element1.required=true;
			cell[1].appendChild(element1);
	
	element11=document.createElement("SELECT");
	element11.name='department'+i;
	var option= new Array();
	option[0]=document.createElement('OPTION');
	option[0].name = 'mech';
	option[0].value='mech';
	option[0].innerHTML = 'Mechanical';
	element11.appendChild(option[0]);
	
	option[1]=document.createElement('OPTION');
	option[1].name = 'elect';
		option[1].value='elect';
	option[1].innerHTML = 'Electrical';
	element11.appendChild(option[1]);
	option[2]=document.createElement('OPTION');
	option[2].name = 'prod';
		option[2].value='prod';
	option[2].innerHTML = 'Production';
	element11.appendChild(option[2]);
	
	
	option[3]=document.createElement('OPTION');
	option[3].name = 'admin';
		option[3].value='admin';
	option[3].innerHTML = 'Administration';
	element11.appendChild(option[3]);
	
	
	option[4]=document.createElement('OPTION');
	option[4].name = 'other';
		option[4].value='other';
	option[4].innerHTML = 'Other';
	element11.appendChild(option[4]);
	
		element11.required=true;
	cell[2].appendChild(element11);
	element2 = document.createElement("input");
	element2.type="number";
	element2.name="unit"+i;
	element2.setAttribute('min',0);
	element2.className="smalltext";
	element2.required=true;
				cell[3].appendChild(element2);
				
	element3 = document.createElement("input");
	element3.type="number";
	element3.setAttribute('min',0);
	element3.name="requiredqty"+i;
	element3.className="smalltext";
	element3.required=true;
				cell[4].appendChild(element3);

	element4 = document.createElement("input");
	element4.type="number";
	element4.setAttribute('min',0);
	element4.name="stockqty"+i;
	element4.className="smalltext";
	element4.required=true;
				cell[5].appendChild(element4);

	element5 = document.createElement("input");
	element5.type="number";
	element5.setAttribute('min',0);
	element5.name="purchaseqty"+i;
	element5.className="smalltext";
	element5.required=true;
				cell[6].appendChild(element5);

	element6 = document.createElement("input");
	element6.type="date";
	element6.name="required"+i;
	element6.required=true;
				cell[7].appendChild(element6);

	element7 = document.createElement("input");
	element7.type="text";
	element7.name="place"+i;
	element7.className="smalltext";
	element7.required=true;
				cell[8].appendChild(element7);

	element8 = document.createElement("input");
	element8.type="text";
	element8.name="remark"+i;
	element8.id="remarktext";
	
					cell[9].appendChild(element8);
	element9 = document.createElement("a");
	element9.href='javascript:;';
	element9.name="del"+i;
	element9.id="del"+i;
	element9.className='button';
//element9.addEventListener(onclick,'deleter(this)');




element9.addEventListener('click', function dynamicdelete(){ 
var ir=cell[10].parentNode.rowIndex;

document.getElementById("ordertable").deleteRow(ir);
 updatesno(ir);
 i--;
 

 });
//element9.onclick=deleter(this);
//element10.setAttribue('onclick','deleter(this)');
	var element10 = document.createTextNode('Delete');
	element9.appendChild(element10);
					cell[10].appendChild(element9);
	//cell[10].onclick=deleter(cell[10]);

//count number of rows after adding current row.
	//removing previous ele
	var counter1=document.getElementById("rows");
	var rowcount=document.getElementById('ordertable').rows.length;
	counter1.value=rowcount-1;
//	document.getElementById('indent').appendChild(ele);
//	request.setParameter("row1",i);

	if(i>=6)
	{
		var picdiv=document.getElementById("pic");
		var slogan=document.getElementById("slogan");
		picdiv.style.height=1500;
				slogan.style.height=1500;
		}
	
	
	
	}

var s=document.createAttribute("approvedindentnumber0");
s.value=20;
function addApproved(count)
{
	var t=document.getElementById('approvedindents');
	var e;
	var c=0;
	var etd = new Array();
	for(c=0;c<count;c++)
	{  e=document.createElement("TR");
		etd=new Array();
		etd[0]=document.createElement("TD"); 
		etd[0].innerHTML=c+1;
		e.appendChild(etd[0]);
		
		
		etd[1]=document.createElement("TD");
		var x =document.createElement("input");
		x.type="text";
		x.setAttribute("readOnly","readOnly");
		x.name="approvedindentnumber"+c;
		x.value="approvedindentnumber"+c;
		
		etd[1].name="approvedindentnumber"+c;
		etd[1].value="approvedindentnumber"+c;
		etd[1].appendChild(x);
		e.appendChild(etd[1]);
		var s;
		etd[2]=document.createElement("TD"); 
		etd[2].innerHTML='$'+'{'+'approvedindentdate'+c+'}';
				e.appendChild(etd[2]);
		
		etd[3]=document.createElement("TD"); 
		etd[3].innerHTML='$'+'{approvedindentapproval'+c+'}';
				e.appendChild(etd[3]);
		
		etd[4]=document.createElement("TD"); 
		etd[4].innerHTML='$'+'{approvedindentfactory'+c+'}';
				e.appendChild(etd[4]);
		
		etd[5]=document.createElement("TD"); 
		etd[5].innerHTML='$'+'{approvedindentpayment'+c+'}';
				e.appendChild(etd[5]);
		
		    t.appendChild(e);
		}
	}

function approvedindent()
{
	if(con==1)
	{ 
		if(!(confirm("Filled Indent will be erased Continue?")))
		{return;
			}
	}
	
	var divvar=document.getElementById("slogan");
var string="<table name='approvedindents' class='indenttable' id='approvedindents' align='center' > <tr><th>S NO.</th> <th>IndentNumber</th> <th>Indent Date</th><th>Approval Date</th> <th>Factory</th><th>Payment</th></table>";
	
	
var xhr= new XMLHttpRequest();
xhr.onreadystatechange= function() {
    if (xhr.readyState == 4) {
        var data = xhr.responseText;
        divvar.innerHTML=string+"<br>${approvedindents} "+data;
        
        
    }
};
	
	xhr.open('GET', 'Approved', true);
	xhr.send(null);
	con=0;
//addApproved(row);
	}
	
function pendingindent()
{if(con==1)
	{ 
		if(!(confirm("Filled Indent will be erased Continue?")))
		{return;
			}
	}
	var divvar=document.getElementById("slogan");
	
	con=0;
	divvar.innerHTML="${pending}";
	
	}	
		
		
function rejectedindent()
{if(con==1)
	{ 
		if(!(confirm("Filled Indent will be erased Continue?")))
		{return;
			}
	}
	var divvar=document.getElementById("slogan");
	divvar.innerHTML="${rejected}";
	
	con=0;
	
	}
		
</script>
<div class="content">
  <div id="top">
    
    
    <h1>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; Indent Record Sytem </h1>
    
  
  </div>
</div>


<div id="prec">
<!--div id="sidebar1">
<p><br /><img src="images/polybondlogo.png" id="logo1" /></p>
</div>-->
<div id="wrap">
<div id="left_side">
      <h3><span>Indent Record System</span></h3>
      <div id="panel" class="panel">
      <ul>
      <li><a href="javascript:;" onclick="newindent()"  > New Indent</a></li>
<li>      <a href="javascript:;" onclick="approvedindent()">Approved Indents</a></li>
<li>      <a href="javascript:;" onclick="pendingindent()">Pending Indents</a></li>
<li>      <a href="javascript:;" onclick="rejectedindent()">Rejected Indents</a></li>
</ul>
      </div>
      <h3>&nbsp;</h3>
    </div>
    <div id="pic">


      <div id="slogan">
        
      <h1> Welcome To Indent Record System</h1>
            <div id="space"></div>
      </div>
    </div>
    
  </div>
</div>
  </div>
  <div id="footer">
    <div class="right">&copy; Copyright 2014, Polybond - <a href="#home">Home</a><br />
      Design: <a href="http://www.linkedin.com/pub/animesh-jain/24/33/5ab">Animesh Jain</a></div>
  </div>
</div>
</body>
</html>