<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basepath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basepath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>用户添加界面</title>
<link rel="stylesheet" rev="stylesheet" href="css/style.css"
	type="text/css" media="all" />
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/uploadPreView.js"></script>


<script language="JavaScript" type="text/javascript">
	function tishi() {
		var a = confirm('数据库中保存有该人员基本信息，您可以修改或保留该信息。');
		if (a != true)
			return false;
		window.open("冲突页.htm","","depended=0,alwaysRaised=1,width=800,height=400,location=0,menubar=0,resizable=0,scrollbars=0,status=0,toolbar=0");
	}

	function check() {
		document.getElementById("aa").style.display = "";
	}
	
	

	$(function() {
		
		$.post("dc/depts", {}, function(data) {
			$.each(data, function(i, n) {
				$("#deptno").append("<option value='"+n.deptno+"'>" + n.dname + "</option>");
			});
		}, "json");

		$.post("rc/roles", {}, function(data) {
			$.each(data, function(i, n) {
				$("#roleid").append("<option value='"+n.roleid+"'>" + n.roleCn + "</option>");
			});
		}, "json");

		//图片上传预览
		new uploadPreview({
			UpBtn : "pic",
			DivShow : "imgdiv",
			ImgShow : "imgShow"
		});
	})
</script>
<style type="text/css">
<!--
.atten {
	font-size: 12px;
	font-weight: normal;
	color: #F00;
}
-->
</style>

<c:if test="${requestScope.isAdd!=null&&requestScope.isAdd }">
	<script type="text/javascript">
		alert("添加成功！！");
	</script>
</c:if>
<c:if test="${requestScope.isAdd!=null&&!requestScope.isAdd }">
	<script type="text/javascript">
		alert("添加失败！！");
	</script>
</c:if>



</head>

<body class="ContentBody">
	<div class="MainDiv">
	<form id="form_add" action="uc/adduser" method="post" enctype="multipart/form-data">
		<table width="99%" border="0" cellpadding="0" cellspacing="0"
			class="CContent">
			<tr>
				<th class="tablestyle_title">用户添加页面</th>
			</tr>
			<tr>
				<td class="CPanel">

					<table border="0" cellpadding="0" cellspacing="0"
						style="width: 100%">
						<tr>
							<td align="left">
							<input type="submit"  value="保存" class="button" />
							<input type="button"  value="返回" class="button" onclick="window.history.go(-1);" /></td>
						</tr>

						<tr>
							<td width="100%">
								<fieldset style="height: 100%;">
									<legend>添加用户</legend>
									<table border="0" cellpadding="2" cellspacing="1" style="width: 100%">
										<tr>
											<td  align="right" width="13%">用户名</td>
											<td width="41%"><input name="loginname" class="text" style="width: 250px" type="text" size="40" />
												<span class="red">*${msg }</span>
											</td>
											<td align="right" width="19%">真实姓名:</td>
											<td width="27%"><input name="realName" id="Input22" class="text" style="width: 200px" /></td>
										</tr>
										<tr>
											<td  align="right">密码:</td>
											<td><input type="password" name="loginpwd" 
												class="text" style="width: 250px" /><span class="red">
													*</span></td>
											<td align="right">email</td>
											<td><input name="email" id="Input" class="text"
												style="width: 200px" /></td>
										</tr>
										<tr>
											<td  align="right">确认密码:</td>
											<td><input type="password" class="text"
												style="width: 250px" /> <span class="red">*</span></td>
											<td align="right">用户状态:</td>
											<td><select name="userStatus">
													<option selected="selected" value="0">在职</option>
													<option value="1">休假</option>
													<option value="2">离职</option>
											</select></td>
										</tr>
										<tr>
											<td  align="right">部门:</td>
											<td><select id="deptno" name="dept.deptno">
											</select></td>
											<td align="right">职位:</td>
											<td><select id="roleid" name="role.roleid">

											</select></td>
										</tr>
										<tr>
											<td  align="right">用户照片:</td>
											<td colspan="1">
											<input  type="file" name="file" id="pic" style="width: 250px" /></td>
										</tr>
										<tr>
											<td></td>
											<td>
												<div id="imgdiv" style="margin-top: 5px">
													<img id="imgShow" class="text"
														style="border: 1px solid; padding: 1px" width="80"
														height="80" />
												</div>
											</td>
										</tr>
										<tr>
											<td  align="right" height="120px">简介:</td>
											<td colspan="3"><textarea id="textarea" name="userDesc" rows="5" cols="80"></textarea></td>
										</tr>
									</table>

									<br />
								</fieldset>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center" height="50px">
					<input type="submit" value="保存" class="button" id="btn_submit" />
					<input type="button" value="返回" class="button" onclick="window.history.go(-1);" />
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
