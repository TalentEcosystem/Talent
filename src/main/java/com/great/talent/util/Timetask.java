package com.great.talent.util;



import com.great.talent.controller.WebSocketServlet;
import com.great.talent.entity.GoodNews;
import com.great.talent.service.HomePageService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 开启定时任务，定时向客户端发送最新的消息
 */
@Component
@EnableScheduling
public class Timetask
{
	private static Logger logger = LoggerFactory.getLogger(Timetask.class);
	@Resource
	private HomePageService homePageService;
	String Str="";
	@Scheduled(cron = "0 */2 * * * ?")
	public void test() throws IOException {
		System.err.println("*********   定时任务执行   **************");
		Random random=new Random();
		int n=random.nextInt(2);
		if (n == 0)
		{

			List list = homePageService.getNewCompany();
			for (int i = 1; i <= list.size(); i++)
			{
				Str +=i + "、热烈欢迎：|" + list.get(i-1) + "| 企业入驻本平台";
			}
		}else if(n == 1){

				List<GoodNews> goodNewsList=homePageService.getGoodNews();
				for (int i = 0; i <goodNewsList.size() ; i++)
				{
					GoodNews goodNews=goodNewsList.get(i);
					Str+=i+1+"、"+goodNews.getCompanyname()+" |发布招聘信息 职位："+goodNews.getPositionname()+" |薪资："+goodNews.getMoney()+" |招收人数："+goodNews.getMaxnum()+"人 |要求："+goodNews.getRequest()+" |工作地点："+goodNews.getPositionaddress();
				}

		}



		ConcurrentHashMap<String, WebSocketServlet> webSocketHashMap = WebSocketServlet.getWebSocketHashMap();
		HashMap<String, String> hashMap = WebSocketServlet.getHashMap();
		System.err.println("进入webSocketHashMap遍历"+webSocketHashMap.size());
		System.err.println("进入map遍历"+hashMap.size());
		for (Map.Entry<String, WebSocketServlet> entry : webSocketHashMap.entrySet()) {
			try
			{
				webSocketHashMap.get(entry.getKey()).sendMessage("最新消息："+Str);
			} catch (IOException e)
			{
				e.printStackTrace();
			}

		}
		System.err.println("/n 定时任务完成.......");
	}



}
