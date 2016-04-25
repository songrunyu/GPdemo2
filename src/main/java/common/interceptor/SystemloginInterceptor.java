package common.interceptor;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by tqy on 16/4/25.
 */
public class SystemloginInterceptor implements HandlerInterceptor {
    private static Logger logger = Logger.getLogger(SystemloginInterceptor.class);
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        //获取url地址
        String reqUrl = httpServletRequest.getRequestURI().replace(httpServletRequest.getContextPath(), "");
        //当url地址为登录地址或者主页时跳过拦截器
        if (reqUrl.contains("userLogin") || reqUrl.contains("index.jsp")){
            return true;
        }else{
            HttpSession session = httpServletRequest.getSession();
            Object obj = session.getAttribute("username");
            if (obj == null || "".equals(obj.toString())){
                logger.warn("未登录的: " + reqUrl);
               // httpServletResponse.setStatus(301);
              //  httpServletResponse.setHeader("location", httpServletRequest.getContextPath() + "/jsp/user/userLogin.jsp");
               // httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + "/jsp/user/userLogin.jsp");

            }
        }
        return false;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}