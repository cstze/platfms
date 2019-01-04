<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/myBootStrapJs.jsp"></jsp:include>
</head>
<body>
	 <div>
		  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" onclick="search()"><h5>&nbsp;&nbsp;&nbsp;新建会议&nbsp;&nbsp;&nbsp;</h5></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" onclick="toZhouQi()"><h5>&nbsp;&nbsp;&nbsp;周期会议&nbsp;&nbsp;&nbsp;</h5></button><br/>
	     <div style="float:right">*</div>  
		  <hr class=dotline color=#111111 size=1>
	  </div>
	 
	 <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" data-toggle="modal" id="xinjian" data-target="#myModal">新建</button>&nbsp;&nbsp;  
			  <button type="button" class="btn btn-info" id="upda" onclick="updateAdmin()" data-toggle="modal" data-target="#myModalxg">修改</button>&nbsp;&nbsp;
			  <button type="button" class="btn btn-info" id="dele" onclick="deleteAdmin()">删除</button>&nbsp;&nbsp;
			  <button type="button" class="btn btn-info" id="jieshu" onclick="updateStartquxiao()">结束</button>&nbsp;&nbsp;
	      <div style="float:right">
	         <button type="button" class="btn btn-info" onclick="findCycle()">查询</button>
	         <input type="text" class="form-control"  id="name" placeholder="请输入名称">
	      </div>
	      <table id="cycleTable"></table>
	  </div>
	  <script>
	      function search() {
	    	  location.href="<%=request.getContextPath()%>/tze/toAdmin.do"
		  }
	      
	      
	      $(function () {
	    	  findCycle();
		  })
	      
		  function findCycle() {
			    
	    	  $('#cycleTable').bootstrapTable('destroy');
				$('#cycleTable').bootstrapTable({
					//toolbar:'#toolbar',
					url:'<%=request.getContextPath()%>/tze/findAdminZq.do',//获取数据地址 
				    singleSelect:true, //只允许选中一行
					method:'post',
					pagination:true, //是否展示分页
	    			pageList:[5, 10, 20, 50],//分页组件
	    			pageNumber:1,
	    			pageSize:2,//默认每页条数
	    			sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
					showColumns:false,//是否显示 内容列下拉框
					showToggle:false,//是否显示 切换试图（table/card）按钮
					showPaginationSwitch:false,//是否显示 数据条数选择框
					showRefresh:false,//是否显示刷新按钮
					detailView:false,//设置为 true 可以显示详细页面模式。
					showFooter:false,//是否显示列脚
					clickToSelect:true, //是否启用点击选中行
					contentType:"application/x-www-form-urlencoded;charset=UTF-8",
					searchOnEnterKey:true,
				 	queryParams:function(){
				 		return{
						  aname:$("#name").val(),
						  pageNum: this.pageNumber,
	  					  pageSize: this.pageSize,
				 		}
					}, 
					columns:[ 
						    {field:'a',checkbox:true},
							{field:'aname',title:'会议主题',width:100},    
							{field:'meetingname',title:'会议地点',width:100},
							{field:'123',title:'与会时间',width:100,
								formatter:function(value,row,index){
									return row.hiuyistartdate+'--'+row.hiuyienddate;
								}
							},
							{field:'personne',title:'与会人员',width:100,},
							{field:'phonename',title:'联系人',width:100,},
							{field:'chongfu',title:'会议重复模式',width:100,},
							{field:'chongstartdate',title:'重复开始日期',width:100,},
							{field:'chongenddate',title:'重复结束日期',width:100,},
							{field:'zqstart',title:'状态',width:100,
								formatter:function(value,row,index){ 
								   if(row.zqstart==1){ return "审批中"}
								   if(row.zqstart==2){ return "待召开"}
								   if(row.zqstart==3){ return "已结束"}
							     }	
							},
		             ],
		             onClickRow:function(row){
		            	// debugger
		            	 $("#cycleTable").on('click-row.bs.table', function (e, row, element){
		            		 if($(element).hasClass('selected')){//这里进行了判断是否选中
		            		 	//去除之前选中的行的
		            		 	$("#upda").attr("disabled",false);
		            		 	$("#jieshu").attr("disabled",false);
		            		 }
		            	});
				        	if(row.zqstart==1){
				        		$("#upda").attr("disabled","disabled");
				        		$("#jieshu").attr("disabled",false);
				        	}
				        	if(row.zqstart==2){
				        		$("#upda").attr("disabled","disabled");
				        		$("#jieshu").attr("disabled","disabled");
				        	}
				        	if(row.zqstart==3){
				        		$("#jieshu").attr("disabled","disabled");
				        		$("#upda").attr("disabled",false);
				        	}
		                }
			  	  })
	          }		
	      
	     //发送申请
	    function saveAdminZq(start,zqstart) {
		 $.ajax({
			 url:"<%=request.getContextPath()%>/tze/saveAdminszq.do?start="+start+"&zqstart="+zqstart,
			 type:'post',
			 data:$("#adminForm").serialize(),
		  success:function(data){
		  	alert("新增成功")
		       if($("#myModal").css("display")=="block"){
				   $("#myModal").hide();
				 }  
		  	   window.location.reload();
		     }  
		 })
	}
	     //保存申请
	    function saveAdminbaocunzq(start,zqstart) {
		 $.ajax({
			 url:"<%=request.getContextPath()%>/tze/saveAdminszq.do?start="+start+"&zqstart="+zqstart,
			 type:'post',
			 data:$("#adminForm").serialize(),
		  success:function(data){
		  	alert("保存成功")
		       if($("#myModal").css("display")=="block"){
				   $("#myModal").hide();
				 }  
		  	   window.location.reload();
		     }  
		 })
	}
	     
		 //主持人
		function userdeptTable(){
		$("#userdept").bootstrapTable({
			 url:"<%=request.getContextPath()%>/tze/findUserDept.do",	
				 method:"post",
				 striped: true,  	// 斑马线效果     默认false 
				 //只允许选中一行
				 singleSelect:true,
				 //选中行是不选中复选框或者单选按钮
				 clickToSelect:true,
				 showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
				 cardView: false,                    //是否显示详细视图
				 uniqueId: "logInfoId",                 //每一行的唯一标识，一般为主键列
				 showColumns: true,                  //是否显示所有的列
				 showRefresh: true,                  //是否显示刷新按钮
				 minimumCountColumns: 2,     //  最少留两列
				 detailView: false,                  //是否显示父子表
				 //发送到服务器的数据编码类型  
				contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
				toolbar:'#tabToolBar',   //  工具定义位置
				columns:[
						{field:'name',title:'人员',width:100},
						{field:'deptname',title:'部门',width:100},
				         ],
				         onClickRow:function(row){
				        	useronClickRow(row.name);
				         }
			     });
		       }
			   function useronClickRow(name) {
				   var uname = name
				   $('#uname').val(uname);
				   $('#unames').val(uname);
				     if($("#myModals").css("display")=="block"){
				        $("#myModals").hide();
				     }     
			   }
		//联系人
		 function userdeptTablelx(){
			$("#userdeptlx").bootstrapTable({
				 url:"<%=request.getContextPath()%>/tze/findUserDept.do",	
				 method:"post",
				 striped: true,  	// 斑马线效果     默认false 
				 //只允许选中一行
				 singleSelect:true,
				 //选中行是不选中复选框或者单选按钮
				 clickToSelect:true,
				 showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
				 cardView: false,                    //是否显示详细视图
				 uniqueId: "logInfoId",                 //每一行的唯一标识，一般为主键列
				 showColumns: true,                  //是否显示所有的列
				 showRefresh: true,                  //是否显示刷新按钮
				 minimumCountColumns: 2,     //  最少留两列
				 detailView: false,                  //是否显示父子表
				 //发送到服务器的数据编码类型  
				contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
				toolbar:'#tabToolBar',   //  工具定义位置
				columns:[
						{field:'name',title:'人员',width:100},
						{field:'deptname',title:'部门',width:100},
				         ],
				         onClickRow:function(row){
				        	useronClickRowlx(row.name);
				         }
			     });
		       }
			   function useronClickRowlx(name) {
				   var uname = name
				   $('#userNamea').val(uname);
				   $('#userNameas').val(uname);
				     if($("#myModallx").css("display")=="block"){
				        $("#myModallx").hide();
				     }     
		}

	   //与会人员 
		  function findUD(){
				$("#userRy").bootstrapTable({
					 url:"<%=request.getContextPath()%>/tze/findUserDept.do",	
			 method:"post",
			 striped: true,  	// 斑马线效果     默认false 
			 //选中行是不选中复选框或者单选按钮
			 clickToSelect:true,
			 showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
			 cardView: false,                    //是否显示详细视图
			 uniqueId: "logInfoId",                 //每一行的唯一标识，一般为主键列
			 showColumns: true,                  //是否显示所有的列
			 showRefresh: true,                  //是否显示刷新按钮
			 minimumCountColumns: 2,     //  最少留两列
			 detailView: false,                  //是否显示父子表
			 //发送到服务器的数据编码类型  
			contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
			toolbar:'#tabToolBar',   //  工具定义位置
			columns:[
				    {field:'a',checkbox:true},
					{field:'name',title:'人员',width:100},
					{field:'deptname',title:'部门',width:100},
			         ],
			         onClickRow:function(row){
			        	useronClickRowry();
			         }
		     });
        }
		   function useronClickRowry() {
			   
		          var ids = "";
				var  row = $("#userRy").bootstrapTable("getSelections");
				for (var i = 0; i < row.length; i++) {
					ids += ids==""?row[i].name:","+row[i].name;
				}
			   $('#userNameRy').val(ids);
			   $('#userNameRys').val(ids);
			     if($("#myModalry").css("display")=="block"){
			        $("#myModalry").hide();
			     }     
		   }
     
