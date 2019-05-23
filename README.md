
<html>
<head>
<title>Random Number Table</title>
<h1 style = "position:absolute; left:450px;">Random Number Generator</h1>
 <a style = "position:absolute; top:100px; left:550px;" href="#" onclick="randomize()" class="myButton">Randomize!</a>
<script>
var cells = [];

function randomize(){
	for(i=0; i < 7; i++){
		cells[i] = [];
		for(j=0; j < 7; j++){
			cells[i][j] = Math.floor(Math.random()*10);
		}
	}

	cells[7] = [];
	calculateSums();

	populateTable();
}

function populateTable(){
  var table = document.getElementById("table1");
	for (var i=0; i<8; i++) {
		for (var j=0; j<8; j++) {
			table.rows[i].cells[j].innerHTML = cells[i][j];
		}
	}
}

function calculateSums(){
	for(i=0; i < 7; i++){
		rowsum=0;
		for(j=0; j < 7; j++){
			rowsum += cells[i][j];
		}
		cells[i][7] = rowsum;
	}
	for(j=0; j < 7; j++){
		colsum = 0;
		for(i=0; i < 7; i++){
			colsum += cells[i][j];
		}
		cells[7][j] = colsum;
	}

	finalsum = 0;
	for(i=0; i < 7; i++){
		finalsum += cells[i][7];
		finalsum += cells[7][i];
	}
	cells[7][7] = finalsum;
}


function randomChanges(row, col){
	cells[row][col] = Math.floor(Math.random()*10);
	calculateSums();
	populateTable();
}
</script>
<style>
table{
  border-collapse: collapse;
}
table, th, td {
background-color:pink;
  border: 1px ;
  border-color:magenta;
  border-style: solid;
  border-radius:0px;
}
td {
color:white;
font-weight: normal;
	padding: 5px;
	text-align: center;
	user-select: none;
	cursor: grab;
	width: 50px;
    height: 50px;
}

th{
  color:black;
  font-weight:bold;
  	padding: 10px;
  	text-align: center;
  	user-select: none;
  	cursor: hand;
  	width: 50px;
      height: 50px;
}

