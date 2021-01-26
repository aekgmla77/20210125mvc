package co.micol.mvc.board.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import co.micol.mvc.board.service.BoardVO;
import co.micol.mvc.common.DAO;

public class BoardsDAO extends DAO{
	//보드테이블 접속하는 dao
	private PreparedStatement psmt;
	private ResultSet rs;
	
	private final String BOARDSELECTLIST="SELECT * FROM BOARDS ORDER BY 1";
	private final String BOARDSELECT = "SELECT * FROM BOARDS WHERE BOARD_NO = ?";
	private final String BOARDINSERT = "INSERT INTO BOARDS VALUES(?, ?, ?, ?, ?)";
	private final String BOARDDELETE = "DELETE FROM BOARDS WHERE BOARD_NO = ?";
	private final String BOARDUPDATE = "UPDATE BOARDS SET TITLE=?, CONTENT=? WHERE BOARD_NO = ?";
	
	public ArrayList<BoardVO> selectList() {
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		BoardVO vo;
		
		try {
			psmt = conn.prepareStatement(BOARDSELECTLIST);
			rs = psmt.executeQuery(); //record set을 return 함.
			while(rs.next()) {
				vo = new BoardVO();
				vo.setBoardNo(rs.getInt("board_no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setCreationDate(rs.getDate("creation_date"));
                // vo 에다가 하나씩 담는 과정.
				list.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	public BoardVO select(BoardVO vo) {
		//한 개의 레코드 조회 구문 작성
		try {
			psmt = conn.prepareStatement(BOARDSELECT);
			psmt.setInt(1, vo.getBoardNo());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setBoardNo(rs.getInt("board_no"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setWriter(rs.getString("writer"));
				vo.setCreationDate(rs.getDate("creation_date"));
				// while 안 쓰는 건 어차피 값이 하나라 확인만 하면 됨.
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return vo;
	}
	
	public int insert(BoardVO vo) { //boards 테이블에 데이터를 삽입
		int n = 0;
		//여기에 입력작업을 쓴다.
		try {
			psmt = conn.prepareStatement(BOARDINSERT);
			psmt.setInt(1, vo.getBoardNo());
			psmt.setString(2, vo.getTitle());
			psmt.setString(3, vo.getContent());
			psmt.setString(4, vo.getWriter());
			psmt.setDate(5, vo.getCreationDate());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	public int update(BoardVO vo) {
		int n = 0;
		//여기에 변경작업을 쓴다.
		try {
			psmt = conn.prepareStatement(BOARDUPDATE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setInt(3, vo.getBoardNo());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	public int delete(BoardVO vo) {
		int n = 0;
		//여기에 삭제작업을 쓴다.
		try {
			psmt = conn.prepareStatement(BOARDDELETE);
			psmt.setInt(1, vo.getBoardNo());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return n;
	}
	
	private void close() {
		try {
			if(rs != null) rs.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
