package tools;
public class GetQueryPara{
	public String [] getQueryPara(String str) {
		
//		String str =request.getQueryString();	
		String [] queryList = str.split("[&]");
		int length = queryList.length;
		String [] needsStr = new String[length];
		String [] equalList = new String[2];
		for(int i=0;i<length;i++){
			equalList = queryList[i].split("[=]");
		    needsStr[i] = equalList[1];
		}
		return needsStr;
//		String [] queryList = str.split("[&]");
//		int length = queryList.length;
//		String [] needsStr = new String[length];
//		for(int i=0;i<length;i++){
//			String [] equalList = queryList[i].split("[=]");
//		    needsStr[i] = equalList[1];
//		}
//		return needsStr;
	}
}
