package tools;

public class chStr {
    //��������������
	public String chStr(String str) {
		//������Ϊ��ʱ
		if (str == null) { 
			str = ""; 
		} else {
			try {
				//���ַ���ת��Ϊgbk����
				//trim()����ɾ���ַ�����ͷβ�հ׷�
				str=(new String(str.getBytes("iso-8859-1"),"UTF-8")).trim();
			} catch (Exception e) {
				//����쳣��Ϣ
				e.printStackTrace(System.err); 
			}
		}
		//����ת����ı���
		return str;
	}

	//��ʾ�ı��е� �س����� �ո��Լ���֤HTML��ǵ��������return
	public String convertStr(String str1) {
		if (str1 == null) {
			str1 = "";
		} else {
			try {
				str1 = str1.replaceAll("<", "&lt;");// �滻�ַ����е�"<"��">"�ַ�����֤HTML��ǵ��������
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
