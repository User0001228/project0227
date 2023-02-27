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
		String sql="delete from stud0224 where studno=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
	%>
		<script>
			alert("학사정보를 삭제했습니다.");
			location.href="selectStudent.jsp";
		</script>		
	<%
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("삭제 실패");
		}
	%>
</body>
</html>