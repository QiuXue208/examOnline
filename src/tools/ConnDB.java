package tools;

import java.sql.*;
import java.io.*;
import java.util.*;

public class ConnDB {
	//��ʾ���ض����ݿ������
	//ͨ��Connection���Ի�ȡһ�����ݿ�ͱ�����ݿ�������ϸ��Ϣ
	public Connection conn = null;
	//ִ�о�̬SQL���ӿڣ�������ִ�нӿ�
	public Statement stmt = null;
	//���ز�ѯ������ӿ�
	public ResultSet rs = null;
//	private static String propFileName = "/com/connDB.properties"; // ָ����Դ�ļ������λ��
	//��ȡjava�������ļ���Ҳ��connDB.properties�ļ�
//	private static Properties prop = new Properties();
	
	private static String dbDriver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private static String dbUrl = "jdbc:sqlserver://localhost:1433;DatabaseName=exam_online";
	private static String dbUser = "qiu";
	private static String dbPwd = "1234";
	
//	private static String dbDriver = "";
//	private static String dbUrl = "";
//	private static String dbUser = "";
//	private static String dbPwd = "";

//	public ConnDB() {
//		try {
////			InputStream in = getClass().getResourceAsStream(propFileName);
////			prop.load(in); // ͨ���������������Properties�ļ�
////			dbClassName = prop.getProperty("DB_CLASS_NAME"); // ��ȡ���ݿ�����
////			dbUrl = prop.getProperty("DB_URL", dbUrl);
////			dbUser = prop.getProperty("DB_USER", dbUser);
////			dbPwd = prop.getProperty("DB_PWD", dbPwd);
//			
//			//��ȡ��Դ
//			dbDriver = prop.getProperty("DB_DRIVER");
//			dbUrl = prop.getProperty("DB_URL");
//			dbUser = prop.getProperty("DB_USER");
//			dbPwd = prop.getProperty("DB_PWD");
//		} catch (Exception e) {
//			e.printStackTrace(); // ����쳣��Ϣ
//		}
//	}

	//�������ݿ�
	@SuppressWarnings("deprecation")
	public static Connection getConnection() {
		Connection conn = null;
		try {
			//���������ݿ�֮ǰ��Ҫ�����������ݿ��������Java�����,ͨ����̬����forNameʵ��
			Class.forName(dbDriver).newInstance();
			//��ȡ���ݿ�����
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd); 
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			System.err
					.println("����: DbConnectionManager.getConnection() ������ݿ�����ʧ��.\r\n\r\n��������:"
							+ dbDriver
							+ "\r\n����λ��:"
							+ dbUrl
							+ "\r\n�û�/����"
							+ dbUser + "/" + dbPwd);
		}
		//����Connection�����ʵ��
		return conn;
	}

	//ִ�в�ѯ���
	public ResultSet executeQuery(String sql) {
		try { // ��׽�쳣
			//�������ݿ⣬������Connection����ʵ��
			conn = getConnection();
			//��ȡStatement����ʹ��Statement����ִ��SQL���
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			//���ڲ����������������䣬����SELECT
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage()); 
		}
		return rs; 
	}

	/*
	 * ����:ִ�и��²���,executeUpdate�ķ���ֵ��һ����������ʾ��Ӱ�������
	 * ����CREATE TABLE��DROP TABLE���ֲ������е���䣬�䷵��ֵ��Ϊ0
	 */
	public int executeUpdate(String sql) {
		int result = 0; // ���屣�淵��ֵ�ı���
		try { 
			conn = getConnection(); 
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			//����ִ��INSERT��UPDATE��DELETE�Լ�SQL DDL�����ݶ������ԣ���CREATE TABLE��DROP TABLE��
			result = stmt.executeUpdate(sql);
		} catch (SQLException ex) {
			result = 0; 
		}
		try {
			stmt.close();
		} catch (SQLException ex1) {
		}
		return result; 
	}

	public int executeUpdate_id(String sql) {
		int result = 0; // ���屣�淵��ֵ�ı���
		try { // ��׽�쳣
			conn = getConnection(); // ����getConnection()��������Connection�����һ��ʵ��conn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql); // ִ�и��²���
			// ��ȡ�ող����¼���Զ����
			String ID = "select @@IDENTITY as id";
			rs = stmt.executeQuery(ID);
			if (rs.next()) {
				int autoID = rs.getInt("id");
				result = autoID;
			}
		} catch (SQLException ex) {
			result = 0;
		}
		return result; // ���ظող�����Զ����
	}

	/*
	 * ����:�ر����ݿ������
	 */
	public void close() {
		try {
			if (rs != null) { 
				rs.close(); 
			}
			if (stmt != null) { 
				stmt.close(); 
			}
			if (conn != null) { 
				conn.close(); 
			}
		} catch (Exception e) {
			e.printStackTrace(System.err); 
		}
	}

}

