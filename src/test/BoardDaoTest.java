package test;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.BoardDao;
import dao.ConnectionFactory;
import model.BoardSearch;

public class BoardDaoTest {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		BoardDao bd = new BoardDao();

		ConnectionFactory cf = ConnectionFactory.getInstance();

		Connection conn = cf.makeConnection();
		ResultSet result = bd.getresult(conn);

		System.out.println("run");
		System.out.println("boardnamesearch����======================================");
		BoardSearch bns = new BoardSearch();
		ArrayList lst = new ArrayList();
		bns.check();
		lst = bns.getBoardnamelist();
		System.out.println("�������=" + bns.getBoardamount());

		for (int i = 0; i < lst.size(); i++) {
			String s = (String) lst.get(i);
			System.out.println(s);
		}

		System.out.println("�������չʾ======================================");
		ArrayList list = new ArrayList();
		while (result.next()) {
			list.add(result.getNString("boardname"));
		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println("i=" + i);
			System.out.println("listsize=" + list.size());
			String s = (String) list.get(i);
			System.out.println(s);
		}

	}

}
