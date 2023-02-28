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
				alert("교과목 코드를 입력하세요.");
				document.frm.id.focus();
				return false;
			}
			if(document.frm.subject_name.value==""){
				alert("과목명을 입력하세요.");
				document.frm.subject_name.focus();
				return false;
			}
			if(document.frm.credit.value==""){
				alert("학점을 입력하세요.");
				document.frm.credit.focus();
				return false;
			}
			if(document.frm.lecturer.value=="담당강사 선택"){
				alert("담당강사를 선택하세요.");
				document.frm.lecturer.focus();
				return false;
			}
			if(document.frm.start_hour.value==""){
				alert("시작 시간을 입력하세요");
				document.frm.start_hour.focus();
				return false;
			}
			if(document.frm.end_hour.value==""){
				alert("종료 시간을 입력하세요");
				document.frm.end_hour.focus();
				return false;
			}
			document.frm.submit();
				
		}
	</script>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%@ include file="nav.jsp" %>
	<%@ include file="dbconn.jsp" %>
	<%
		String id=request.getParameter("id");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select subject_name,credit,lecturer,week,start_hour,end_hour from sub0224 where id=?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				String subject_name=rs.getString("subject_name");
				String credit=rs.getString("credit");
				String lecturer=rs.getString("lecturer");
				String week=rs.getString("week");
				String start_hour=rs.getString("start_hour");
				String end_hour=rs.getString("end_hour");
				
		
	%>
	<section>
		<h3>교과목 추가</h3>
		<form name="frm" method="post" action="subjectUpdateProcess.jsp">
			<table id="tab1" border=1>
				<tr>
					<th>교과목 코드</th>
					<td><input type="text" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="subject_name" value="<%=subject_name%>"></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit" value="<%=credit%>"></td>
				</tr>
				<tr>
					<th>담당강사</th>
					<td>
						<select name="lecturer">
							<option value="담당강사 선택" selected>담당강사 선택</option>
							<% 
								sql="select idx,name from lecturer0224";
								try{
									pstmt=conn.prepareStatement(sql);
									rs=pstmt.executeQuery();
									while(rs.next()){
										String idx=rs.getString("idx");
										String name=rs.getString("name");
							%>
								<option value="<%=idx%>" <%if(lecturer.equals(idx)){%>selected<%}%>><%=name %></option>
							<%
									}
								}catch(Exception e){
									System.out.println("강사 테이블 조회 실패");
									e.printStackTrace();
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>요일</th>
					<td>
						<input type="radio" value="1" name="week"<%if(week.equals("1")){%>checked<%} %>>월
						<input type="radio" value="2" name="week"<%if(week.equals("2")){%>checked<%} %>>화
						<input type="radio" value="3" name="week"<%if(week.equals("3")){%>checked<%} %>>수
						<input type="radio" value="4" name="week"<%if(week.equals("4")){%>checked<%} %>>목
						<input type="radio" value="5" name="week"<%if(week.equals("5")){%>checked<%} %>>금
						<input type="radio" value="6" name="week"<%if(week.equals("6")){%>checked<%} %>>토
						<input type="radio" value="7" name="week"<%if(week.equals("7")){%>checked<%} %>>일
					</td>
				</tr>
				<tr>
					<th>시작</th>
					<td><input type="text" name="start_hour" value="<%=start_hour%>"></td>
				</tr>
				<tr>
					<th>종료</th>
					<td><input type="text" name="end_hour" value="<%=end_hour%>"></td>
				</tr>
				<tr>
					<td colspan=2 align="center">
						<input type="button" value="목록" id="btn1" onclick="location.href='selectSubject.jsp'">
						<input type="button" value="수정" onclick="check()" id="btn1">
					</td>
				</tr>
			</table>
	<%
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("테이블 불러오기 실패");
		}
	%>
		</form>
	</section>
	<%@ include file="footer.jsp" %>
	
	
</body>
</html>