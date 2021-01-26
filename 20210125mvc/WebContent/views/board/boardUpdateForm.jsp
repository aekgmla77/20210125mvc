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
	<div><h1>게시글 수정화면</h1></div>
	<div>
	<form id="frm" name="frm" action="/20210125mvc/BoardUpdateSave.do" method="post">
		<table border="1">
			<tr>
				<th width="50">글 번호</th>
				<td width="40" align="center">
					<input type="text" id="no" name="no" value="${vo.boardNo }" readonly>
				</td>
				<th width="70">작성자</th>
				<td width="70" align="center">${vo.writer }</td>
				<th width="80">작성일자</th>
				<td width="80" align="center">${vo.creationDate }</td>
			</tr>
			<tr>
				<th width="100">제 목</th>
				<td colspan="5"><input type="text" id="title" name="title" value="${vo.title }"></td>
			</tr>
			<tr>	
				<th width="150">내 용</th>
				<td colspan="5"><textarea rows="5" cols="85" id = "content" name="content">${vo.content }</textarea></td>
			</tr>
		</table>
		 	<br/>
			<input type="submit" value="수정"> &nbsp;&nbsp;&nbsp;
			<input type="button" value="목록으로 가기" onclick="location.href='/20210125mvc/BoardList.do'">
		</form>
	</div><br/>
</div>
</body>
</html>