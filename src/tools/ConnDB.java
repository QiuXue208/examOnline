package tools;

import java.sql.*;
import java.io.*;
import java.util.*;

public class ConnDB {
	//表示与特定数据库的连接
	//通过Connection可以获取一个数据库和表等数据库对象的详细信息
	public Connection conn = null;
	//执行静态SQL语句接口，并返回执行接口
	public Statement stmt = null;
	//返回查询结果集接口
	public ResultSet rs = null;
//	private static String propFileName = "/com/connDB.properties"; // 指定资源文件保存的位置
	//读取java的配置文件，也即connDB.properties文件
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
////			prop.load(in); // 通过输入流对象加载Properties文件
////			dbClassName = prop.getProperty("DB_CLASS_NAME"); // 获取数据库驱动
////			dbUrl = prop.getProperty("DB_URL", dbUrl);
////			dbUser = prop.getProperty("DB_USER", dbUser);
////			dbPwd = prop.getProperty("DB_PWD", dbPwd);
//			
//			//获取资源
//			dbDriver = prop.getProperty("DB_DRIVER");
//			dbUrl = prop.getProperty("DB_URL");
//			dbUser = prop.getProperty("DB_USER");
//			dbPwd = prop.getProperty("DB_PWD");
//		} catch (Exception e) {
//			e.printStackTrace(); // 输出异常信息
//		}
//	}

	//连接数据库
	@SuppressWarnings("deprecation")
	public static Connection getConnection() {
		Connection conn = null;
		try {
			//在连接数据库之前，要加载连接数据库的驱动到Java虚拟机,通过静态方法forName实现
			Class.forName(dbDriver).newInstance();
			//获取数据库连接
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd); 
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		if (conn == null) {
			System.err
					.println("警告: DbConnectionManager.getConnection() 获得数据库链接失败.\r\n\r\n链接类型:"
							+ dbDriver
							+ "\r\n链接位置:"
							+ dbUrl
							+ "\r\n用户/密码"
							+ dbUser + "/" + dbPwd);
		}
		//返回Connection对象的实例
		return conn;
	}

	//执行查询语句
	public ResultSet executeQuery(String sql) {
		try { // 捕捉异常
			//连接数据库，并返回Connection对象实例
			conn = getConnection();
			//获取Statement对象，使用Statement对象执行SQL语句
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			//用于产生单个结果集的语句，例如SELECT
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println(ex.getMessage()); 
		}
		return rs; 
	}

	/*
	 * 功能:执行更新操作,executeUpdate的返回值是一个行数，表示受影响的行数
	 * 对于CREATE TABLE、DROP TABLE这种不操作行的语句，其返回值总为0
	 */
	public int executeUpdate(String sql) {
		int result = 0; // 定义保存返回值的变量
		try { 
			conn = getConnection(); 
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			//用于执行INSERT、UPDATE、DELETE以及SQL DDL（数据定义语言，如CREATE TABLE、DROP TABLE）
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
		int result = 0; // 定义保存返回值的变量
		try { // 捕捉异常
			conn = getConnection(); // 调用getConnection()方法构造Connection对象的一个实例conn
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			result = stmt.executeUpdate(sql); // 执行更新操作
			// 获取刚刚插入记录的自动编号
			String ID = "select @@IDENTITY as id";
			rs = stmt.executeQuery(ID);
			if (rs.next()) {
				int autoID = rs.getInt("id");
				result = autoID;
			}
		} catch (SQLException ex) {
			result = 0;
		}
		return result; // 返回刚刚插入的自动编号
	}

	/*
	 * 功能:关闭数据库的连接
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

