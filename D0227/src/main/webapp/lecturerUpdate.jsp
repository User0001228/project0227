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
		<form name="frm" method="post" action="lecturerUpdateProcess.jsp" >
			<table id="tab1" border=1>
				<tr>
					<th>강사 ID</th>
					<%@ include file="dbconn.jsp" %>
					<%
						ResultSet rs=null;
						PreparedStatement pstmt=null;
						String id=request.getParameter("id");
						int no=0;
						String sql="select * from lecturer0224 where idx=?";
						try{
							pstmt=conn.prepareStatement(sql);
							pstmt.setString(1, id);
							rs=pstmt.executeQuery();
							if(rs.next()){
								String name=rs.getString("name");
								String major=rs.getString("major");
								String field=rs.getString("field");
							
					%>
					<td><input type="text" name="id" id="Lin" value="<%=id%>"></td>
				</tr>
				<tr>
					<th>강사명</th>
					<td><input type="text" name="name" id="Lin" value="<%=name%>"></td>
				</tr>
				<tr>
					<th>전공</th>
					<td><input type="text" name="major" id="Lin" value="<%=major%>"></td>
				</tr>
				<tr>
					<th>세부전공</th>
					<td><input type="text" name="field" id="Lin" value="<%=field%>"></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input type="button" id="btn1" value="수정" onclick="check()">
						<input type="reset" id="btn1" value="취소">
					</td>
				</tr>
			</table>
					<%
							}
						}catch(Exception e){
							System.out.println("강사 테이블 조회 실패");
							e.printStackTrace();
						}
	
					%>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
	
</body>
</html>