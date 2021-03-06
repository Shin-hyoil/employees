<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
   google.charts.load('current', {'packages':['corechart']});
   google.charts.setOnLoadCallback(drawChart);
	// servlet에서 받아온 값 저장
	var list = [['Task', 'Hours per Day']];
	<c:forEach var="item" items="${list}">

		var chartContents = [
				"${item.title}"
				, ${item.empCount}
			];
		list.push(chartContents);
	</c:forEach>
	console.log(list);
	console.log(list.length);
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable(
			list
	        );

     var options = {
       title: '직책별 사원비율'
     };
     
     var chart = new google.visualization.PieChart(document.getElementById('piechart'));

     chart.draw(data, options);
   }
 </script>
  </head>
<style>
#title {
	text-align: center;
	
}

</style>
<meta charset="UTF-8">
<title>메인 화면</title>
</head>
<body>
<hr>
<div id="titleBox">
	<h2 id="title">샘플DB employees로 구현-직책통계</h2>
</div>
<hr>
<div style="text-align: center;">
	<a href="/employees/selectEmployees" class="btn btn-outline-secondary join">사원조회</a>
	<a href="/employees/selectPosition" class="btn btn-outline-secondary join">직책통계</a>
	<a href="/employees/selectDepartments" class="btn btn-outline-secondary join">부서통계</a>
	<a href="/employees/selectSalaries" class="btn btn-outline-secondary join">연봉통계</a>
	<a href="/employees/logout" class="btn btn-outline-secondary join">로그아웃</a>
</div>
<hr>
 <div class="row">
	 <div id="piechart" class="col-sm-8" style="width: 900px; height: 500px;"></div>
	 <div class="col-sm-4">
	 	<h3>직책별 사원 수</h3>
	 	<table>
	 		<c:forEach var="item" items="${list }">
		 		<tr>
		 			<td>${item.title}</td>
		 			<td>${item.empCount}</td>
		 		</tr>
		 	</c:forEach>
	 	</table>
	 </div>
 </div>
</body>
<script>
	$("#title").click(function(){
		location.href="/employees/home"
	});
</script>
</html>