<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
		PreparedStatement pstmt=null;
		request.setCharacterEncoding("utf-8");
		String sql="update sub0224 set subject_name=?, credit=?, lecturer=?,week=?,start_hour=?,end_hour=? where id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("subject_name"));
			pstmt.setString(2, request.getParameter("credit"));
			pstmt.setString(3, request.getParameter("lecturer"));
			pstmt.setString(4, request.getParameter("week"));
			pstmt.setString(5, request.getParameter("start_hour"));
			pstmt.setString(6, request.getParameter("end_hour"));
			pstmt.setString(7, request.getParameter("id"));
			pstmt.executeUpdate();
			
			
	%>
		<script>
			alert("수정되었습니다.");
			location.href="selectSubject.jsp";
		</script>
	<%		
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>