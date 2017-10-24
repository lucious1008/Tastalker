package com.in.tastalker.controller.user;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.commons.lang3.time.FastDateFormat;

@ServerEndpoint("/broadCasting")
public class UserWebsocketBroadCasting {
	
	private static List<Session> area1List = new ArrayList<>();
	private static List<Session> area2List = new ArrayList<>();
	private static List<Session> area3List = new ArrayList<>();
	private static List<Session> area4List = new ArrayList<>();
	private static List<Session> area5List = new ArrayList<>();
	private static List<Session> area6List = new ArrayList<>();
	private static List<Session> area7List = new ArrayList<>();
	private static List<Session> area8List = new ArrayList<>();
	private static List<Session> area9List = new ArrayList<>();
	private static List<Session> area10List = new ArrayList<>();
	private static List<Session> area11List = new ArrayList<>();
	private static List<Session> area12List = new ArrayList<>();
	private static List<Session> area13List = new ArrayList<>();
	private static List<Session> area14List = new ArrayList<>();
	private static List<Session> area15List = new ArrayList<>();
	private static List<Session> area16List = new ArrayList<>();
	private static List<Session> area17List = new ArrayList<>();
	private static List<Session> area18List = new ArrayList<>();
	private static List<Session> area19List = new ArrayList<>();
	private static List<Session> area20List = new ArrayList<>();
	private static List<Session> area21List = new ArrayList<>();
	private static List<Session> area22List = new ArrayList<>();
	private static List<Session> area23List = new ArrayList<>();
	private static List<Session> area24List = new ArrayList<>();
	private static List<Session> area25List = new ArrayList<>();	
	private static Map<String,List<Session>> clients = Collections.synchronizedMap(new HashMap<String,List<Session>>());
	private static FileOutputStream fos = null;
	private static File uploadedFile = null;
	private static String fileName = null;
	private final static String filePath="C:\\Users\\user\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tastalker\\resources\\webSocket\\photo\\";
	private final static String txtPath = "C:\\Users\\user\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\tastalker\\resources\\chatLog\\";
	private static final String datePattern = "yyyyMMdd";
	private static final String timePattern = "(HH시 mm분)";
	@OnMessage
    public void processUpload(ByteBuffer msg, boolean last, Session session) {		
        while(msg.hasRemaining()) {        	
            try {
                fos.write(msg.get());                                                
            } catch (IOException e) {               
                e.printStackTrace();
            }
        }
    }
	
	
	@OnOpen
	public void onOpen(Session session){		
		String area = session.getRequestParameterMap().get("area").get(0);		
		switch (area) {
		case "강남구":area1List.add(session);
		clients.put("1",area1List);
			break;
		case "강동구":area2List.add(session);
		clients.put("2",area2List);
			break;
		case "강북구":area3List.add(session);
		clients.put("3",area3List);
			break;
		case "강서구":area4List.add(session);
		clients.put("4",area4List);
			break;
		case "관악구":area5List.add(session);
		clients.put("5",area5List);
			break;
		case "광진구":area6List.add(session);
		clients.put("6",area6List);
			break;
		case "구로구":area7List.add(session);
		clients.put("7",area7List);
			break;
		case "금천구":area8List.add(session);
		clients.put("8",area8List);
			break;
		case "노원구":area9List.add(session);
		clients.put("9",area9List);
			break;
		case "도봉구":area10List.add(session);
		clients.put("10",area10List);
			break;
		case "동대문구":area11List.add(session);
		clients.put("11",area11List);
			break;
		case "동작구":area12List.add(session);
		clients.put("12",area12List);
			break;
		case "마포구":area13List.add(session);
		clients.put("13",area13List);
			break;
		case "서대문구":area14List.add(session);
		clients.put("14",area14List);
			break;
		case "서초구":area15List.add(session);
		clients.put("15",area15List);
			break;
		case "성동구":area16List.add(session);
		clients.put("16",area16List);
			break;
		case "성북구":area17List.add(session);
		clients.put("17",area17List);
			break;
		case "송파구":area18List.add(session);
		clients.put("18",area18List);
			break;
		case "양천구":area19List.add(session);
		clients.put("19",area19List);
			break;
		case "영등포구":area7List.add(session);
		clients.put("20",area20List);
			break;
		case "용산구":area20List.add(session);
		clients.put("21",area21List);
			break;
		case "은평구":area21List.add(session);
		clients.put("22",area22List);
			break;
		case "종로구":area22List.add(session);
		clients.put("23",area23List);
			break;
		case "중구":area23List.add(session);
		clients.put("24",area24List);
			break;
		case "중랑구":area7List.add(session);
		clients.put("25",area25List);
			break;
		}

	}
	