.myButton {
	-moz-box-shadow:inset 0px 1px 0px 0px #fbafe3;
	-webkit-box-shadow:inset 0px 1px 0px 0px #fbafe3;
	box-shadow:inset 0px 1px 0px 0px #fbafe3;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ff5bb0), color-stop(1, #ef027d));
	background:-moz-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:-webkit-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:-o-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:-ms-linear-gradient(top, #ff5bb0 5%, #ef027d 100%);
	background:linear-gradient(to bottom, #ff5bb0 5%, #ef027d 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff5bb0', endColorstr='#ef027d',GradientType=0);
	background-color:#ff5bb0;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #ee1eb5;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:20px;
	font-weight:bold;
	padding:10px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #c70067;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ef027d), color-stop(1, #ff5bb0));
	background:-moz-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:-webkit-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:-o-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:-ms-linear-gradient(top, #ef027d 5%, #ff5bb0 100%);
	background:linear-gradient(to bottom, #ef027d 5%, #ff5bb0 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ef027d', endColorstr='#ff5bb0',GradientType=0);
	background-color:#ef027d;
}
.myButton:active {
	position:relative;
	top:1px;
}

</style>
</head>
<body>
<center>
	<table id=table1 style = "position:absolute; top:200px; left:300px;">
		<tr id="tr1">
			<td id="tr1td1" onclick="randomChanges(0,0)">cell</td>
			<td id="tr1td2" onclick="randomChanges(0,1)">cell</td>
			<td id="tr1td3" onclick="randomChanges(0,2)">cell</td>
			<td id="tr1td4" onclick="randomChanges(0,3)">cell</td>
			<td id="tr1td5" onclick="randomChanges(0,4)">cell</td>
			<td id="tr1td6" onclick="randomChanges(0,5)">cell</td>
			<td id="tr1td7" onclick="randomChanges(0,6)">cell</td>
			<th id="tr1td8" onclick="randomChanges(0,7)">cell</th>
		</tr>
		<tr id="tr2">
			<td id="tr2td1" onclick="randomChanges(1,0)">cell</td>
			<td id="tr2td2" onclick="randomChanges(1,1)">cell</td>
			<td id="tr2td3" onclick="randomChanges(1,2)">cell</td>
			<td id="tr2td4" onclick="randomChanges(1,3)">cell</td>
			<td id="tr2td5" onclick="randomChanges(1,4)">cell</td>
			<td id="tr2td6" onclick="randomChanges(1,5)">cell</td>
			<td id="tr2td7" onclick="randomChanges(1,6)">cell</td>
			<th id="tr2td8" onclick="randomChanges(1,7)">cell</th>
		</tr>
		<tr id="tr3">
			<td id="tr3td1" onclick="randomChanges(2,0)">cell</td>
			<td id="tr3td2" onclick="randomChanges(2,1)">cell</td>
			<td id="tr3td3" onclick="randomChanges(2,2)">cell</td>
			<td id="tr3td4" onclick="randomChanges(2,3)">cell</td>
			<td id="tr3td5" onclick="randomChanges(2,4)">cell</td>
			<td id="tr3td6" onclick="randomChanges(2,5)">cell</td>
			<td id="tr3td7" onclick="randomChanges(2,6)">cell</td>
			<th id="tr3td8" onclick="randomChanges(2,7)">cell</th>
		</tr>
		<tr id="tr4">
			<td id="tr4td1" onclick="randomChanges(3,0)">cell</td>
			<td id="tr4td2" onclick="randomChanges(3,1)">cell</td>
			<td id="tr4td3" onclick="randomChanges(3,2)">cell</td>
			<td id="tr4td4" onclick="randomChanges(3,3)">cell</td>
			<td id="tr4td5" onclick="randomChanges(3,4)">cell</td>
			<td id="tr4td6" onclick="randomChanges(3,5)">cell</td>
			<td id="tr4td7" onclick="randomChanges(3,6)">cell</td>
			<th id="tr4td8" onclick="randomChanges(3,7)">cell</th>
		</tr>
		<tr id="tr5">
			<td id="tr5td1" onclick="randomChanges(4,0)">cell</td>
			<td id="tr5td2" onclick="randomChanges(4,1)">cell</td>
			<td id="tr5td3" onclick="randomChanges(4,2)">cell</td>
			<td id="tr5td4" onclick="randomChanges(4,3)">cell</td>
			<td id="tr5td5" onclick="randomChanges(4,4)">cell</td>
			<td id="tr5td6" onclick="randomChanges(4,5)">cell</td>
			<td id="tr5td7" onclick="randomChanges(4,6)">cell</td>
			<th id="tr5td8" onclick="randomChanges(4,7)">cell</th>
		</tr>
		<tr id="tr6">
			<td id="tr6td1" onclick="randomChanges(5,0)">cell</td>
			<td id="tr6td2" onclick="randomChanges(5,1)">cell</td>
			<td id="tr6td3" onclick="randomChanges(5,2)">cell</td>
			<td id="tr6td4" onclick="randomChanges(5,3)">cell</td>
			<td id="tr6td5" onclick="randomChanges(5,4)">cell</td>
			<td id="tr6td6" onclick="randomChanges(5,5)">cell</td>
			<td id="tr6td7" onclick="randomChanges(5,6)">cell</td>
			<th id="tr6td8" onclick="randomChanges(5,7)">cell</th>
		</tr>
		<tr id="tr7">
			<td id="tr7td1" onclick="randomChanges(6,0)">cell</td>
			<td id="tr7td2" onclick="randomChanges(6,1)">cell</td>
			<td id="tr7td3" onclick="randomChanges(6,2)">cell</td>
			<td id="tr7td4" onclick="randomChanges(6,3)">cell</td>
			<td id="tr7td5" onclick="randomChanges(6,4)">cell</td>
			<td id="tr7td6" onclick="randomChanges(6,5)">cell</td>
			<td id="tr7td7" onclick="randomChanges(6,6)">cell</td>
			<th id="tr7td8" onclick="randomChanges(6,7)">cell</th>
		</tr>
		<tr id="tr8">
			<th id="tr8td1" onclick="randomChanges(7,0)">cell</th>
			<th id="tr8td2" onclick="randomChanges(7,1)">cell</th>
			<th id="tr8td3" onclick="randomChanges(7,2)">cell</th>
			<th id="tr8td4" onclick="randomChanges(7,3)">cell</th>
			<th id="tr8td5" onclick="randomChanges(7,4)">cell</th>
			<th id="tr8td6" onclick="randomChanges(7,5)">cell</th>
			<th id="tr8td7" onclick="randomChanges(7,6)">cell</th>
			<th id="tr8td8" onclick="randomChanges(7,7)" style="color:green" !important>cell</th>
		</tr>
	</table>
</center>

<script>
randomize();
</script>
</body>
</html>

<html>
<head>
  <div class="container">
    <div class="row">
        <div class="col-md-6">
            <h3 class="progress-title">HTML5 - 60%</h3>
            <div class="progress">
                <div class="progress-bar progress-bar-danger" style="width:60%;"></div>
            </div>
            <h3 class="progress-title">CSS3 - 90%</h3>
            <div class="progress">
                <div class="progress-bar progress-bar-info " style="width:90%;"></div>
            </div>
        </div>
    </div>
</div>
<style>
.progress-title{
    font-size: 18px;
    font-weight: 700;
    color: #1c2647;
    margin: 0 0 10px;
}
.progress{
    height: 30px;
    background: #fff;
    border-top: 5px solid #1c2647;
    border-bottom: 5px solid #1c2647;
    border-right: 5px solid #1c2647;
    border-left: 5px solid #1c2647;
    border-radius: 0;
    margin-bottom: 25px;
    overflow: visible;
    position: relative;
}


.progress .progress-bar{
    border: none;
    color: white;
    background-color: green;
    box-shadow: none;
}

</style>
</head>
</html>


<!DOCTYPE html>
<html>
<head>
<h1> Progress Bar</h1>
<style>
#myProgress {
  width: 100%;
  background-color: grey;
}

#myBar {
  width: 50%;
  height: 30px;
  background-color: green;
  text-align: center;
  line-height: 30px;
  color: white;
}
</style>
</head>
<body>


<div id="myProgress">
  <div id="myBar">50%</div>
</div>


<script>
function start(){
var elem = document.getElementById("myBar");
var current = 50;

function moveLeft(){
if(current>0){
current += -10;
elem.style.width = current + '%'; 
elem.innerHTML = current * 1  + '%';
  }
}

function moveRight(){
if(current<100){
current += 10;
elem.style.width = current + '%'; 
      elem.innerHTML = current * 1  + '%';
      }
}

function moveDown(){
elem.style.width = 0 + '%';
elem.innerHTML = 0  + '%';
current = 0;

}
function moveUp() {
   elem.style.width = 100 + '%';
elem.innerHTML = 100  + '%'; 
current =100;
}
document.addEventListener('keydown', function(event){
//37 left arrow
//39 right arrow
//38 up arrow
//40 down arrow
    if(event.keyCode == 37){//left arrow key
    moveLeft();
    }
	else if(event.keyCode == 39){
	moveRight();
	}
	else if(event.keyCode == 38){
    moveUp();
	}
	else if(event.keyCode == 40){
    moveDown();
	}
	
} );}

window.onload=start;
</script>

</body>
</html>
