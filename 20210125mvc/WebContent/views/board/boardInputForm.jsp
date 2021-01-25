<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/menu.jsp" />
<div align="center">
	<div><h1>게시글 작성</h1></div>
	<div>
	<form id="frm" name="frm" action="/20210125mvc/BoardInput.do" method="post">
		<table border="1">
			<tr>
				<th width="10">글 번호</th>
				<td width="10" align="center">
					<input type="text" id="boardNo" name="boardNo">
				</td>
				<th width="50">작성자</th>
				<td width="50" align="center">
					<input type="text" id="writer" name="writer">
				</td>
				<th width="100">작성일자</th>
				<td width="110" align="center">
					<input type="date" id="creationDate" name="creationDate">
				</td>
			</tr>
			<tr>
				<th width="100">제 목</th>
				<td colspan="5">
					<input type="text" id="title" name="title" size="100">
				</td>
			</tr>
			<tr>	
				<th width="150">내 용</th>
				<td colspan="5"><textarea id="content" name="content" rows="5" cols="102"></textarea></td>
			</tr>
		</table>
		 <div>
			<button type="submit">저장하기</button> &nbsp;&nbsp;
			<button type="reset">취소</button>
		 </div>
	   </form>
	</div><br/>
</div>
</body>
</html>