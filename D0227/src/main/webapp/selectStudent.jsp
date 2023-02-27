<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<%@include file="nav.jsp" %>

	<section>
		<h3>학사 정보 목록</h3>
		<%@include file="dbconn.jsp" %>
		<%
			ResultSet rs=null;
			PreparedStatement pstmt=null;
			String sql="select count(*) from stud0224";
			int count=0;
			try{
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()){
					count=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		%>
		<p>총 <%=count %>명의 학사정보가 있습니다.</p>
		<table id="tab2" border=1>
			<tr>
				<th>학번</th>
				<th>성명</th>
				<th>학과</th>
				<th>학년</th>
				<th>주소</th>
				<th>연락처</th>
				<th>취미</th>
				<th>관리</th>
			</tr>
			<%
				
				sql="select * from stud0224";
				try{
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
					String id=rs.getString("studno");
					String name=rs.getString("name");
					String dept=rs.getString("dept");
					String position=rs.getString("position");
					String address=rs.getString("address");
					String phone=rs.getString("phone");
					String hobby=rs.getString("hobby");
					
			%>
			<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=dept %></td>
				<td><%=position %></td>
				<td><%=address %></td>
				<td><%=phone %></td>
				<td><%=hobby %></td>
				<td>
					<a href="studentUpdate.jsp?id=<%=id%>">수정</a>/
					<a href="studentDelete.jsp?id=<%=id %>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
				</td>
			</tr>
			<%
			}
				}catch(Exception e){
			%>
					<script>
						alert("stud0224 테이블 읽기 실패");
						history.back(-1);
					</script>
			<%

				e.printStackTrace();
				}
			%>
		</table>
		<div align=center>
			<button type="button" onclick="location.href='insertStudent.jsp'" id="btn1">학사정보 추가</button>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>