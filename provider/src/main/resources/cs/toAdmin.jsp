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
	 <div>
		  <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" ><h5>&nbsp;&nbsp;&nbsp;新建会议&nbsp;&nbsp;&nbsp;</h5></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" onclick="toTaoZhuan()"><h5>&nbsp;&nbsp;&nbsp;周期会议&nbsp;&nbsp;&nbsp;</h5></button><br/>
	     <div style="float:right">*</div>  
		  <hr class=dotline color=#111111 size=1>
	  </div>
	 <div>
	  <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">会议发起</button>&nbsp;&nbsp;  
			  <button type="button" class="btn btn-info" id="bang" onclick="updateAdmin()" data-toggle="modal" data-target="#myModalxg">变更</button>&nbsp;&nbsp;
			  <button type="button" class="btn btn-info" id="huizhi">查看回执</button>&nbsp;&nbsp;
			  <button type="button" class="btn btn-info" id="quxiao" onclick="updateStartquxiao()">取消</button>&nbsp;&nbsp;
			  <button type="button" class="btn btn-info" id="fasong">发送会议通知</button>&nbsp;&nbsp;
			  <button type="button" class="btn btn-info" id="jiyao" onclick="findJiyao()" data-toggle="modal" data-target="#myModaljiyao">纪要</button>&nbsp;&nbsp;
		  <button type="button" class="btn btn-info" id="daleten" onclick="deleteAdmin()">删除</button>&nbsp;&nbsp;
	      <div style="float:right">
	         <button type="button" class="btn btn-info" onclick="search()">查询</button>
	         <input type="text" class="form-control"  id="name" placeholder="请输入名称">
	      </div>
	   </div>
	  </div>
	<div>
	<hr class=dotline color=#111111 size=1>
	  <table id="adminTable"></table>
	</div>
 </div> 
   <script type="text/javascript">
	 function toTaoZhuan(){
		  location.href="<%=request.getContextPath()%>/tze/toTaoZhuan.do"
	 }
	 
		 $(function(){
			 search()
		 })

	 function search(){
		 $('#adminTable').bootstrapTable('destroy');
			$('#adminTable').bootstrapTable({
				//toolbar:'#toolbar',
				url:'<%=request.getContextPath()%>/tze/findAdmin.do',//获取数据地址 
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
						{field:'startdate',title:'会议时间',width:100},    
						{field:'meetingname',title:'会议地点',width:100},    
						{field:'deotname',title:'主办部门',width:100,},
						{field:'uname',title:'主持人',width:100,},
						{field:'start',title:'全部',width:100,
							formatter:function(value,row,index){ 
							   if(row.start==1){ return "审批中"}
							   if(row.start==2){ return "待召开"}
							   if(row.start==3){ return "已结束"}
							   if(row.start==4){ return "已取消"}
							   if(row.start==5){ return "未发生"}
							   if(row.start==6){ return "未通过"}
							   if(row.start==7){ return "已退文"}
						     }	
						},
						  {field:'minutes',title:'纪要',width:100},    
			          ],
			          onClickRow:function(row){
			         	 $("#adminTable").on('click-row.bs.table', function (e, row, element){
		            		 if($(element).hasClass('selected')){//这里进行了判断是否选中
		            		 	//去除之前选中的行的
            		   		$("#bang").attr("disabled",false);
			        		$("#huizhi").attr("disabled",false);
			        		$("#quxiao").attr("disabled",false);
			        		$("#jiyao").attr("disabled",false);
			        		$("#fasong").attr("disabled",false);
		            		 }
		            	});
			        	if(row.start==1){
			        		$("#bang").attr("disabled","disabled");
			        		$("#huizhi").attr("disabled","disabled");
			        		$("#quxiao").attr("disabled","disabled");
			        		$("#jiyao").attr("disabled","disabled");
			        		$("#fasong").attr("disabled","disabled");
			        	}
			        	if(row.start==2){
			        		 $("#daleten").attr("disabled","disabled");
			        		 $("#jiyao").attr("disabled","disabled");
			        	}
			        	if(row.start==3){
			        		$("#bang").attr("disabled","disabled");
			        		$("#huizhi").attr("disabled","disabled");
			        		$("#quxiao").attr("disabled","disabled");
			        		$("#fasong").attr("disabled","disabled");
			        	}
			        	if(row.start==4){
			        		$("#bang").attr("disabled","disabled");
			        		$("#huizhi").attr("disabled","disabled");
			        		$("#quxiao").attr("disabled","disabled");
			        		$("#jiyao").attr("disabled","disabled");
			        		$("#fasong").attr("disabled","disabled");
			        	}
			        	if (row.start==5) {
			        		$("#huizhi").attr("disabled","disabled");
			        		$("#quxiao").attr("disabled","disabled");
			        		$("#jiyao").attr("disabled","disabled");
			        		$("#fasong").attr("disabled","disabled");
						}if (row.start==6) {
							$("#bang").attr("disabled","disabled");
			        		$("#huizhi").attr("disabled","disabled");
			        		$("#quxiao").attr("disabled","disabled");
			        		$("#jiyao").attr("disabled","disabled");
			        		$("#fasong").attr("disabled","disabled");
						}
			          }
			 });
	 }
	/* 	  formatter:function(value,row,index){
	   var curTime = new Date();
	 //把字符串格式转化为日期类
	   var startdate = new Date(Date.parse(row.startdate));
	      alert(startdate);
	   var enddate = new Date(Date.parse(row.enddate));
	      alert(enddate);
     if (curTime<startdate&&curTime>enddate&&row.start==8) {
		  return "正在开"
	   }
	 //进行比较 */
	 
	 function deleteAdmin(){
		         var ids = "";
			var  row = $("#adminTable").bootstrapTable("getSelections");
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
    //选择部门
   function deptTree() {
	$.ajax({
		type:"post",
		url:"<%=request.getContextPath()%>/tze/findTree.do",
		success:function (data){
			//渲染树插件 treeview()
			alert(data[0].name)
			$("#deptTreeDiv ").treeview({
				//data属性 树节点信息 json数组
				  data: data,
				  //tree默认展开的节点级别默认为2
				  levels: 0,
				  //含有子节点的图标
				  collapseIcon:'glyphicon glyphicon-star-empty',
				  //没有子节点的图标
				  emptyIcon:'glyphicon glyphicon-usd',
				  //背景颜色
				  //backColor: 'green'
				  //是否显示复选框
				  showCheckbox:true,
				  //是否允许选中多个节点
				  //multiSelect:true,
				  //启用节点的超链接功能默认为false,节点需指定href属性
				  enableLinks:true,
				  //事件当节点选中时
				  onNodeSelected:function(event,node){
					  //动态向 nav-tabs 导航标签添加tab选项卡
					  //addTabs方法  add() 添加tab  close()关闭tab  closeAll() 关闭全部tab
					  if(null !=  node.url && '' != node.url){
						  $.addtabs.add({
							   id:node.id,
							   title:node.text,
							   url:"<%=request.getContextPath()%>/"+node.url,
						  })
					  }
				  }
		    })
		}
	});
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
    //发送请求
	     function saveAdmin(start) {
			 $.ajax({
				 url:"<%=request.getContextPath()%>/tze/saveAdmins.do?start="+start,
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
    //保存请求
     function saveAdminbaocun(start) {
		 $.ajax({
			 url:"<%=request.getContextPath()%>/tze/saveAdminbaocun.do?start="+start,
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
		  var  row = $("#adminTable").bootstrapTable("getSelections");
	      for (var i = 0; i < row.length; i++) {
			 		aid += aid==""?row[i].aid:","+row[i].aid;
			  }
			    $.ajax({
			    	url:'<%=request.getContextPath()%>/tze/updateAdmin.do',
			    	data:{aid:aid},
			        success:function(data){
			        	$("#ida").val(data.aid),
			        	$("#aname").val(data.aname),
			        	$("#uname").val(data.uname),
			        	$("#userNamea").val(data.phonename),
			        	$("#meetingname").val(data.meetingname),
			        	$("#startdates").val(data.startdate),
			        	$("#meetingtype").val(data.meetingtype),
			        	$("#deotname").val(data.deotname),
			        	$("#phoneway").val(data.phoneway),
			        	$("#enddates").val(data.enddate),
			        	$("#userNameRy").val(data.personne),
			        	$("#userNameJy").val(data.jypersonne),
			        	$("#ziyuana").val(data.member),
			        	$("#contents").val(data.content)
			        }
			    })
      } 
    //变更
     function updatebangAdmin(start) {
		 $.ajax({
			 url:"<%=request.getContextPath()%>/tze/updatebangAdmin.do?start="+start,
			 type:'post',
			 data:$("#UpdateadminForm").serialize(),
		  success:function(data){
		  	alert("修改成功")
		       if($("#myModalxg").css("display")=="block"){
				   $("#myModalxg").hide();
				 }  
		  	   window.location.reload();
		     }  
		 })
	}  
     //保存请求
     function updatebaocAdmin(start) {
		 $.ajax({
			 url:"<%=request.getContextPath()%>/tze/updatebaocAdmin.do?start="+start,
			 type:'post',
			 data:$("#UpdateadminForm").serialize(),
		  success:function(data){
		  	alert("保存成功")
		       if($("#myModal").css("display")=="block"){
				   $("#myModal").hide();
				 }  
		  	   window.location.reload();
		     }  
		 })
	}
   //从已预订中发起会议
    function findbaoAdmin() {
			$("#hiuyi").bootstrapTable({
				 url:"<%=request.getContextPath()%>/tze/findbaoAdmin.do",	
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
						{field:'aname',title:'会议主题',width:100},
						{field:'startdate',title:'会议时间',width:100},
						{field:'deptname',title:'会议室',width:100},
						{field:'meetingname',title:'会议人员',width:100},
						{field:'member',title:'资源准备',width:100},
				         ],
				         onClickRow:function(row){
				        	useronClickRowJy();
				         }
			     });
        	}
      //取消
       function updateStartquxiao() {
    	       var id = "";
 		  var  row = $("#adminTable").bootstrapTable("getSelections");
 	      for (var i = 0; i < row.length; i++) {
 			 		id += id==""?row[i].aid:","+row[i].aid;
 			  }
 	      $.ajax({
 	    	  url:'<%=request.getContextPath()%>/tze/updateStartquxiao.do',
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
      //纪要
      function findJiyao() {
    	  var aid = "";
		  var  row = $("#adminTable").bootstrapTable("getSelections");
	      for (var i = 0; i < row.length; i++) {
			 		aid += aid==""?row[i].aid:","+row[i].aid;
			  }
			    $.ajax({
			    	url:'<%=request.getContextPath()%>/tze/updateAdmin.do',
			    	data:{aid:aid},
			        success:function(data){
			        	$("#ida").val(data.aid),
			        	$("#anames").val(data.aname),
			        	$("#uname").val(data.uname),
			        	$("#userNamea").val(data.phonename),
			        	$("#meetingnames").val(data.meetingname),
			        	$("#startdatess").val(data.startdate),
			        	$("#meetingtype").val(data.meetingtype),
			        	$("#deotname").val(data.deotname),
			        	$("#phoneway").val(data.phoneway),
			        	$("#enddatess").val(data.enddate),
			        	$("#auserNameRy").val(data.personne),
			        	$("#auserNameJy").val(data.jypersonne),
			        	$("#ziyuana").val(data.member),
			        	$("#acontents").val(data.content)
			        }
			    })
	}

</script>
    
  <!-- 修改框（Modal） -->
   <div  class="modal fade" id="myModalxg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog" >
           <div class="modal-content" style="height: 500px;width: 800px">
               <div  style="modal:true;width:800px; height:500px;background:url('<%=request.getContextPath()%>/user/lala.jpeg');background-size: cover;" class="modal-header" style="height: 500px;width: 800px">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    &emsp;&emsp;<h4 class="modal-title" id="myModalLabel">会议发起</h4>
                    &emsp;&emsp;<button type="button" class="btn btn-danger" onclick="updatebangAdmin(1)">发送申请</button>&emsp;
                                <button type="button" class="btn btn-danger" onclick="updatebaocAdmin(0)">保存申请</button><br/>
                    <div id="content" class="row-fluid">
                     <form id="UpdateadminForm"> 
                         <input type="hidden" name="aid" id="ida">
					     <div class="col-md-6">
                              <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModaljm" onclick="findbaoAdmin()">从已预订中发起会议</button><br/>    
					          <h5><label>会议主题</label>&emsp;<input type="text" name="aname" id="aname" placeholder="会议主题"  style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)"></h5>
					          <h5><label>主持人</label>&emsp;&emsp;<input type="text" name="uname" id="uname" placeholder="主持人" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)" data-toggle="modal" data-target="#myModals"></h5>
					          <h5><label>联系人</label>&emsp;&emsp;<input type="text" name="phonename" id="userNamea"  size="25" placeholder="联系人" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModallx"></h5>
					       <div>
					          <h5><label>会议室</label>&emsp;<select name = "meetingname" id="meetingname" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
						             <option>第一会议室</option>
                                     <option>第二会议室</option>
						             <option>大会议室</option>
						             <option>小会议室</option>
                               </select></h5>
					       </div>
					          <h5><label>开始时间</label>：&emsp;<input class="date" name="startdate" id="startdates" size="25" placeholder="开始时间" style="border:0px;background:rgba(0, 0, 0, 0);"></h5>
					      </div>
					   <div class="col-md-6"><br/>
					          <h5><label>会议类型</label>&emsp;<select name = "meetingtype" id="meetingtype" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>生产</option>
                                     <option>策划</option>
						             <option>人士</option>
						             <option>学习</option>
                               </select></h5>
 
					          <h5><label>主办部门</label>&emsp;<input type="text" name="deotname" id="deotname"  placeholder="主办部门" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalbm"></h5> 
					          <h5><label>联系方式</label>&emsp;<input type="text" name="phoneway" id="phoneway"  placeholder="联系方式" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5><br/>
					          <h5><label>结束时间</label>&emsp;<input class="date" name="enddate"  id="enddates" placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	        </div>                                                                           																								
			 	        <div class="col-md-12">
			 	              <label>与会人员</label> &emsp;<input type="text" name="personne" id="userNameRy"  placeholder="与会人员" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0);" data-toggle="modal" data-target="#myModalry"> 
			 	              <h5> <label>会议纪要</label> &emsp;<input type="text" name="jypersonne" id="userNameJy"  placeholder="会议纪要" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalJy"></h5> 
			 	              <h5> <label>资源准备</label> &emsp;<input type="text" name="member" id="ziyuana"  placeholder="资源准备" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">
			 	                 <button type="button" class="btn btn-danger" onclick="findQueryResource()" data-toggle="modal" data-target="#myModalzy">选择资源</button>
			 	              </h5> 
			 	              <h5> <label>会议内容</label> &emsp;<input type="text" name="content" id="contents"   placeholder="会议内容" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	         </div>
			 	              <hr class=dotline color=#111111 size=1>
			 	              </form>
                    </div>
               </div>  
          </div>
      </div>
  </div>  
  
   <!-- 纪要  -->
      <div  class="modal fade" id="myModaljiyao" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog" >
           <div class="modal-content" style="height: 500px;width: 800px">
               <div  style="modal:true;width:800px; height:500px;background:url('<%=request.getContextPath()%>/user/lala.jpeg');background-size: cover;" class="modal-header" style="height: 500px;width: 800px">
                <h4>会议纪要</h4>
                    <div id="content" class="row-fluid">
                     <form id="UpdateadminForm"> 
                         <input type="hidden" name="aid" id="ida">
					     <div class="col-md-6">
					          <h5><label>会议主题</label>&emsp;<input disabled type="text" name="aname" id="anames" placeholder="会议主题"  style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)"></h5>
					       <div>
					          <h5><label>会议室</label>&emsp;<select disabled name = "meetingname" id="meetingnames" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
						             <option>第一会议室</option>
                                     <option>第二会议室</option>
						             <option>大会议室</option>
						             <option>小会议室</option>
                               </select></h5>
					       </div>
					          <h5><label>开始时间</label>&emsp;<input disabled class="date" name="startdate" id="startdatess" size="25" placeholder="开始时间" style="border:0px;background:rgba(0, 0, 0, 0);"></h5>
					          <h5><label>结束时间</label>&emsp;<input disabled class="date" name="enddate"  id="enddatess" placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
					      </div>
					   <div class="col-md-6"><br/>
					          <h5><label>会议类型</label>&emsp;<select disabled name = "meetingtype" id="meetingtype" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>生产</option>
                                     <option>策划</option>
						             <option>人士</option>
						             <option>学习</option>
                               </select></h5>
 
					          <h5><label>主办部门</label>&emsp;<input type="text" name="deotname" id="deotname"  placeholder="主办部门" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalbm"></h5> 
					          <h5><label>联系方式</label>&emsp;<input type="text" name="phoneway" id="phoneway"  placeholder="联系方式" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5><br/>
			 	        </div>                                                                           																								
			 	        <div class="col-md-12">
			 	                   <label>与会人员</label> &emsp;<input disabled type="text" name="personne" id="auserNameRy"  placeholder="与会人员" style="width:400px;height:40px;border:0px;background:rgba(0, 0, 0, 0);" data-toggle="modal" data-target="#myModalry"> 
			 	              <h5> <label>会议纪要</label> &emsp;<input disabled type="text" name="jypersonne" id="auserNameJy"  placeholder="会议纪要" style="width:400px;height:40px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalJy"></h5> 
			 	              <h5> <label>会议内容</label> &emsp;<input disabled type="text" name="content" id="acontents"   placeholder="会议内容" style="width:400px;height:40px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	         </div>
			 	              <hr class=dotline color=#111111 size=1>
			 	              </form>
                    </div>
               </div>  
          </div>
      </div>
  </div>  
   

   <!-- 模态框（Modal） -->
   <div  class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
       <div class="modal-dialog" >
           <div class="modal-content" style="height: 500px;width: 800px">
               <div  style="modal:true;width:800px; height:500px;background:url('<%=request.getContextPath()%>/user/lala.jpeg');background-size: cover;" class="modal-header" style="height: 500px;width: 800px">
                   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    &emsp;&emsp;<h4 class="modal-title" id="myModalLabel">会议发起</h4>
                    &emsp;&emsp;<button type="button" class="btn btn-danger" onclick="saveAdmin(1)">发送申请</button>&emsp;
                                <button type="button" class="btn btn-danger" onclick="saveAdminbaocun(0)">保存申请</button><br/>
                    <div id="content" class="row-fluid">
                     <form id="adminForm"> 
					     <div class="col-md-6">
                              <button type="button" class="btn btn-sm" data-toggle="modal" data-target="#myModaljm" onclick="findbaoAdmin()">从已预订中发起会议</button><br/>    					          <h5><label>会议主题</label>&emsp;<input type="text" name="aname" id="aname" placeholder="会议主题"  style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)"></h5>
					          <h5><label>主持人</label>&emsp;&emsp;<input type="text" name="uname" id="unames" placeholder="主持人" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)" data-toggle="modal" data-target="#myModals"></h5>
					          <h5><label>联系人</label>&emsp;&emsp;<input type="text" name="phonename" id="userNameas"  size="25" placeholder="联系人" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModallx"></h5>
					       <div>
					          <h5><label>会议室</label>&emsp;<select name = "meetingname" id="meetingname" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
						             <option>第一会议室</option>
                                     <option>第二会议室</option>
						             <option>大会议室</option>
						             <option>小会议室</option>
                               </select></h5>
					       </div>
					          <h5><label>开始时间</label>：&emsp;<input class="date" name="startdate" id="startdates" size="25" placeholder="开始时间" style="border:0px;background:rgba(0, 0, 0, 0);"></h5>					          
					   </div>
					   <div class="col-md-6"><br/>
					          <h5><label>会议类型</label>&emsp;<select name = "meetingtype" id="meetingtype" style = "width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0)">
                                     <option>生产</option>
                                     <option>策划</option>
						             <option>人士</option>
						             <option>学习</option>
                               </select></h5>
 
					          <h5><label>主办部门</label>&emsp;<input type="text" name="deotname" id="deotname"  placeholder="主办部门" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalbm"></h5> 
					          <h5><label>联系方式</label>&emsp;<input type="text" name="phoneway" id="phoneway"  placeholder="联系方式" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5><br/>
					          <h5><label>结束时间</label>&emsp;<input class="date" name="enddate"  id="enddates" placeholder="结束时间" style="width:200px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	        </div>                                                                           																								
			 	        <div class="col-md-12">
			 	              <label>与会人员</label> &emsp;<input type="text" name="personne" id="userNameRys"  placeholder="与会人员" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0);" data-toggle="modal" data-target="#myModalry"> 
			 	              <h5> <label>会议纪要</label> &emsp;<input type="text" name="jypersonne" id="userNameJys"  placeholder="会议纪要" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); " data-toggle="modal" data-target="#myModalJy"></h5> 
			 	              <h5> <label>资源准备</label> &emsp;<input type="text" name="member" id="ziyuanas"  placeholder="资源准备" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); ">
			 	                 <button type="button" class="btn btn-danger" onclick="findQueryResource()" data-toggle="modal" data-target="#myModalzy">选择资源</button>
			 	              </h5> 
			 	              <h5> <label>会议内容</label> &emsp;<input type="text" name="content" id="contents"   placeholder="会议内容" style="width:400px;height:20px;border:0px;background:rgba(0, 0, 0, 0); "></h5> 
			 	         </div>
			 	              <hr class=dotline color=#111111 size=1>
			 	              </form>
                    </div>
               </div>  
          </div>
      </div>
  </div>
     
   
           
        <!-- 主持人弹框  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModals" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择人员</label>
                         <button type="button" class="btn btn-info" onclick="userdeptTable()">所有人员</button>
                        <table id="userdept"></table> 
                    </div>
               </div> 
            </div>
     </div>
    <!-- 联系人弹框  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModallx" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择人员</label>
                         <button type="button" class="btn btn-info" onclick="userdeptTablelx()">所有人员</button>
                        <table id="userdeptlx"></table> 
                    </div>
               </div> 
            </div>
     </div>
    <!--主办部门  -->
  <div  class="modal fade;left:50%;top:50%"  id="myModalbm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width: 400px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label> 选择部门</label>
                         <button type="button" class="btn btn-info" onclick="deptTree()">所有人员</button>
                        <div id="deptTreeDiv"></div> 
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
                         <button type="button" class="btn btn-info" onclick="findUD()">所有人员</button>
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
                         <button type="button" class="btn btn-info" onclick="findUserDeptJy()">所有人员</button>
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
     
  <div  class="modal fade;left:50%;top:50%"  id="myModaljm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" >
               <div class="modal-content" style="height: 400px;width:600px;margin-left: 200px;margin-top:100px">
                    <div><br/>
                        <label>保存的会议</label>
                         <table id="hiuyi"></table> 
                    </div>
               </div> 
            </div>
     </div>
     <script>
     $('.date').datetimepicker({
		  language: 'zh-CN',//显示中文
		  //format: 'yyyy-mm-dd hh:ii:ss',//显示格式
		  format: 'yyyy-mm-dd hh:ii:ss',//显示格式
		  minView: "month",//设置只显示到月份
		  initialDate: new Date(),//初始化当前日期
		  autoclose: true,//选中自动关闭
		  todayBtn: true//显示今日按钮
		 });
     </script>
</body>
</html>