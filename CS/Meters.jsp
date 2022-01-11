
<html>
    <body>
        <form action="POST">
            <table border="1">
                <tr>
                    <%
                      String inputStr = request.getParameter("inputStr");
                      String date = request.getParameter("date");
                      System.out.println("inputStr = "+inputStr);
                      System.out.println("date = "+date);
                      String service_30=getServletContext().getInitParameter("service_30");
                      String service_32=getServletContext().getInitParameter("service_32");
                      //String service_40=getServletContext().getInitParameter("service_40");
                      //String service_42=getServletContext().getInitParameter("service_42");
                      //String service_22=getServletContext().getInitParameter("service_22");
                      String log_file_path=getServletContext().getInitParameter("log_file_path");
                      //System.out.println(service_30+"\t"+service_32+"\t"+log_file_path);
                      String output = new transcocommstatus.LogsTracker().getLogsStatus(inputStr,date,service_30,service_32,log_file_path);
                     // System.out.println(output);
                      out.println(output);
                    %>
                </tr>
            </table>
        </form>
    </body>
</html>    