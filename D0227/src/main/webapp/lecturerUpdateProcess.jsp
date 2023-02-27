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
		String sql="update lecturer0224 set name=?, major=?, field=? where idx=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("name"));
			pstmt.setString(2, request.getParameter("major"));
			pstmt.setString(3, request.getParameter("field"));
			pstmt.setString(4, request.getParameter("id"));
			pstmt.executeUpdate();
	%>
		<script>
			alert("강사 수정 성공");
			location.href="selectLecturer.jsp";
		</script>
	<%
		}catch(Exception e){
			System.out.println("강사 정보 조회 실패");
			e.printStackTrace();
		}
	%>
</body>
</html>