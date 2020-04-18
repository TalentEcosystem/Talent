package com.great.talent;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@SpringBootApplication
@EnableScheduling//开启定时任务支持
public class TalentApplication
{
	public static void main(String[] args)
	{
		SpringApplication.run(TalentApplication.class, args);
	}

	@Bean
	public ServerEndpointExporter serverEndpointExporter()
	{
		return new ServerEndpointExporter();
	}



}
