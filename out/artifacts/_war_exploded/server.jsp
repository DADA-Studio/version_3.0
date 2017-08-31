<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/8/26
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="DBHelper" scope="page" class="util.DBHelper" />
<%
   String action = request.getParameter("action");

   if(action.equals("addcommon"))
   {
      String name = (String) session.getAttribute("name");
      String essay = request.getParameter("article");
      String time = request.getParameter("day");
      String tianid = request.getParameter("tianid");
      int essayid = Integer.parseInt(tianid);
      int common = Integer.parseInt(request.getParameter("id"));
      if(common==1)
      {
         DBHelper.UpdateProperty("Table_draftinfo","ID",""+essayid,"support",""+(Integer.parseInt(DBHelper.SelectDate("Table_draftinfo","ID",""+essayid,"support"))+1));
      }
      else
      {
         DBHelper.UpdateProperty("Table_draftinfo","ID",""+essayid,"object",""+(Integer.parseInt(DBHelper.SelectDate("Table_draftinfo","ID",""+essayid,"object"))+1));
      }
      DBHelper.InserTable_common(name, essay, time, common, essayid);
   }
   else if(action.equals("chongfuname"))
   {
      String username=request.getParameter("username1");
      String output = DBHelper.SelectDate("Table_users1","username",username,"username");
      if(username.equals(output))
      {
          out.clear();
          out.write("false");
      }
      else
      {
         out.clear();
         out.write("ok");
      }
   }
   else if(action.equals("shenfen1"))
   {
      DBHelper.UpdateProperty("Table_users1","ID",request.getParameter("id"),"status","通过");
      DBHelper.UpdateProperty("Table_users1","ID",request.getParameter("id"),"privilege","用户");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("shenfen2"))
   {
      DBHelper.UpdateProperty("Table_users1","ID",request.getParameter("id"),"status","未通过");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("qing1-1"))
   {
      DBHelper.UpdateProperty("Table_draftinfo","ID",request.getParameter("id"),"state","备案中");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("qing1-2"))
   {
      DBHelper.UpdateProperty("Table_draftinfo","ID",request.getParameter("id"),"state","未通过");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("qing2-1"))
   {
      DBHelper.UpdateProperty("Table_draftinfo","ID",request.getParameter("id"),"state","立案中");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("qing2-2"))
   {
      DBHelper.UpdateProperty("Table_draftinfo","ID",request.getParameter("id"),"state","未通过");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("qing3-1"))
   {
      DBHelper.UpdateProperty("Table_draftinfo","ID",request.getParameter("id"),"state","通过");
      out.clear();
      out.write("ok");
   }
   else if(action.equals("qing3-2"))
   {
      DBHelper.UpdateProperty("Table_draftinfo","ID",request.getParameter("id"),"state","未通过");
      out.clear();
      out.write("ok");
   }

%>