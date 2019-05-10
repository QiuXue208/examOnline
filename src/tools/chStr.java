package tools;

public class chStr {
    //解决输出中文乱码
	public String chStr(String str) {
		//当变量为空时
		if (str == null) { 
			str = ""; 
		} else {
			try {
				//将字符串转换为gbk编码
				//trim()用于删除字符串的头尾空白符
				str=(new String(str.getBytes("iso-8859-1"),"UTF-8")).trim();
			} catch (Exception e) {
				//输出异常信息
				e.printStackTrace(System.err); 
			}
		}
		//返回转换后的变量
		return str;
	}

	//显示文本中的 回车换行 空格以及保证HTML标记的正常输出return
	public String convertStr(String str1) {
		if (str1 == null) {
			str1 = "";
		} else {
			try {
				str1 = str1.replaceAll("<", "&lt;");// 替换字符串中的"<"和">"字符，保证HTML标记的正常输出
				str1 = str1.replaceAll(">", "&gt;");
				str1 = str1.replaceAll(" ", "&nbsp;");
				str1 = str1.replaceAll("\r\n", "<br>");
			} catch (Exception e) {
				e.printStackTrace(System.err);
			}
		}
		return str1;
	}

}
