<%@ page  contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
	<%
		String userID =null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
	%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/custom.css">
	<title>JSP AJAX �ǽð� ȸ���� ä�� ����</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="js/bootstrap.js"></script>
	<script type="text/javascript">
		function getUnread(){
			$.ajax({
				type:"POST",
				url:"../chatting/chatUnreadt",
				data:{
					userID:encodeURIComponent('<%=userID%>'),
				},
				success : function(result){
					if(result>=1){
						showUnread(result);
					}else{
						showUnread('');//����� ��� ����
					}
				}
			});
			
		}
		function getInfiniteUnread(){
			setInterval(function(){
				getUnread();
			},4000);//4�ʸ��� �ѹ���
		}
		function showUnread(result){
			$('#unread').html(result);
		}
	</script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<sapn class="icon-bar"></sapn>
				<sapn class="icon-bar"></sapn>
				<sapn class="icon-bar"></sapn>
			</button>
			<a class="navbar-brand" href="../quote/index.jsp">�ǽð� ȸ���� ä�� ����</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="../quote/index.jsp">Main</a></li>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="buton" aria-haspopup="true"
							aria-expanded="false">Quotation<span class="caret"></span>
						</a>	
						<ul class="dropdown-menu">
							<li><a href="../quote/boardViewFcl.jsp">Request FCL List</a></li>
							<li><a href="../quote/boardViewLcl.jsp">Request LCL List</a></li>
							<li><a href="../quote/boardViewAero.jsp">Request AERO List</a></li>
						</ul>	
					</li>	
				</ul> 
				<li><a href="../chat/find.jsp">ģ��ã��</a></li>
				<li><a href="../chat/box.jsp">�޽�����<span id="unread" class="label label-info"></span></a></li>
			</ul>
			<%
				if(userID ==null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="buton" aria-haspopup="true"
						aria-expanded="false">�����ϱ�<span class="caret"></span>
					</a>	
					<ul class="dropdown-menu">
						<li><a href="../member/login.jsp">�α���</a></li>
						<li><a href="../member/join.jsp">ȸ������</a></li>
					</ul>	
				</li>	
			</ul>
			<%
				}else{ 
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">ȸ������<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="../member/update.jsp">ȸ����������</a></li>
						<li><a href="../member/profileUpdate.jsp">�����ʼ���</a></li>
						<li><a href="../member/logoutAction.jsp">�α׾ƿ�</a></li>
					</ul>	
				</li>	
			</ul>
			<%
				 }
			%>
		</div>
	</nav>
	
	<%
		String messageContent = null;
		if(session.getAttribute("messageContent")!=null){
			messageContent=(String)session.getAttribute("messageContent");
		}
		String messageType = null;
		if(session.getAttribute("messageType")!=null){
			messageType=(String)session.getAttribute("messageType");
		}
		if(messageContent !=null){
	%>
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
		  <div class="modal-dialog vertical-align-center">
			<div class="modal-content" <%if(messageType.equals("�����޽���")) out.println("panel-warning"); else out.println("panel-success");%>">
				<div class="modal-header panel-heading">
					<button type="button" class="close" data-dismiss="modal">
						<sapn aria-hidden="true">&times</sapn>
						<span class="sr-only">Close</span>	
					</button>
					<h4 class="modal-title">
						<%=messageType%>
					</h4>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Ȯ��</button>
					</div>
				</div>
			</div>
		   </div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>

	<%	
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
		}
	%>
	<%
		if(userID!=null){
	%>
		<script type="text/javascript">
			$(document).ready(function(){
				getInfiniteUnread();
			});
		</script>
	<%
		}
	%>
</body>
</html>