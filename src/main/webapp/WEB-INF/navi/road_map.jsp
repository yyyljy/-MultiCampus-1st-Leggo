<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>road map</title>

<style type="text/css">
#back {
	width: 300px;
	height: 380px;
	background-color: #5b9bd5;
}

#menu {
	padding-top: 5%;
	text-align: center;
}

#content {
	background-color: white;
	width: 90%;
	margin-left: 5%
}
</style>
</head>
<body>
	<div id="back">
		<div id="menu">
			<b>��� �˻�</b>
			<form action="" method="get" style="background-color: gray;">
				<input type="text" name="departure" placeholder="���" style="width: 70%;" /><br /> <input
					type="text" name="arrive" placeholder="����" style="width: 70%;" /><br /> 
					<input type="reset" value="�ٽ��Է�" />&emsp;&emsp; <input type="submit"
					value="��ã��" />
			</form>
		</div>
		<br />
		<div id="content">
			<b>���ְ��� ���</b> <br /> <em>�� ���:</em><br /> ���̾� <br /> <em>ȸ��/�б�
				���:</em><br /> ��Ƽķ�۽� <br /> <br /> <b>�ֱ� �˻�</b><br /> �ֱ� �˻� ����� �����ϴ�.
			<br /> <br /> <b>���ã��</b><br /> ���ã�� ����� �����ϴ�.
		</div>
	</div>
</body>
</html>