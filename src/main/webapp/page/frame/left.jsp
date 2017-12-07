<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	    String path = request.getContextPath();
		String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<base href="<%=basepath %>" />
<title>管理系统</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(images/left.gif);
}
-->
</style>
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>
function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	
	//alert(imgobj);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="images/ico04.gif";
	}
}

</SCRIPT>

<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="25%" rowspan="2"><img src="download/showpic/${sessionScope.user.picpath }" width="35" height="35" /></td>
					<td width="75%" height="22" class="left-font01">您好，<span class="left-font02">${sessionScope.user.realName }</span></td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
						[&nbsp;<a href="uc/logout" target="_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		


		<!--  任务系统开始    -->
		<c:forEach items="${sessionScope.user.role.priList }" var="pri" varStatus="s">
		<c:if test="${pri.parentid==0 }">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
	          <tr>
	            <td height="29">
					<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="8%"><img name="img${s.count}" id="img${s.count}" src="images/ico04.gif" width="8" height="11" /></td>
							<td width="92%">
									<a href="javascript:void(0)" target="mainFrame" class="left-font03" onClick="list('${s.count}');" >${pri.priName }</a></td>
						</tr>
					</table>
				</td>
	          </tr>		  
	        </table>
	        
			<table id="subtree${s.count}" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
					cellspacing="0" class="left-table02">
				<c:forEach items="${sessionScope.user.role.priList }" var="childpri" varStatus="status">
					<c:if test="${childpri.parentid==pri.priid }">
						<tr>
						  <td width="9%" height="20" ><img id="xiaotu${status.count*s.count }" src="images/ico06.gif" width="8" height="12" /></td>
						  <td width="91%"><a href="${childpri.priUrl}" target="mainFrame" class="left-font03" onClick="tupian('${status.count*s.count }');">${childpri.priName }</a></td>
						</tr>
					</c:if>
	      		</c:forEach>
	      </table>
      </c:if>
      </c:forEach>
		<!--  任务系统结束    -->

		

		

	  </TD>
  </tr>
  
</table>
</body>
</html>
