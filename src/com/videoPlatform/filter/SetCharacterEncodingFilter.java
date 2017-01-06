package com.videoPlatform.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetCharacterEncodingFilter implements Filter {

     //存储编码格式信息
      private String encode = null;
    @Override
    public void destroy() {
        // TODO Auto-generated method stub

    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        
         //转换
           HttpServletRequest request = (HttpServletRequest)req;
           HttpServletResponse response = (HttpServletResponse)resp;
           
           /*
            * 判断在web.xml文件中是否配置了编码格式的信息
            * 如果为空，则设置编码格式为配置文件中的编码格式
            * 否则编码格式设置为utf-8
            */
           if(this.encode != null && !this.encode.equals("")){
            request.setCharacterEncoding(this.encode);
            response.setCharacterEncoding(this.encode);
           }else{
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
           }
           
           /*
            * 使用doFilter方法调用链中的下一个过滤器或目标资源（servlet或JSP页面）。
            * chain.doFilter处理过滤器的其余部分（如果有的话），最终处理请求的servlet或JSP页面。
            */
           chain.doFilter(request, response);
        
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

        this.encode=arg0.getInitParameter("encode");
        System.out.println("this.encode:"+encode);
    }

}
