<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String path = request.getContextPath();
	String basepath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basepath %>" />
	<meta charset="UTF-8">
	<title>Custom Window Tools - jQuery EasyUI Demo</title>
	<script src="js/jquery.js"></script>
	<script type="text/javascript" src="js/spark-md5.js"></script>
<script type="text/javascript">
	$(function () {
		
		$("#uploadfile").change(function(){
			$("progress").val("0");
			 $("#msg").text("");
		});
		$("#btn_upload").click(function () {
			calculate();
			var data=new FormData($("#form")[0]);
			var md5=$("#box").text();
			alert(md5)
			data.append("md5",md5);
			/* 
			var data=new FormData(document.getElementById("form"));
			$.ajax({
				url:"upload/up",
				data:data,
				dataType:"text",
				type:"POST",
				// 告诉jQuery不要去处理发送的数据
				processData : false, 
				// 告诉jQuery不要去设置Content-Type请求头
				contentType : false,
				success:function(data){
					$("img").attr("src","download/showpic/"+data);
				}
			}); */
			
			
			var xhr = new XMLHttpRequest();
			  xhr.open('POST', 'upload/breakpointupload', true);
			  xhr.onreadystatechange = function () {
			        if (xhr.readyState === 4 && xhr.status === 200) {
			            //alert("上传完成");
			        }
			   };
			  // Listen to the upload progress.
			  var progressBar =$("#upload_onprogress")[0]; //document.querySelector('progress');
			  //监听上传状态
			  xhr.upload.onprogress = function(e) {
			    if (e.lengthComputable) {
			      progressBar.value = (e.loaded / e.total) * 100;
			      progressBar.textContent = progressBar.value; // Fallback for unsupported browsers.
			    }
			  };
			  var progressBar2 =$("#onprogress")[0];
			  xhr.onprogress = function(e) {
				  $("#msg").text("上传成功");
			};
			  xhr.send(data);
		});
	});
	
	
	
	function calculate(){  
	    var fileReader = new FileReader(),  
	        box=document.getElementById('box');  
	        blobSlice = File.prototype.mozSlice || File.prototype.webkitSlice || File.prototype.slice,  
	        file = document.getElementById("uploadfile").files[0],  
	        chunkSize = 2097152,  
	        // read in chunks of 2MB  
	        chunks = Math.ceil(file.size / chunkSize),  
	        currentChunk = 0,  
	        spark = new SparkMD5();  
	  
	    fileReader.onload = function(e) {  
	        console.log("read chunk nr", currentChunk + 1, "of", chunks);  
	        spark.appendBinary(e.target.result); // append binary string  
	        currentChunk++;  
	  
	        if (currentChunk < chunks) {  
	            loadNext();  
	        }  
	        else {  
	            console.log("finished loading");  
	            box.innerText=spark.end();  
	            console.info("computed hash", spark.end()); // compute hash  
	            md5=spark.end();
	        }  
	    };  
	  
	    function loadNext() {  
	        var start = currentChunk * chunkSize,  
	            end = start + chunkSize >= file.size ? file.size : start + chunkSize;  
	        fileReader.readAsBinaryString(blobSlice.call(file, start, end));  
	    };  
	    loadNext();  
	}  
	
	
	</script>
</head>
<body>

<form id="form" action="upload" enctype="multipart/form-data" method="post">
<input id="uploadfile" type="file" name="file">
<button id="btn_upload" type="button">上传</button><br>
</form>

<div id="box"></div>  
<!-- <button id="cal" type="button" onclick="calculate()">计算md5</button> -->
<progress id="upload_onprogress" min="0" max="100" value="0"></progress>
<span id="msg"></span>
<br>
<br>
<img src="#" width="50">





</body>
</html>