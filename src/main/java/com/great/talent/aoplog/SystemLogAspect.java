package com.great.talent.aoplog;

import com.great.talent.entity.Admin;
import com.great.talent.entity.SystemLog;
import com.great.talent.service.AdminService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Date;


/**
 * @author zx
 * @desc 切点类 
 */

@Aspect
@Component
public class SystemLogAspect
{

    //注入Service用于把日志保存数据库  
    @Resource
    private AdminService adminService;
    @Autowired
    private HttpSession session;

    //Controller层切点
    @Pointcut("within(com.great.talent.controller.*)&&@annotation(com.great.talent.aoplog.Log)")
    public void controllerAspect() {
    }  

    /** 
     * 后置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点 
     */  
    @After("controllerAspect()")
    public void after(JoinPoint joinPoint) throws Throwable{
        Admin admin = (Admin) session.getAttribute("admin");
        if(admin==null){
            return;
        }
         try {
            String targetName = joinPoint.getTarget().getClass().getName();  
            String methodName = joinPoint.getSignature().getName();  
            Object[] arguments = joinPoint.getArgs();  
            Class targetClass = Class.forName(targetName);  
            Method[] methods = targetClass.getMethods();
            String operationType = "";
//            String operationName = "";
             for (Method method : methods) {  
                 if (method.getName().equals(methodName)) {  
                    Class[] clazzs = method.getParameterTypes();  
                     if (clazzs.length == arguments.length) {  
                         operationType = method.getAnnotation(Log.class).operationType();
//                         operationName = method.getAnnotation(Log.class).operationName();
                         break;  
                    }  
                }  
            }
            //*========控制台输出=========*//  
//            System.out.println("=====controller后置通知开始=====");
//            System.out.println("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()")+"."+operationType);
//            System.out.println("方法描述:" + operationName);
//            System.out.println("请求人:" + admin.getName());
            //*========数据库日志=========*//  
            SystemLog log = new SystemLog();
            log.setLogname(admin.getName());
            log.setLogtype(operationType);
            log.setLogresult("正常");
            log.setLogdate(new Date());
            //保存数据库
            adminService.addLog(log);
//          System.out.println("=====controller后置通知结束=====");
        }  catch (Exception e) {  
            //记录本地异常日志  
            System.out.println("[error]:后置通知异常==>异常信息:"+e.getMessage());
        }  
    }
}