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
		String id=request.getParameter("id");
		String sql="delete from lecturer0224 where idx=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			%>
				<script>
					alert("삭제되었습니다.");
					location.href="selectLecturer.jsp";
				</script>
			<%
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("삭제 실패");
		}
	%>
</body>
</html>