	@OnClose
	public void onClose(Session session){
		String area = session.getRequestParameterMap().get("area").get(0);
		switch (area) {
		case "강남구":area1List.remove(session);
		clients.put("1",area1List);
			break;
		case "강동구":area2List.remove(session);
		clients.put("2",area2List);
			break;
		case "강북구":area3List.remove(session);
		clients.put("3",area3List);
			break;
		case "강서구":area4List.remove(session);
		clients.put("4",area4List);
			break;
		case "관악구":area5List.remove(session);
		clients.put("5",area5List);
			break;
		case "광진구":area6List.remove(session);
		clients.put("6",area6List);
			break;
		case "구로구":area7List.remove(session);
		clients.put("7",area7List);
			break;
		case "금천구":area8List.remove(session);
		clients.put("8",area8List);
			break;
		case "노원구":area9List.remove(session);
		clients.put("9",area9List);
			break;
		case "도봉구":area10List.remove(session);
		clients.put("10",area10List);
			break;
		case "동대문구":area11List.remove(session);
		clients.put("11",area11List);
			break;
		case "동작구":area12List.remove(session);
		clients.put("12",area12List);
			break;
		case "마포구":area13List.remove(session);
		clients.put("13",area13List);
			break;
		case "서대문구":area14List.remove(session);
		clients.put("14",area14List);
			break;
		case "서초구":area15List.remove(session);
		clients.put("15",area15List);
			break;
		case "성동구":area16List.remove(session);
		clients.put("16",area16List);
			break;
		case "성북구":area17List.remove(session);
		clients.put("17",area17List);
			break;
		case "송파구":area18List.remove(session);
		clients.put("18",area18List);
			break;
		case "양천구":area19List.remove(session);
		clients.put("19",area19List);
			break;
		case "영등포구":area20List.remove(session);
		clients.put("20",area20List);
			break;
		case "용산구":area21List.remove(session);
		clients.put("21",area21List);
			break;
		case "은평구":area22List.remove(session);
		clients.put("22",area22List);
			break;
		case "종로구":area23List.remove(session);
		clients.put("23",area23List);
			break;
		case "중구":area24List.remove(session);
		clients.put("24",area24List);
			break;
		case "중랑구":area25List.remove(session);
		clients.put("25",area25List);
			break;
		}
	}
	
