package test;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import dao.*;
import dto.Topic;
import model.*;

public class Inserttopics {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		Topic topic =new Topic();
		topic.setBid(1);
		topic.setBody("�Զ���������");
		topic.setReplyCount(0);
		topic.setTitle("�Զ�������Ŀ");   
		topic.setUid(24);
		
		
		Connection conn =  (Connection) ConnectionFactory.getInstance().makeConnection();
		
		for (int i=0;i<100;i++){
			TopicDao topicdao=new TopicDao();
			topicdao.save(conn, topic);
		}
		

	}

}
