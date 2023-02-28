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
		<h3>교과목 목록</h3>
		<table border=1 id="tab2">
			<tr>
				<th>과목코드</th>
				<th>과목명</th>
				<th>학점</th>
				<th>강사코드</th>
				<th>담당강사</th>
				<th>요일</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>관리</th>
			</tr>
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				String sql="select * from sub0224 a,lecturer0224 b where a.lecturer=b.idx";
				try{
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					while(rs.next()){
						String id=rs.getString("id");
						String subject_name=rs.getString("subject_name");
						String credit=rs.getString("credit");
						String lecturer=rs.getString("lecturer");
						String lecname=rs.getString("name");
						String week=rs.getString("week");
						String start_hour=rs.getString("start_hour");
						String end_hour=rs.getString("end_hour");
					
				
			%>
			<tr>
				<td><%=id %></td>
				<td><%=subject_name %></td>
				<td><%=credit %></td>
				
				<td><%=lecturer %></td>
				<td>
					<%=lecname %>
				</td>
				<td>
					<%
						switch(week){
							case "1":
								out.print("월");
								break;
							case "2":
								out.print("화");
								break;
							case "3":
								out.print("수");
								break;
							case "4":
								out.print("목");
								break;
							case "5":
								out.print("금");
								break;
							case "6":
								out.print("토");
								break;
							case "7":
								out.print("일");
								break;
							default:
								System.out.println("뭔가 잘못됨");
							
						}
					%>
				</td>
				<td><%=start_hour %></td>
				<td><%=end_hour %></td>
				<td>
					<a href="subjectUpdate.jsp?id=<%=id%>">수정</a>/
					<a href="subjectDelete.jsp?id=<%=id%>" onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
				</td>
			</tr>
			<%
					}
				}catch(Exception e){
					System.out.println("교과목 불러오기 실패");
					e.printStackTrace();
				}
			%>
		</table>
		<div align="center">
			<input type="button" id="btn1" value="작성" onclick="location.href='insertSubject.jsp'">
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>