	@OnError
	public void onError(Session session, Throwable t){
		System.out.println(t.getMessage());
	}
	@OnMessage
	public void onMessage(String message,Session session){		
		String area = session.getRequestParameterMap().get("area").get(0);
		String rank = session.getRequestParameterMap().get("rank").get(0);
		String sid = session.getRequestParameterMap().get("SID").get(0);
		String particle = "";
		String particle2 = "";
		Date date = new Date();
		String fileDate = FastDateFormat.getInstance(datePattern).format(date);
		String timeData = FastDateFormat.getInstance(timePattern).format(date);
		File txtLog;		
		
		
		if(message.length()>16){
			particle = message.substring(0, 18);
			particle2 = message.substring(0, 19);
		}else {
			particle = "0";
			particle2 = "0";
		}
		
		if(particle.equals("tastyPictureUpload")){			
			if(!particle2.equals("tastyPictureUploads")){				
				fileName=message.substring(message.indexOf(':')+1);				
				uploadedFile = new File(filePath+fileName);				
				try {
					fos = new FileOutputStream(uploadedFile);					
				} catch (FileNotFoundException e) {
					System.out.println(e.getMessage());
				}
			}else{
				try {				
					fos.flush();
					fos.close();					
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
				switch (area) {
				case "강남구":synchronized (clients.get("1")) {					
					for (Session client : clients.get("1")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+timeData+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"\\강남구.txt");
								
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}
					
				}
					break;
				case "강동구":synchronized (clients.get("2")) {
					for (Session client : clients.get("2")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/강동구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}
					
				}
					break;
				case "강북구":synchronized (clients.get("3")) {
					for (Session client : clients.get("3")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/강북구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}
					
				}		
					break;
				case "강서구":synchronized (clients.get("4")) {
					for (Session client : clients.get("4")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/강서구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}
					
				}			
					break;
				case "관악구":synchronized (clients.get("5")) {
					for (Session client : clients.get("5")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/관악구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}
					
				}			
					break;
				case "광진구":synchronized (clients.get("6")) {
					for (Session client : clients.get("6")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/광진구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}
					
				}			
					break;
				case "구로구":synchronized (clients.get("7")) {
					for (Session client : clients.get("7")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/구로구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;
				case "금천구":synchronized (clients.get("8")) {
					for (Session client : clients.get("8")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/금천구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "노원구":synchronized (clients.get("9")) {
					for (Session client : clients.get("9")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/노원구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "도봉구":synchronized (clients.get("10")) {
					for (Session client : clients.get("10")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/도봉구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "동대문구":synchronized (clients.get("11")) {
					for (Session client : clients.get("11")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/동대문구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "동작구":synchronized (clients.get("12")) {
					for (Session client : clients.get("12")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/동작구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "마포구":synchronized (clients.get("13")) {
					for (Session client : clients.get("13")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/마포구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "서대문구":synchronized (clients.get("14")) {
					for (Session client : clients.get("14")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								txtLog= new File(txtPath+fileDate+"/서대문구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "서초구":synchronized (clients.get("15")) {
					for (Session client : clients.get("15")) {
						/*if(!client.equals(session)){*/
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/서초구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						/*}*/
					}			
				}			
					break;	
				case "성동구":synchronized (clients.get("16")) {
					for (Session client : clients.get("16")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/성동구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
					//	}
					}			
				}			
					break;	
				case "성북구":synchronized (clients.get("17")) {
					for (Session client : clients.get("17")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/성북구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "송파구":synchronized (clients.get("18")) {
					for (Session client : clients.get("18")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/송파구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "양천구":synchronized (clients.get("19")) {
					for (Session client : clients.get("19")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/양천구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "영등포구":synchronized (clients.get("20")) {
					for (Session client : clients.get("20")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/영등포구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "용산구":synchronized (clients.get("21")) {
					for (Session client : clients.get("21")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/용산구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "은평구":synchronized (clients.get("22")) {
					for (Session client : clients.get("22")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/은평구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "종로구":synchronized (clients.get("23")) {
					for (Session client : clients.get("23")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/종로구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "중구":synchronized (clients.get("24")) {
					for (Session client : clients.get("24")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/중구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;	
				case "중랑구":synchronized (clients.get("25")) {
					for (Session client : clients.get("25")) {
						//if(!client.equals(session)){
							try {
								client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+fileName+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
								File folder = new File(txtPath+fileDate);
								if(!folder.exists())folder.mkdir();
								txtLog= new File(txtPath+fileDate+"/중랑구.txt");
								BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
								fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span><img src='/resources/webSocket/photo/"+fileName+"' width='150px' height='150px'> "+timeData+"</span></li><br>\r\n");
								fw.flush();
								fw.close();
							} catch (IOException e) {
								System.out.println(e.getMessage());
							}
						//}
					}			
				}			
					break;				
				}
			}
		}else{
			switch (area) {
			case "강남구": synchronized(clients.get("1")) {
				for (Session client : clients.get("1")) {				
					/*if(!client.equals(session)){*/					
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+timeData+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"\\강남구.txt");							
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					/*}*/
				}
				
			}
				break;
			case "강동구":synchronized (clients.get("2")) {
				for (Session client : clients.get("2")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/강동구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}
				
			}
				break;
			case "강북구":synchronized (clients.get("3")) {
				for (Session client : clients.get("3")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/강북구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}
				
			}		
				break;
			case "강서구":synchronized (clients.get("4")) {
				for (Session client : clients.get("4")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/강서구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}
				
			}			
				break;
			case "관악구":synchronized (clients.get("5")) {
				for (Session client : clients.get("5")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/관악구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}
				
			}			
				break;
			case "광진구":synchronized (clients.get("6")) {
				for (Session client : clients.get("6")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/광진구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}
				
			}			
				break;
			case "구로구":synchronized (clients.get("7")) {
				for (Session client : clients.get("7")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/구로구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;
			case "금천구":synchronized (clients.get("8")) {				
				System.out.println(session);
				for (Session client : clients.get("8")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/금천구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "노원구":synchronized (clients.get("9")) {
				for (Session client : clients.get("9")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/노원구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "도봉구":synchronized (clients.get("10")) {
				for (Session client : clients.get("10")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/도봉구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
				//	}
				}			
			}			
				break;	
			case "동대문구":synchronized (clients.get("11")) {
				for (Session client : clients.get("11")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/동대문구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "동작구":synchronized (clients.get("12")) {
				for (Session client : clients.get("12")) {
				//	if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/동작구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
				//	}
				}			
			}			
				break;	
			case "마포구":synchronized (clients.get("13")) {
				for (Session client : clients.get("13")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/마포구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "서대문구":synchronized (clients.get("14")) {
				for (Session client : clients.get("14")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/서대문구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "서초구":synchronized (clients.get("15")) {
				for (Session client : clients.get("15")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/서초구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "성동구":synchronized (clients.get("16")) {
				for (Session client : clients.get("16")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/성동구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "성북구":synchronized (clients.get("17")) {
				for (Session client : clients.get("17")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/성북구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "송파구":synchronized (clients.get("18")) {
				for (Session client : clients.get("18")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/송파구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "양천구":synchronized (clients.get("19")) {
				for (Session client : clients.get("19")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/양천구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
				//	}
				}			
			}			
				break;	
			case "영등포구":synchronized (clients.get("20")) {
				for (Session client : clients.get("20")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/영등포구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "용산구":synchronized (clients.get("21")) {
				for (Session client : clients.get("21")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/용산구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "은평구":synchronized (clients.get("22")) {
				for (Session client : clients.get("22")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/은평구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "종로구":synchronized (clients.get("23")) {
				for (Session client : clients.get("23")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/종로구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "중구":synchronized (clients.get("24")) {
				for (Session client : clients.get("24")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/중구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;	
			case "중랑구":synchronized (clients.get("25")) {
				for (Session client : clients.get("25")) {
					//if(!client.equals(session)){
						try {
							client.getBasicRemote().sendText(sid+":tastakerChattingSlash:"+message+":tastakerChattingSlash:"+" "+":tastakerChattingSlash:"+rank);
							File folder = new File(txtPath+fileDate);
							if(!folder.exists())folder.mkdir();
							txtLog= new File(txtPath+fileDate+"/중랑구.txt");
							BufferedWriter fw = new BufferedWriter(new FileWriter(txtLog,true));									
							fw.write("<li class='othersChatSide'><span class='othersChatBox'><span class='myChatId'><img src='picture/"+rank+".png'>"+sid+" : </span>"+message+" "+timeData+"</span></li><br>\r\n");
							fw.flush();
							fw.close();
						} catch (IOException e) {
							System.out.println(e.getMessage());
						}
					//}
				}			
			}			
				break;				
			}
		}
	}


}
