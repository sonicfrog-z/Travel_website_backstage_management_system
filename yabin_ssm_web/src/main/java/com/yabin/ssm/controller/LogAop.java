package com.yabin.ssm.controller;

import com.yabin.ssm.domain.SysLog;
import com.yabin.ssm.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {
    private Date visitTime;
    private Class clazz;
    private Method method;

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ISysLogService sysLogService;


    //Before Advice: execution time, class and method
    @Before("execution(* com.yabin.ssm.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date();
        clazz = jp.getTarget().getClass();
        String methodName = jp.getSignature().getName();
        Object[] args = jp.getArgs();

        //Get class of executed method obj
        if (args == null || args.length == 0) {
            //get method without args
            method = clazz.getMethod(methodName);
        } else {
            Class[] classArgs = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classArgs[i] = args[i].getClass();
            }
            method = clazz.getMethod(methodName, classArgs);
        }
    }

    //After Advice
    @After("execution(* com.yabin.ssm.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        String url = "";

        //get total time spent
        long time = new Date().getTime() - visitTime.getTime();

        //get the url of the executed method
        if (clazz != null && method != null && clazz != LogAop.class) {
            //1. get url inside @RequestMapping("url") on class
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (classAnnotation != null) {
                url += classAnnotation.value()[0];
            }
            //2. get url inside @RequestMapping("url") on method
            RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
            if (methodAnnotation != null) {
                url += methodAnnotation.value()[0];
            }
        }

        //get ip address
        String ip = request.getRemoteAddr();

        //get current user
        SecurityContext context = SecurityContextHolder.getContext();
        User user = (User) context.getAuthentication().getPrincipal();
        String username = user.getUsername();

        //encapsulate info into SysLog
        SysLog sysLog = new SysLog();
        sysLog.setExecutionTime(time);
        sysLog.setIp(ip);
        sysLog.setMethod("[Class name] "+clazz.getName()+" [Method name]"+method.getName());
        sysLog.setUrl(url);
        sysLog.setUsername(username);
        sysLog.setVisitTime(visitTime);

        //call Service to save log into database
        sysLogService.save(sysLog);

    }
}
