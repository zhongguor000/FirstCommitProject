<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
		String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basepath %>" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户管理界面</title>
<link rel="stylesheet" type="text/css" href="css/easyui.css"/>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
function changerole(userid,username,roleid){
	var $dialog=$('#changeroledialog');
	$dialog.window('open'); // open a window
	$("#dialog_username").val(username);
	$("#role_select").val(roleid);
	$dialog.data("userid",userid);
}
$(function(){
	$("#changeroledialog").dialog({
		title:"岗位变更",
		draggable:false,
		closable:true,
		closed:true
	});
	
	$.post("rc/roles", {}, function(data) {
		$.each(data, function(i, n) {
			$("#role_select").append("<option value='"+n.roleid+"'>" + n.roleCn + "</option>");
		});
	}, "json");
	
	
	$("#changerole_save").click(function(){
		var $dialog=$('#changeroledialog');
		var userid=$dialog.data("userid")
		var roleid=$("#role_select").val();
		$.ajax("uc/changerole",{
			type:"post",
			dataType:"json",
			data:"userid="+userid+"&role.roleid="+roleid,
			success:function(result){
				alert(result==true?"修改成功！！":"修改失败！！");
				$dialog.window('close');
			}
		});
	})
	$("#changerole_cancel").click(function(){
		$('#changeroledialog').window('close');
	})
})

function deleteUser(userid,username){
	if(confirm("你确定要删除 用户名为:"+username+"的用户吗？")){
		$.ajax("uc/deleteuser",{
			type:"post",
			dataType:"json",
			data:"userid="+userid,
			success:function(result){
				alert(result==true?"删除成功！！":"删除失败！！");
				if(result){
					location.reload(true);
				}
			}
		});

	}
}



</script>
<link href="css/style.css" rel="stylesheet" type="text/css" />

</head>
<script language=JavaScript>
function sousuo(){
	window.open("gaojisousuo.htm","","depended=0,alwaysRaised=1,width=800,height=510,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
}
function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

function link(){
    document.getElementById("fom").action="uc/adduser";
   	document.getElementById("fom").submit();
}

</script>

<body>
<div id="changeroledialog" style="width:500px;height:200px;padding:10px;">
	用户名：<input id="dialog_username" disabled="disabled" /><br/>
	岗位:
	<select id="role_select" id="role.roleid">
		
	</select>
	<button type="button" id="changerole_save">变更</button>
	<button type="button" id="changerole_cancel">取消</button>
</div>


<form name="fom" id="fom" method="post" action="">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30">      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="62" background="images/nav04.gif">
            
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		    <tr>
			  <td width="21"><img src="images/ico07.gif" width="20" height="18" /></td>
			  <td width="538">查看内容：按时间：
				<input name="textfield" type="text" size="12" readonly="readonly"/>
				<span class="newfont06">至</span>
				<input name="textfield" type="text" size="12" readonly="readonly"/>
				<input name="Submit4" type="button" class="right-button02" value="查 询" /></td>
			   <td width="144" align="left"><a href="#" onclick="sousuo()">
			     <input name="Submit3" type="button" class="right-button07" value="高级搜索" />
			   </a></td>	
		    </tr>
          </table></td>
        </tr>
    </table></td></tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="javascript:void(0)" class="right-font08" onclick="selectAll();">全选</a>-<a href="javascript:void(0)" class="right-font08" onclick="unselectAll();">反选</a></span>
	              <input name="Submit" type="button" class="right-button08" value="删除用户" />
	              <c:set scope="page" var="adduserUrl" value="uc/adduser"></c:set>
	              <c:set scope="page" var="changeroleUrl" value="uc/changerole"></c:set>
	              <c:forEach items="${sessionScope.user.role.priList }" var="pri">
		              	<c:if test="${fn:contains(pri.priUrl,adduserUrl) }">
		              		<input name="Submit2" type="button" class="right-button08" value="添加用户" onclick="link();"/></td>
		              	</c:if>
		              	<c:if test="${fn:contains(pri.priUrl,changeroleUrl) }">
		              		<c:set scope="page" var="changerolePri" value="true"></c:set>
		              	</c:if>
	              </c:forEach>
          	 </tr>
              <tr>
                <td height="40" class="font42">
				<table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">
				 <tr class="CTitle" >
                    	<td height="22" colspan="7" align="center" style="font-size:16px">用户管理列表</td>
                  </tr>
                  <tr bgcolor="#EEEEEE">
				    <td width="4%" align="center" height="30">选择</td>
                    <td width="10%">用户名</td>
					<td width="10%">姓名</td>
                    <td width="5%">部门</td>
					<td width="15%">简介</td>
					<td width="5%">状态</td>
					<td width="12%">操作</td>
                  </tr>
                  <c:forEach items="${requestScope.page.data }" var="u">
	                  <tr bgcolor="#FFFFFF">
					    <td height="20"><input type="checkbox" value="${u.userid }" name="delid"/></td>
	                    <td ><a href="listmokuaimingxi.htm" onclick=""></a>${u.loginname }</td>
						<td>${u.realName }</td>
	                    <td>${u.dept.dname }</td>
	                    <td>
		                    ${fn:substring(u.userDesc,0,25) }
					        ${fn:length(u.userDesc)>25?"...":"" }
				        </td>
	                    <td>${u.userStatus==0?"在职":(u.userStatus==1?"休假":"离职") }</td>
	                    <td>
		                    <a href="editrenwu.htm">编辑|</a>
		                    <a href="listrenwumingxi.htm">查看|</a>
		                    <c:set scope="page" var="True" value="true"/>
		                    <c:if test="${fn:contains(changerolePri,True) }">
		                    	<a href="javascript:void(0);" onclick="changerole('${u.userid }','${u.loginname}','${u.role.roleid }')">变更岗位|</a>
							</c:if>
							<a href="Javascript:void(0)" onclick="deleteUser('${u.userid }','${u.loginname}')">删除</a></td>
	                  </tr>
				  </c:forEach>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">${requestScope.page.totalPage }</span> 页 | 第 <span class="right-text09">${requestScope.page.currentPage }</span> 页</td>
                <td width="49%" align="right">[<a href="uc/userpage?currentPage=1" class="right-font08">首页</a> | <a href="uc/userpage?currentPage=${requestScope.page.currentPage-1 }" class="right-font08">上一页</a> | <a href="uc/userpage?currentPage=${requestScope.page.currentPage+1 }" class="right-font08">下一页</a> | <a href="uc/userpage?currentPage=${requestScope.page.totalPage }" class="right-font08">末页</a>] 转至：</td>
                <td width="1%">
                <form action="uc/userpage" method="post">
                	<table width="20" border="0" cellspacing="0" cellpadding="0">
	                    <tr>
	                      <td width="1%"><input name="currentPage" type="text" class="right-textfield03" size="1" /></td>
	                      <td width="87%"><input name="Submit23222" type="submit" class="right-button06" value=" " />
	                      </td>
	                    </tr>
                	</table>
                	</form>
                </td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>
</html>
