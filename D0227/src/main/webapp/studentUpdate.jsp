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
	<h3>학사 정보 수정 화면</h3>
	<%@ include file="dbconn.jsp" %>
	<%
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String id=request.getParameter("id");
		String sql="select * from stud0224 where studno=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				String name=rs.getString("name");
				String dept=rs.getString("dept");
				String position=rs.getString("position");
				String address=rs.getString("address");
				String phone=rs.getString("phone");
				String hobby=rs.getString("hobby");
				String val[]=hobby.split(",");
			
	%>
	<form name="frm" method="post" action="updateStudentProcess.jsp">
		<table id="tab1" border=1>
			<tr>
				<th>학번</th>
				<td><input type="text" name="id" value="<%=id%>"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" value="<%=name%>"></td>
			</tr>
			<tr>
				<th>학과</th>
				<td>
					<select name="dept">
						<option value=1 <%if(dept.equals("1")){%> selected<%} %>>컴퓨터공학과</option>
						<option value=2 <%if(dept.equals("2")){%> selected<%} %>>기계공학과</option>
						<option value=3 <%if(dept.equals("3")){%> selected<%} %>>전자과</option>
						<option value=4 <%if(dept.equals("4")){%> selected<%} %>>영문학과</option>
						<option value=5 <%if(dept.equals("5")){%> selected<%} %>>일어과</option>
						<option value=6 <%if(dept.equals("6")){%> selected<%} %>>경영학과</option>
						<option value=7 <%if(dept.equals("7")){%> selected<%} %>>무역학과</option>
						<option value=8 <%if(dept.equals("8")){%> selected<%} %>>교육학과</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>학년</th>
				<td>
					<input type="radio" name="position" value=1 <%=position.equals("1")?"checked" : "" %>>1학년
					<input type="radio" name="position" value=2 <%=position.equals("2")?"checked" : "" %>>2학년
					<input type="radio" name="position" value=3 <%=position.equals("3")?"checked" : "" %>>3학년
					<input type="radio" name="position" value=4 <%=position.equals("4")?"checked" : "" %>>4학년
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<val.length; i++){if(val[i].equals("프로그램"))out.print("checked"); } %>>프로그램
					<input type="checkbox" name="hobby" value="독서" <%for(int i=0;i<val.length; i++){if(val[i].equals("독서"))out.print("checked"); } %>>독서
					<input type="checkbox" name="hobby" value="등산" <%for(int i=0;i<val.length; i++){if(val[i].equals("등산"))out.print("checked"); } %>>등산
					<input type="checkbox" name="hobby" value="여행" <%for(int i=0;i<val.length; i++){if(val[i].equals("여행"))out.print("checked"); } %>>여행
					<input type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<val.length; i++){if(val[i].equals("낚시"))out.print("checked"); } %>>낚시
					<input type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<val.length; i++){if(val[i].equals("영화보기"))out.print("checked"); } %>>영화보기
					<input type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<val.length; i++){if(val[i].equals("잠자기"))out.print("checked"); } %>>잠자기
					<input type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<val.length; i++){if(val[i].equals("멍때리기"))out.print("checked"); } %>>멍때리기
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="Lin" value="<%=address%>"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="phone" value="<%=phone%>"></td>
			</tr>
			<tr>
				<td colspan=2 align=center>
					<input type="button" value="등록" onclick="check()" id="btn1">
					<input type="reset" value="취소" id="btn1">
				</td>
			</tr>
		</table>
	<%
		}
		}catch(Exception e){
			System.out.println("학사정보 읽기 실패");
			e.printStackTrace();
		}
	 %>
	</form>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>