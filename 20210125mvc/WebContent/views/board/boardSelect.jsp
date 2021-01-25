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
	<div><h1>게시글 상세화면 보기</h1></div>
	<div>
		<table border="1">
			<tr>
				<th width="60">글 번호</th>
				<td width="40" align="center">${vo.boardNo }</td>
				<th width="100">작성자</th>
				<td width="100" align="center">${vo.writer }</td>
				<th width="100">작성일자</th>
				<td width="100" align="center">${vo.creationDate }</td>
			</tr>
			<tr>
				<th width="100">제 목</th>
				<td colspan="5">&nbsp;${vo.title }</td>
			</tr>
			<tr>	
				<th width="150">내 용</th>
				<td colspan="5"><textarea rows="5" cols="100">${vo.content }</textarea></td>
			</tr>
		</table>
	</div><br/>
	<div>
		<button type="button" onclick="location.href='/20210125mvc/BoardList.do'">목록보기</button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="location.href='/20210125mvc/BoardDelete.do?row='+ ${vo.boardNo }">글 삭제</button>
	</div>
</div>
</body>
</html>