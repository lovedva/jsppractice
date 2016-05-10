<%@page import="org.apache.catalina.startup.UserConfig"%>
<%@ page import="dto.*,model.*,java.util.ArrayList,control.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>BoardPage -BBS</title>
<jsp:include page="head.jsp"></jsp:include>

<%int pagenum=Integer.parseInt(request.getParameter("pn"));
        //当前页数，默认第一页
     ArrayList<Integer> topicuidlist = new ArrayList<Integer>();
     ArrayList<String> topictitlelist = new ArrayList<String>();
     ArrayList<String> usernamelist = new ArrayList<String>();
     ArrayList<Integer> topicreadcountlist = new ArrayList<Integer>();
     
      TopicCheck tc =new TopicCheck(); UserCheck uc=new UserCheck();
      tc.check();   uc.check();
      topictitlelist=tc.getTopictitlelist(); 
      topicuidlist=tc.getTopicuidlist();
      topicreadcountlist=tc.getTopicreadcountlist();
      
      ArrayList<Long> useridlist=uc.getUseridlist();
      ArrayList<Integer> topicidlist=tc.getTopicidlist();
      usernamelist=uc.getUsernamelist();
      
      PageVO pv =new PageVO();
      pv.setCurrentPage(pagenum);
      pv.setTotalRownum(topicidlist.size());   System.out.println("设定总条数："+topicidlist.size());
      pv.getStartPage();  pv.getEndPage();     System.out.println("开始页码："+pv.getStartPage()+"  结束页码："+pv.getEndPage());
      pv.getFirstResult(); pv.getRownumperpage();  System.out.println("开始行位置："+pv.getFirstResult()+"  每页行数："+pv.getRownumperpage());
      
  %>

<div class="container pagebody-top" >
    <div class="row">
    <div class="col-md-12 ">
    <ul class="breadcrumb" contenteditable="false">
                <li><a href="index.jsp">Homepage</a> <span class="divider"></span></li>
        <li class="active">BoardName</li>
    </ul>
            <div class="media well">
                <div class="media-body">
                   <h4><p><a href="#"  style="font-weight: bold;color: #2ecc71">Notice:</a></p></h4>
                       <p>Notice here...</p>
                       <p>Notice here...</p>
                       <p>Notice here...</p>
                </div>
            </div>   <!-- media well -->

            <!--topics-->
    </div>
    </div>
    <div class="row" style="padding-top: 10px;">
        <div class="col-md-12 " style="">
                <table class="table table-bordered  ">
                    <thead>
                    <tr>
                    <th class="info">
                    <a class="btn btn-warning" href="newtopic.jsp?pn=<%=pagenum %>">New topic</a>
                        <div class="btn-group">
                            
                            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle">Categories <span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><input type="radio" id="ID" name="NAME" value="VALUE"><label for="ID">Category1</label></li>
                                <li><input type="radio" id="ID2" name="NAME" value="VALUE"><label for="ID2">Category2</label></li>
                                <li><input type="radio" id="ID3" name="NAME" value="VALUE"><label for="ID3">Category3</label></li>
                                <!-- Other items -->
                            </ul>
                        </div>
                    </th>
                    </tr>
                    </thead>
                    <tbody>
                    <%String topicbyuser="";  int topicid=0;
                      for (int i=pv.getFirstResult()+1;i<pv.getFirstResult()+pv.getRownumperpage();i++){
                          if (i<topicidlist.size()){
                        	  long a=useridlist.indexOf((long)topicuidlist.get(i)); 
                              topicid=topicidlist.get(i);
                              //       System.out.println("topicuidlist.get(i)= "+topicuidlist.get(i)+" useridlist.indexOf( topicuidlist.get(i))="+useridlist.indexOf((long)topicuidlist.get(i)));
                                     topicbyuser =usernamelist.get((int)a);
                          
                    
                              %>
                    	<tr>
                        <td>
                        <div class="col-md-7">
                        <a href="topicpage.jsp?tid=<%=topicid%>&pn=<%=pagenum %>">[Category] <%=topictitlelist.get(i) %> <span class="badge"> <%=tc.getTopicreplyCountlist().get(i)%></span></a>
                             <button class=" btn btn-default btn-xs">by <%=topicbyuser  %></button>


                            </div>  <div class="col-md-3 text-left">
                            <button class=" btn btn-inverse  btn-xs"> Read:<%=topicreadcountlist.get(tc.getTopicidlist().indexOf(topicid)) %></button>
                                <button class=" btn btn-inverse  btn-xs">Reply:<%=tc.getTopicreplyCountlist().get(i) %></button>
                           </div>
                           <div class="col-md-2">
                                <button class=" btn btn-default  btn-xs">at 2016-23-34 23:23:34</button>
                                </div>
                           
                        </td>
                            </tr>
                     <% } }%>    
            
            
                
                    </tbody>
                </table>
        </div>
    </div>
       
       
           

<div class="row">
        <div class="col-md-12">
            <div class=" ">
                <nav class="text-center">
                
                <%
              
                %>
                    <ul class="pagination  pagination-sm">
                        <li>
                            <a href="boardpage.jsp?pn=<%=pagenum-1 %>" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>    
                        </li>
                        <%
                        for (int i=pv.getStartPage();i<=pv.getEndPage();i++){   %>
                        	<li <%if (i==pagenum){%> class="active"     <%} %>>
                        	
                        	<a href="boardpage.jsp?pn=<%=i %>"><%=i %></a>
                        	</li>
                       <% }%>
                          <li>
                            <a href="boardpage.jsp?pn=<%=pagenum+1 %>"aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                             <%if(pv.getPageNums()>5){ %> <li><a href="boardpage.jsp?pn=<%=pv.getPageNums() %>">总页数：
                          <%=pv.getPageNums() %>
                           </a></li> <%} %>
                    </ul>
                </nav>
            </div>
        </div>
               </div>

</div>



<jsp:include page="foot.jsp"></jsp:include>