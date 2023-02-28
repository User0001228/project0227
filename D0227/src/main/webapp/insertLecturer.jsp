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
				alert("강사 id를 입력하세요.");
				document.frm.id.focus();
				return false;
			}
			if(document.frm.name.value==""){
				alert("강사 이름을 입력하세요.");
				document.frm.name.focus();
				return false;
			}
			if(document.frm.major.value==""){
				alert("전공을 입력하세요.");
				document.frm.major.focus();
				return false;
			}
			if(document.frm.field.value==""){
				alert("세부 전공을 입력하세요.");
				document.frm.field.focus();
				return false;
			}
			document.frm.submit();
		}
	</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<section>
		<h3>강사 추가</h3>
		<form name="frm" method="post" action="lecturerProcess.jsp" >
			<table id="tab1" border=1>
				<tr>
					<th>강사 ID</th>
					<%@ include file="dbconn.jsp" %>
					<%
						ResultSet rs=null;
						PreparedStatement pstmt=null;
						int no=0;
						String sql="select lect_seq.nextval from dual";
						try{
							pstmt=conn.prepareStatement(sql);
							rs=pstmt.executeQuery();
							if(rs.next()){
								no=rs.getInt(1);
							}
						}catch(Exception e){
							System.out.println("강사 테이블 조회 실패");
							e.printStackTrace();
						}
					%>
					<td><input type="text" name="id" id="Lin" value="<%=no%>"></td>
				</tr>
				<tr>
					<th>강사명</th>
					<td><input type="text" name="name" id="Lin"></td>
				</tr>
				<tr>
					<th>전공</th>
					<td><input type="text" name="major" id="Lin"></td>
				</tr>
				<tr>
					<th>세부전공</th>
					<td><input type="text" name="field" id="Lin"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="button" id="btn1" value="저장" onclick="check()">
						<input type="reset" id="btn1" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
	
</body>
</html>