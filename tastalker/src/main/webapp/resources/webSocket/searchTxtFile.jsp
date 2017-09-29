<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.BufferedReader, java.io.File,java.io.FileReader,java.io.IOException,java.io.PrintWriter" %>
<!DOCTYPE html>
<%


final String filePath = "C:\\Users\\user\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tastalker\\resources\\chatLog\\";

String fileNm = request.getParameter("fileNm");
try {
	BufferedReader br = new BufferedReader(new FileReader(new File(filePath+fileNm)));
	String s = "";
      while ((s = br.readLine()) != null) {
        out.print(s);        
      }
      br.close();      
      out.close();
} catch (IOException e) {
	System.out.println(e.getMessage());
}




%>
