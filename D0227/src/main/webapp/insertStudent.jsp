<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		function check(){
			if(document.frm.id.value==""){
				alert("학번을 입력하세요");
				document.frm.id.focus();
				return false;
			}
			if(isNaN(document.frm.id.value) || document.frm.id.value==0){
				alert("학번은 숫자로 구성되어 있습니다.")
				document.frm.id.focus();
				return false;
			}
			if(document.frm.name.value==""){
				alert("이름을 입력하세요");
				document.frm.name.focus();
				return false;
			}
			document.frm.submit();
		}
	</script>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>
	<section>
	<h3>학사 정보 등록 화면</h3>
	<form name="frm" method="post" action="insertStudentProcess.jsp">
		<table id="tab1" border=1>
			<tr>
				<th>학번</th>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td>
					<select name="dept">
						<option value=1 selected>컴퓨터공학과</option>
						<option value=2>기계공학과</option>
						<option value=3>전자과</option>
						<option value=4>영문학과</option>
						<option value=5>일어과</option>
						<option value=6>경영학과</option>
						<option value=7>무역학과</option>
						<option value=8>교육학과</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>학년</th>
				<td>
					<input type="radio" name="position" value=1 checked>1학년
					<input type="radio" name="position" value=2>2학년
					<input type="radio" name="position" value=3>3학년
					<input type="radio" name="position" value=4>4학년
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="프로그램">프로그램
					<input type="checkbox" name="hobby" value="독서">독서
					<input type="checkbox" name="hobby" value="등산">등산
					<input type="checkbox" name="hobby" value="여행">여행
					<input type="checkbox" name="hobby" value="낚시">낚시
					<input type="checkbox" name="hobby" value="영화보기">영화보기
					<input type="checkbox" name="hobby" value="잠자기">잠자기
					<input type="checkbox" name="hobby" value="멍때리기">멍때리기
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="Lin"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type="button" value="등록" onclick="check()" id="btn1">
					<input type="reset" value="취소" id="btn1">
				</td>
			</tr>
		</table>
	</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>