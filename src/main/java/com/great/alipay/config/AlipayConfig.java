package com.great.alipay.config;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.support.HttpRequestWrapper;

import java.io.FileWriter;
import java.io.IOException;
import java.net.URI;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016102400750170";

	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCWfW8xoeCQ32tTthTQKzrbCq5gPzQhXdzzQndrUHJfhaY22nGuXMaNaS/BWho0nn1BroSR0bywupjdCiZu+UnPn/Mvl1thgOOUnTjmKY0Na4b/tu8LdT0spyNifPq6ynSPjaVnjM9Dm9L1vTNiqxUyIjZ/52Oy8RNC18Z3XBGyxhCMkWP9nZi4MkaZxSdIrZ9dGEzukuhgA1h69OVZRggievwtSKe0N1QwX9k9a4zKu9y1D+r9X1MvnRtfn9x0iMd6kgBCYDxnLdnW1kwrLxPHvRBkMv5AiC7HZC3gOxeuaMNBJIhiBHB7RsXpLz5/NN87TorJiNIk0XM4we4HTqMzAgMBAAECggEBAJXiPnIncRu5ehL5AcfHlqn8/God6RTmgJ7D716x1Agxe7ecX6cy/gpv3kFsNTd9NvHJGH6Hb7BxWLimWFsk7I/fFf2reTcmgQROhxIuBi98jgt4LqOx1Aj6OrLoGW0bIXastDXrN691rmpUU66NCOJS0wcW9eSOWQm1ERVmXLY5I3ZRwMKxZe5iHn9Sp5CA1CMT+r6wYjHXZOTnPV39c99q6WrVyvhJU7u70oF/s/PJjtuAm3iz2CvlDtWwcEvTIssQ9yyDjF8XpKUN3gcIZMeAuhvDW+CKXIh7rwNtiq5H1KrRmhyu06ZO6pg+WytS94KnHUk71A4sagHgemk6HAkCgYEA6ycxvsyZ9RfY+5RkMTijE/naKRkmD+Qnml32uCoyQyaAxpvK+02zezFLPuNA+qU3TfIJu0ITihPID5QwDjmxuUt7YrFeV1PWlbvtAxqCnrQVlukhJNHArGY4JFQ9cskq3BsH5YwCogcHbY4++8/dXe/GWGFHXWre2nGFVjtejP0CgYEAo9TO6Wupu6M8NUKUr1AzEF/1pooJRExlZMruvQ2mm/n6XuY0fmoxVDOX/xlYxShvCwOdE8ZDvPeenSUDjwmoGFJNCDsb7O7Frs3UlbeFci/J3zUWfI520mmMbRMg7Ad/la3DupEaFA6eXxOvG1Y81A3vSmGJcGN9Thk5VinN/+8CgYAnL4PZoKyzLAMrgUHk9eQvCv6wxJEUKtfyoF/htp5jlEH3VrTPhdY33DIGy8XjPq7lnUTD4LHy23MGLZKIfFLCZvKrspTfBoiGsSdA0iUcHzRNzpGIWi+6StpmK2eF/kHXJeX9+YPizjsNpZuXSL9BzRgHWEaVKZ7zVeF7Si9qXQKBgQCjeKeRL7VoHgPonOvhVmPtdeKWb2u5s4UEopy/FUzmm/MgGBHPBcT84JJMn4z9BVBvrAZjAdT7TBT/djxr0FXjFtP4X4qIyuODfaweS8Wi315OExnB5SFY6KqO96RE/2JmBsGjej+MPd32vpxd6Zm+eb0H+fT6qLsSX4bfm80KDwKBgHA57Q6L1GkiXc1MT/rxPr8g72/JFIFVKmxGYOp9P1udH9ejuw4J1IcFjFJlkRs4svgijtIgbbPZJue/bn/a+5/kgEbo8IEhbIfx8UloPqW/+d8oIgZD33OgWwuQYpefTsUms5vHwu5BIi4BBx2itWlfIErA9Vz9dwnoHEjj42dT";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "复制公钥\n" +
            "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp7Nps8F5vHkOdY/x8CeH0ySg2dFrwv7SmdJfWRkVuWXwEpUSlRaAlG2TiF9Qd5fdjPrjGmUe9TSZ/GAxPbn/Tw+vZc49waA1B69Uz8YWnqQavwQMMY/Vewgh5u7l6YvRgc+mMBn80KAKHWhg+7XKs/eoKL0ZVwFVsoEObygSO8G7XA8qIKEWWYIcqPcz3vE8R4I2+6radRF72TBJKXsvQq/SM6c8Gb95yxNzWRMUN1LMXdFHgikkMCelKfzPeDxvPqmZGyEWppabbyOMWIE2SMS0/+cAukSsJ9KuTCoe1eG/VlINYZcheZZ35DWANsJ2N/a0IjeOwJKolVOUnDqoDQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp
	public static String notify_url = "http://8.129.170.238:8085/mavendemo-0.0.1-SNAPSHOT/Enterprise/paymentUrls";
    //	http://127.0.0.1:8080/talent/   http://localhost:8080/paymentUr   http://127.0.0.1:8080/talent/paymentUrlS
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问http://工程公网访问地址/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp
	public static String return_url = "http://8.129.170.238:8085/mavendemo-0.0.1-SNAPSHOT/Enterprise/paymentUrl";
	//http://127.0.0.1:8080/talent/paymentUrl

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

