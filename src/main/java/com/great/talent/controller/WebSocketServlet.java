package com.great.talent.controller;

import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;


@ServerEndpoint("/websocket/{userno}")
@Component
public class WebSocketServlet
{

	//静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
	private static int onlineCount = 0;
	//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
	private static ConcurrentHashMap<String, WebSocketServlet> webSocketSet = new ConcurrentHashMap<String, WebSocketServlet>();

	//也是用来存放WebSocket对象 用来定时任务用
	private static HashMap<String, String> hashMap= new HashMap<String, String>();

	//与某个客户端的连接会话，需要通过它来给客户端发送数据
	private Session session;
	//当前发消息的人员编号
	private String userno = "";

	/**
	 * 连接建立成功调用的方法
	 *
	 * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	@OnOpen
	public void onOpen(@PathParam(value = "userno") String param, Session session, EndpointConfig config) {
		System.out.println(param);
		userno = param;//接收到发送消息的人员编号
		this.session = session;
		/**
		 * hashMap
		 * 这个集合是我自己创建的，用来存放userno，占时不知道怎么从webSocketSet的map里面拿数据
		 * 这个hashmap是用来新连接加入时 系统自己给相对应得在线连接发系统消息的方法用的
		 */
		//        HashMap<String, String> hashMap = new HashMap<>();
		hashMap.put(param,param);
		webSocketSet.put(param, this);//加入map中

		addOnlineCount();           //在线数加1
		System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
		/**
		 * sendSystemMessage
		 * 这里也可以根据不同的业务逻辑来改
		 */
		try
		{
			session.getBasicRemote().sendText("系统消息：本平台有最全的招聘信息、强大的团队、来自全国各地的企业！！是个求职的好平台。想找个好工作不是问题！！快来加入我们吧！！");
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		//		sendSystemMessage("系统消息:"+param,param,hashMap);//该方法也是自己改的
	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose() {
		if (!userno.equals("")) {
			webSocketSet.remove(userno);  //从set中删除
			subOnlineCount();           //在线数减1
			System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
		}
	}

	/**
	 * 收到客户端消息后调用的方法
	 *
	 * @param message 客户端发送过来的消息
	 * @param session 可选的参数
	 */
	@OnMessage
	public void onMessage(String message, Session session) {
		System.out.println("来自客户端的消息:" + message);
		//        session.get
		//群发消息
		if (1 < 2) {
			sendAll(message);
		} else {
			//给指定的人发消息
			sendToUser(message);
		}
	}

	/**
	 * 给指定的人发送消息
	 * @param message
	 */
	private void sendToUser(String message) {
		String sendUserno = message.split("[|]")[1];
		String sendMessage = message.split("[|]")[0];
		String now = getNowTime();
		try {
			if (webSocketSet.get(sendUserno) != null) {

				webSocketSet.get(sendUserno).sendMessage(now + "用户" + userno + "发来消息：" + " <br/> " + sendMessage);
			} else {
				System.out.println("当前用户不在线");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	/**
	 * 后台给客户端发生消息
	 * @param message
	 */
	private void sendSystemMessage(String message,String userno,HashMap map) {
		String sendUserno=null;
		if (map.get(userno)==userno) {
			sendUserno = userno;
		}
		String sendMessage = message;
		String now = getNowTime();
		try {
			if (webSocketSet.get(sendUserno) != null) {
				webSocketSet.get(sendUserno).sendMessage(now + "系统消息：" + " <br/> " + sendMessage);
			} else {
				System.out.println("当前用户不在线");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}



	/**
	 * 给所有人发消息
	 * @param message
	 */
	private void sendAll(String message) {
		String now = getNowTime();
		String sendMessage = message.split("[|]")[0];
		//遍历HashMap
		for (String key : webSocketSet.keySet()) {
			try {
				//判断接收用户是否是当前发消息的用户
				if (!userno.equals(key)) {
					webSocketSet.get(key).sendMessage(now + "用户" + userno + "发来消息：" + " <br/> " + sendMessage);
					System.out.println("key = " + key);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}


	/**
	 * 获取当前时间
	 *
	 * @return
	 */
	private String getNowTime() {
		Date date = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(date);
		return time;
	}
	/**
	 * 发生错误时调用
	 *
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error) {
		System.out.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 *
	 * @param message
	 * @throws IOException
	 */
	public void sendMessage(String message) throws IOException {
		this.session.getBasicRemote().sendText(message);
		//this.session.getAsyncRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		WebSocketServlet.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		WebSocketServlet.onlineCount--;
	}

	public static ConcurrentHashMap<String, WebSocketServlet> getWebSocketHashMap() {
		return webSocketSet;
	}

	public static HashMap<String, String> getHashMap() {
		return hashMap;
	}







}
