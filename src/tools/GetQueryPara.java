package tools;
public class GetQueryPara{
	public String [] getQueryPara(String str) {
		String [] queryList = str.split("[&]");
		String [] needsStr = {"",""};
		for(int i=0;i<queryList.length;i++){
			String [] equalList = queryList[i].split("[=]");
		    needsStr[i] = equalList[1];
		}
		return needsStr;
	}
}
