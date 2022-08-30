package com.agent.filter;

import javax.servlet.*;
import java.io.IOException;

public class TestFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException{
        System.out.println("filter初始化");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException,ServletException{
        System.out.println("dofilter运行");
        chain.doFilter(request,response);
    }

    @Override
    public void destroy(){
        System.out.println("filter销毁");
    }
}
