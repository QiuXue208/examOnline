package tools;
import java.sql.*;
import tools.ConnDB;
public class DeleteRow {

	ConnDB conn = new ConnDB();
	public DeleteRow() {
		//constructor
	}
	
	public void deleteRow (String type,int ID) throws SQLException {
		
		String deleteSql = "delete from " + type + " where ID = " + ID; 
		int result = conn.executeUpdate(deleteSql);
		//�ٽ�ID����ǰһλ
		String updateSql = "";
		ResultSet rs_sum = conn.executeQuery("select ID from " + type + " where ID > " + ID + "order by ID");
		int id = 0;
		while(rs_sum.next()){
			id = rs_sum.getInt("ID");
			updateSql= "update " + type + " set ID = "+ (id-1) + "where ID = " + id;
			int result1 = conn.executeUpdate(updateSql);
			if(result1 == 0){
				System.out.print("<script>alert('��������');window.location.href = './exam_" + type + ".jsp?type=" + type + "'</script>");
			}
		}			
		if(result != 0){
			System.out.print("<script>alert('ɾ���ɹ���');window.location.href = './exam_" + type + ".jsp?type=" + type + "'</script>");
		}else{
			System.out.print("<script>alert('��������');window.location.href = './exam_" + type + ".jsp?type=" + type + "'</script>");
		}
	}

}