//会议记要员
  function findUserDeptJy(){
		$("#userdeotJy").bootstrapTable({
			 url:"<%=request.getContextPath()%>/tze/findUserDept.do",	
			 method:"post",
			 striped: true,  	// 斑马线效果     默认false 
			 //选中行是不选中复选框或者单选按钮
			 clickToSelect:true,
			 showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
			 cardView: false,                    //是否显示详细视图
			 uniqueId: "logInfoId",                 //每一行的唯一标识，一般为主键列
			 showColumns: true,                  //是否显示所有的列
			 showRefresh: true,                  //是否显示刷新按钮
			 minimumCountColumns: 2,     //  最少留两列
			 detailView: false,                  //是否显示父子表
			 //发送到服务器的数据编码类型  
			contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
			toolbar:'#tabToolBar',   //  工具定义位置
			columns:[
				    {field:'a',checkbox:true},
					{field:'name',title:'人员',width:100},
					{field:'deptname',title:'部门',width:100},
			         ],
			         onClickRow:function(row){
			        	useronClickRowJy();
			         }
		     });
        }
		   function useronClickRowJy() {
			   
		          var ids = "";
				var  row = $("#userdeotJy").bootstrapTable("getSelections");
				for (var i = 0; i < row.length; i++) {
					ids += ids==""?row[i].name:","+row[i].name;
				}
			   $('#userNameJy').val(ids);
			   $('#userNameJys').val(ids);
			     if($("#myModalJy").css("display")=="block"){
			        $("#myModalJy").hide();
			     }     
		   }
		   //查寻资源
		     function findQueryResource(){
					$("#ziyuan").bootstrapTable({
						 url:"<%=request.getContextPath()%>/tze/findZiyuan.do",	
						 method:"post",
						 striped: true,  	// 斑马线效果     默认false 
						 //只允许选中一行
						/*  singleSelect:true, */
						 //选中行是不选中复选框或者单选按钮
						 clickToSelect:true,
						 showToggle:true,                    //是否显示详细视图和列表视图的切换按钮
						 cardView: false,                    //是否显示详细视图
						 uniqueId: "logInfoId",                 //每一行的唯一标识，一般为主键列
						 showColumns: true,                  //是否显示所有的列
						 showRefresh: true,                  //是否显示刷新按钮
						 minimumCountColumns: 2,     //  最少留两列
						 detailView: false,                  //是否显示父子表
						 //发送到服务器的数据编码类型  
						contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5
						toolbar:'#tabToolBar',   //  工具定义位置
						columns:[
		                        {fieId:'a',checkbox:true},
								{field:'name',title:'部门',width:100},
						         ],
						         onClickRow:function(row){
						        	useronClickRowzy(row.name);
						         }
					     });
			        }
					   function useronClickRowzy(name) {
					         var ids = "";
							var  row = $("#ziyuan").bootstrapTable("getSelections");
							 for (var i = 0; i < row.length; i++) {
							 		ids += ids==""?row[i].name:","+row[i].name;
							  }
						   $('#ziyuana').val(ids);
						   $('#ziyuanas').val(ids);
						     if($("#myModalzy").css("display")=="block"){
						        $("#myModalzy").hide();
						     }     
					   } 
	//修改				   
	   function updateAdmin(){
	    	  var aid = "";
			  var  row = $("#cycleTable").bootstrapTable("getSelections");
		      for (var i = 0; i < row.length; i++) {
				 		aid += aid==""?row[i].aid:","+row[i].aid;
				  }
				    $.ajax({
				    	url:'<%=request.getContextPath()%>/tze/updateAdmin.do',
				    	data:{aid:aid},
				        success:function(data){
				        	$("#ida").val(data.aid),
				        	$("#aname").val(data.aname),
				        	$("#unames").val(data.uname),
				        	$("#userNameas").val(data.phonename),
				        	$("#meetingnames").val(data.meetingname),
				        	$("#meetingtypes").val(data.meetingtype),
				        	$("#userNameRys").val(data.personne),
				        	$("#phoneways").val(data.phoneway),
				        	$("#userNameJys").val(data.jypersonne),
				        	$("#ziyuanas").val(data.member),
				        	$("#chongfus").val(data.chongfu),
				        	
				        	$("#jianges").val(data.jiange), 
				        	$("#celues").val(data.celue),
				        	$("#chongstartdates").val(data.chongstartdate),
				        	$("#chongenddates").val(data.chongenddate),
				        	$("#hiuyistartdates").val(data.hiuyistartdate),
				        	$("#hiuyienddates").val(data.hiuyienddate),
				        	$("#contents").val(data.content) 
				        }
				 })
	      } 		
	   
	   function deleteAdmin(){
	         var ids = "";
		var  row = $("#cycleTable").bootstrapTable("getSelections");
		for (var i = 0; i < row.length; i++) {
			ids += ids==""?row[i].aid:","+row[i].aid;
		}
		 $.ajax({
	    	 url:"<%=request.getContextPath()%>/tze/deleteAdmin.do",
	    	 data:{
	    		 ids:ids
	    	 },
	           success:function(data){
                alert("刪除成功")
	        	  window.location.reload();
			 }
		})
	}
	   
	 //结束
       function updateStartquxiao() {
    	       var id = "";
 		  var  row = $("#cycleTable").bootstrapTable("getSelections");
 	      for (var i = 0; i < row.length; i++) {
 			 		id += id==""?row[i].aid:","+row[i].aid;
 			  }
 	      alert(id)
 	      $.ajax({
 	    	  url:'<%=request.getContextPath()%>/tze/updatezqStart.do',
 	    	  data:{aid:id},
 	    	 success:function(data){
 	    		bootbox.alert({
 					size:"small",
 					title:"提示",
 					message:"请勾选您的数据",
 				});
	        	  window.location.reload();
			 }
 	      })
	} 
	 
       //修改
       function updatebangAdminzq(start,zqstart) {
  		 $.ajax({
  			 url:"<%=request.getContextPath()%>/tze/updatebangAdminzq.do?start="+start+"&zqstart="+zqstart,
  			 type:'post',
  			 data:$("#UpdateadminFormzq").serialize(),
  		  success:function(data){
  		  	alert("修改成功")
  		       if($("#myModalxg").css("display")=="block"){
  				   $("#myModalxg").hide();
  				 }  
  		  	   window.location.reload();
  		     }  
  		 })
  	}  
       
	  </script>
  <!-- 修改 -->
       <div  class="modal fade" id="myModalxg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog" >
           <div class="modal-content" style="height: 600px;width: 800px">
               <div  style="modal:true;width:800px; height:500px;background:url('<%=request.getContextPath()%>/user/lal.jpeg');background-size: cover;" class="modal-header" style="height: 500px;width: 800px">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    &emsp;&emsp;<h4 class="modal-title" id="myModalLabel">周期会议</h4>
                    &emsp;&emsp;<button type="button" class="btn btn-danger" onclick="updatebangAdminzq(0,1)">发送申请</button>&emsp;
                                <button type="button" class="btn btn-danger" onclick="updatebangAdminzq(0,0)">保存申请</button><br/>
                    <div id="content" class="row-fluid">
                     <form id="UpdateadminFormzq"> 
                          <input type="hidden" id="ida" name="aid">
					     <div class="col-md-6">
  					          <h5><label>会议主题</label>&emsp;<input type="text" name="aname" id="aname" placeholder="会议主题"  style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)"></h5>
					          <h5><label>主持人</label>&emsp;&emsp;<input type="text" name="uname" id="unames" placeholder="主持人" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)" data-toggle="modal" data-target="#myModals" onclick="userdeptTable()"></h5>
					          <h5><label>联系人</label>&emsp;&emsp;<input type="text" name="phonename" id="userNameas"  size="25" placeholder="联系人" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModallx" onclick="userdeptTablelx()"></h5>
					       <div>
					          <h5><label>会议室</label>&emsp;<select name = "meetingname" id="meetingnames" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
						             <option>第一会议室</option>
                                     <option>第二会议室</option>
						             <option>大会议室</option>
						             <option>小会议室</option>
                               </select></h5>
					       </div>
					   </div>
					   <div class="col-md-6"><br/>
					          <h5><label>会议类型</label>&emsp;<select name = "meetingtype" id="meetingtypes" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>生产</option>
                                     <option>策划</option>
						             <option>人士</option>
						             <option>学习</option>
                               </select></h5>
					          <h5><label>主办部门</label>&emsp;<input type="text" name="deotname" id="deotnames"  placeholder="主办部门" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalbm"></h5> 
					          <h5><label>联系方式</label>&emsp;<input type="text" name="phoneway" id="phoneways"  placeholder="联系方式" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5>
			 	        </div>                                                                           																								
			 	        <div class="col-md-12">
			 	              <label>与会人员</label> &emsp;<input type="text" name="personne" id="userNameRys"  placeholder="与会人员" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0);" data-toggle="modal" data-target="#myModalry" onclick="findUD()"> 
			 	              <h5> <label>会议纪要</label> &emsp;<input type="text" name="jypersonne" id="userNameJys"  placeholder="会议纪要" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalJy" onclick="findUserDeptJy()"></h5> 
			 	              <h5> <label>资源准备</label> &emsp;<input type="text" name="member" id="ziyuanas"  placeholder="资源准备" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">
			 	                 <button type="button" class="btn btn-danger" onclick="findQueryResource()" data-toggle="modal" data-target="#myModalzy">选择资源</button>
			 	              </h5> 
			 	              <h5> <label>重复模式</label> &emsp;<select name = "chongfu" id="chongfus" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>日列会</option>
                                     <option>周列会</option>
						             <option>月列会</option>
                               </select></h5>
                              <h5><label>重复间隔</label> &emsp;<input type="checkbox" name="jiange" id="jianges" value="周一">周一&emsp;<input type="checkbox" name="jiange" id="jianges" value="周二">周二&emsp;<input type="checkbox" name="jiange" id="jianges" value="周三">周三&emsp;
			 	              <input type="checkbox" name="jiange" id="jianges" value="四">周四&emsp;<input type="checkbox" name="jiange" id="jianges" value="周五">周五&emsp;<input type="checkbox" name="jiange" id="jianges" value="周六">周六&emsp;<input type="checkbox" name="jiange" id="jianges" value="周日">周日&emsp;</h5> 
			 	              <h5><label>重复策略</label> &emsp;<select name ="celue" id="celues" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>非工作日期:日期不变</option>
                                     <option>非工作日期:推迟到下一工作日</option>
                              </select></h5>
                             <h5><label>重复日期</label>&emsp;<input class="date" name="chongstartdate"  id="chongstartdates" placeholder="开始时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">-
			 	              <input class="date" name="chongenddate" id="chongenddates"  placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 					          
                              
                             <h5><label>会议时间</label>&emsp;<input class="datetimepicker" name="hiuyistartdate"  id="hiuyistartdates" placeholder="开始时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">-
			 	             <input class="datetimepicker" name="hiuyienddate" id="hiuyienddates"  placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 					          
                         </div>
			 	            <div class="col-md-12">
			 	               <h5><label>会议发布</label> &emsp;<input disabled type="text" name="hiuyifabu" id="hiuyifabu"   placeholder="会议发布" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0);" value="会议前 五 天发布会议并发送通知"></h5> 
			 	               <h5> <label>会议内容</label> &emsp;<input type="text" name="content" id="contents"   placeholder="会议内容" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	            </div>
			 	         </form>
                    </div>
               </div>  
          </div>
      </div>
  </div>
	<!-- 新增 -->  
   <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog" >
           <div class="modal-content" style="height: 600px;width: 800px">
               <div  style="modal:true;width:800px; height:500px;background:url('<%=request.getContextPath()%>/user/lal.jpeg');background-size: cover;" class="modal-header" style="height: 500px;width: 800px">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    &emsp;&emsp;<h4 class="modal-title" id="myModalLabel">周期会议</h4>
                    &emsp;&emsp;<button type="button" class="btn btn-danger" onclick="saveAdminZq(0,1)">发送申请</button>&emsp;
                                <button type="button" class="btn btn-danger" onclick="saveAdminbaocunzq(0,0)">保存申请</button><br/>
                    <div id="content" class="row-fluid">
                     <form id="adminForm"> 
					     <div class="col-md-6">
  					          <h5><label>会议主题</label>&emsp;<input type="text" name="aname" id="aname" placeholder="会议主题"  style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)"></h5>
					          <h5><label>主持人</label>&emsp;&emsp;<input type="text" name="uname" id="uname" placeholder="主持人" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)" data-toggle="modal" data-target="#myModals" onclick="userdeptTable()"></h5>
					          <h5><label>联系人</label>&emsp;&emsp;<input type="text" name="phonename" id="userNamea"  size="25" placeholder="联系人" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModallx" onclick="userdeptTablelx()"></h5>
					       <div>
					          <h5><label>会议室</label>&emsp;<select name = "meetingname" id="meetingnames" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
						             <option>第一会议室</option>
                                     <option>第二会议室</option>
						             <option>大会议室</option>
						             <option>小会议室</option>
                               </select></h5>
					       </div>
					   </div>
					   <div class="col-md-6"><br/>
					          <h5><label>会议类型</label>&emsp;<select name = "meetingtype" id="meetingtypes" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>生产</option>
                                     <option>策划</option>
						             <option>人士</option>
						             <option>学习</option>
                               </select></h5>
					          <h5><label>主办部门</label>&emsp;<input type="text" name="deotname" id="deotnames"  placeholder="主办部门" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalbm"></h5> 
					          <h5><label>联系方式</label>&emsp;<input type="text" name="phoneway" id="phoneways"  placeholder="联系方式" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5>
			 	        </div>                                                                           																								
			 	        <div class="col-md-12">
			 	              <label>与会人员</label> &emsp;<input type="text" name="personne" id="userNameRy"  placeholder="与会人员" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0);" data-toggle="modal" data-target="#myModalry" onclick="findUD()"> 
			 	              <h5> <label>会议纪要</label> &emsp;<input type="text" name="jypersonne" id="userNameJy"  placeholder="会议纪要" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalJy" onclick="findUserDeptJy()"></h5> 
			 	              <h5> <label>资源准备</label> &emsp;<input type="text" name="member" id="ziyuana"  placeholder="资源准备" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">
			 	                 <button type="button" class="btn btn-danger" onclick="findQueryResource()" data-toggle="modal" data-target="#myModalzy">选择资源</button>
			 	              </h5> 
			 	              <h5> <label>重复模式</label> &emsp;<select name = "chongfu" id="chongfu" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>日列会</option>
                                     <option>周列会</option>
						             <option>月列会</option>
                               </select></h5>
                              <h5><label>重复间隔</label> &emsp;<input type="checkbox" name="jiange" id="jiange" value="周一">周一&emsp;<input type="checkbox" name="jiange" id="jiange" value="周二">周二&emsp;<input type="checkbox" name="jiange" id="jiange" value="周三">周三&emsp;
			 	              <input type="checkbox" name="jiange" id="jiange" value="四">周四&emsp;<input type="checkbox" name="jiange" id="jiange" value="周五">周五&emsp;<input type="checkbox" name="jiange" id="jiange" value="周六">周六&emsp;<input type="checkbox" name="jiange" id="jiange" value="周日">周日&emsp;</h5> 
			 	              <h5><label>重复策略</label> &emsp;<select name ="celue" id="celue" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>非工作日期:日期不变</option>
                                     <option>非工作日期:推迟到下一工作日</option>
                              </select></h5>
                             <h5><label>重复日期</label>&emsp;<input class="date" name="chongstartdate"  id="chongstartdate" placeholder="开始时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">-
			 	              <input class="date" name="chongenddate" id="chongenddate"  placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 					          
                              
                             <h5><label>会议时间</label>&emsp;<input class="datetimepicker" name="hiuyistartdate"  id="hiuyistartdate" placeholder="开始时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">-
			 	             <input class="datetimepicker" name="hiuyienddate" id="hiuyienddate"  placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 					          
                         </div>
			 	            <div class="col-md-12">
			 	               <h5><label>会议发布</label> &emsp;<input disabled type="text" name="hiuyifabu" id="hiuyifabu"   placeholder="会议发布" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0);" value="会议前 五 天发布会议并发送通知"></h5> 
			 	               <h5> <label>会议内容</label> &emsp;<input type="text" name="content" id="content"   placeholder="会议内容" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	            </div>
			 	         </form>
                    </div>
               </div>  
          </div>
      </div>
  </div>
  
      <!-- 主持人弹框  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModals" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 500px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择人员</label>
                        <table id="userdept"></table> 
                    </div>
               </div> 
            </div>
     </div>
    <!-- 联系人弹框  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModallx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 500px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择人员</label>
                        <table id="userdeptlx"></table> 
                    </div>
               </div> 
            </div>
     </div>
     <!--与会人员  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModalry" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择部门</label>
                         <table id="userRy"></table> 
                    </div>
               </div> 
            </div>
     </div>
    <!--会议记要员  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModalJy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择部门</label>
                         <table id="userdeotJy"></table> 
                    </div>
               </div> 
            </div>
     </div>
    <!--查询资源  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModalzy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width:400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择资源</label>
                         <table id="ziyuan"></table> 
                    </div>
               </div> 
            </div>
     </div>
   
  <script>
     $('.date').datetimepicker({
		  language: 'zh-CN',//显示中文
		  //format: 'yyyy-mm-dd hh:ii:ss',//显示格式
		  format: 'yyyy-mm-dd',//显示格式
		  minView: "month",//设置只显示到月份
		  initialDate: new Date(),//初始化当前日期
		  autoclose: true,//选中自动关闭
		  todayBtn: true//显示今日按钮
		 });
     $('.datetimepicker').datetimepicker({
    	    minView: 0, 
    	         language:  'zh-CN',
    	         format: 'hh:ii',
    	         //todayBtn:  1,//今日按钮
    	         autoclose: 1,//选中关闭
    	         //todayHighlight : 1,
    	         //forceParse : 1,
		 });
     </script>
</body>
</html>