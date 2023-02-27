<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<section>
		<%@ include file="dbconn.jsp" %>
		<h3>강사 목록</h3>
		<table border=1 id="tab2">
			<tr>
				<th>강사 코드</th>
				<th>강사 명</th>
				<th>전공</th>
				<th>세부 전공</th>
				<th>관리</th>
			</tr>
			<%
				ResultSet rs=null;
				PreparedStatement pstmt=null;
				String sql="select * from lecturer0224";
				try{
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("idx") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("major") %></td>
				<td><%=rs.getString("field") %></td>
				<td>
					<a href="lecturerUpdate.jsp?id=<%=rs.getString(1)%>">수정</a>/
					<a href="lecturerDelete.jsp?id=<%=rs.getString(1)%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
				</td>
			</tr>
			<% 
					}
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("강사 정보 읽기 실패");
				}
			%>
		</table>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>