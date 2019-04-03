<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
input:focus {
	outline:none;
	}
	
.center {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.td_st1 {
	width: 90px;
	height: 30px;
	text-align: center;
}

.td_st2 {
	width: 200px;
	height: 30px;
	text-align: center;
}

.td_st3 {
	width: 300px;
	text-align: right;
}

.text_st1 {
	width: 200px;
	height: 20px;
}

.text_st_id {
	width: 200px;
	height: 20px;
}

.text_st_pw {
	width: 200px;
	height: 20px;
}

.text_st_pwck {
	width: 200px;
	height: 20px;
}

.text_st_nm {
	width: 200px;
	height: 20px;
}

.btn_st1 {
	background-image: url('resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
}

.btn_st2 {
	background-image: url('resources/image/REMON_smallbar.png');
	color: white;
	width: 300px;
	height: 30px;
	border-radius: 10px;
	border-style: none;
	width: 90px;
	height: 30px;
	text-align: center;
}
</style>

<script type="text/javascript"
	src="/review/resources/script/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "GET",
			url : "/review/mypage/join/idText",
			dataType : 'html',
			success : function(html) {
				$(".idText").append(html);
			}
		});
		
		$.ajax({
			type : "GET",
			url : "/review/mypage/join/nmText",
			dataType : 'html',
			success : function(html) {
				$(".nmText").append(html);
			}
		});
		
		$.ajax({
			type : "GET",
			url : "/review/mypage/join/idChecker",
			dataType : 'html',
			success : function(html) {
				$(".idChecker").append(html);
			}
		});	
		
		$.ajax({
			type : "GET",
			url : "/review/mypage/join/nmChecker",
			dataType : 'html',
			success : function(html) {
				$(".nmChecker").append(html);
			}
		});	
		
	});

	function check_ID() {
		$.ajax({
			url : '/review/mypage/join/idChecker',
			type : 'POST',
			dataType : 'text',
			data : {
				text_st_id : $('.text_st_id').val()
			},
			success : function(html) {
				$(".idChecker").empty();
				$(".idChecker").append(html);
			}
		});
	};
	
	function hold_ID() {
		$.ajax({
			url : '/review/mypage/join/idHolder',
			type : 'POST',
			dataType : 'text',
			data : {
				text_st_id : $('.text_st_id').val(),
				ID : $('.ID').val()
			},
			success : function(html) {
				if ($('.ID').val() == $('.text_st_id').val()) {
					$(".idText").empty();
					$(".idChecker").empty();
					$(".idTextHold").append(html);
				} else {
					$(".idChecker").empty();
					$(".idChecker").append(html);
				}
			}
		});
	};
	
	function check_NM() {
		$.ajax({
			url : '/review/mypage/join/nmChecker',
			type : 'POST',
			dataType : 'text',
			data : {
				text_st_nm : $('.text_st_nm').val()
			},
			success : function(html) {
				$(".nmChecker").empty();
				$(".nmChecker").append(html);
			}
		});
	};
	
	function hold_NM() {
		$.ajax({
			url : '/review/mypage/join/nmHolder',
			type : 'POST',
			dataType : 'text',
			data : {
				text_st_nm : $('.text_st_nm').val(),
				NM : $('.NM').val()
			},
			success : function(html) {
				if ($('.NM').val() == $('.text_st_nm').val()) {
					$(".nmText").empty();
					$(".nmChecker").empty();
					$(".nmTextHold").append(html);
				} else {
					$(".nmChecker").empty();
					$(".nmChecker").append(html);
				}
			}
		});
	};
	
	function check_Info(){
		var pw = document.getElementById("pw").value;
		var pwck = document.getElementById("pwck").value;
		
		if(pw == null || pwck == null || pw != pwck) {
			alert('비밀번호가 틀렸습니다. 다시 입력해 주세요');
			document.getElementById('pwCheck').innerHTML = '*비밀번호를 다시 확인해 주세요.';
			return false;
		} 
 		
		
		/* var text_id = $('.text_st_id').val();
		var text_nm = $('.text_st_nm').val();
		alert(text_id+', '+text_nm);
		console.log(text_id);
		console.log(text_nm);
		if (text_id.isEmpty()) {
			alert('정보 부족');
			return false;
		}
		
		var check1 = document.getElementById("Check1").value;
		var check2 = document.getElementById("Check2").value;
		console.log('1'+check1);
		console.log('2'+check2);
		
		if(check1.isEmpty() || check2.isEmpty()){
			alert("정보누락");
			return false;
		}
		
		if(check1.equals("true")){
			if(check2.equals("true")) {
				return true;
			} else {
				alert('닉네임을 다시 확인해 주세요.');
				return false;
			}
		} else {
			alert('아이디를 다시 확인해 주세요.');
			return false;
		} */
		
	};
	
	
</script>

</head>
<jsp:include page="../share/Login_header.jsp" />
<body>

	<div class="center">
		<form action="/review/mypage/join" method="POST" id="joinMember"
			enctype="multipart/form-data" onsubmit="return check_Info()">
			<div style="height: 100px;"></div>
			<table class="center">
				<tr
					style="text-align: center; background: linear-gradient(to right, #ffe400, #abf200);">
					<td colspan="2"><h1>회원가입 PAGE</h1></td>
				</tr>
				<tr>
					<td colspan="2"><br></td>
				<tr>
				
				<!-- ID -->
				<tr>
					<td class="td_st1">ID</td>
					<td class="td_st2">
						<div class="idText"></div>
						<div class="idTextHold"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="td_st3">
						<div class="idChecker"></div>
						<input type="hidden" id="Check1" value="${Check1}">
					</td>
				</tr>
				
				<!-- PW -->
				<tr>
					<td class="td_st1">PW</td>
					<td class="td_st2"><input type="password"
						class="text_st_pw" id="pw"></td>
				</tr>
				<tr>
					<td class="td_st1">PW-CHECK</td>
					<td class="td_st2"><input type="password" name="member_pw"
						class="text_st_pw" id="pwck"></td>
				</tr>
				<tr>
					<td colspan="2" class="td_st3">
						<span id="pwCheck" style="color:red; font-size: small;"></span> 
					</td>
				</tr>
				
				<!-- NAME -->
				<tr>
					<td class="td_st1">NAME</td>
					<td class="td_st2">
						<div class="nmText"></div>
						<div class="nmTextHold"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="td_st3">
						<div class="nmChecker"></div>
						<input type="hidden" id="Check2" value="${Check2}">
					</td>
				</tr>

				<!-- Email -->
				<tr>
					<td class="td_st1">EMAIL</td>
					<td class="td_st2"><input type="text" name="member_email"
						class="text_st1"></td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>
				
				<!-- button -->
				<tr>
					<td colspan="2"><input type="submit" value="가입"
						class="btn_st1"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="취소" class="btn_st1"
							onclick="window.location.reload()">
					</td>
				</tr>
				<tr>
					<td colspan="2"><hr></td>
				</tr>

			</table>
		</form>
	</div>
	<div class="center">
		<input type="button" value="홈" onclick="location.href='/review/'"
			class="btn_st2">
	</div>
	<div style="height: 100px;"></div>

</body>
<jsp:include page="../share/footer.jsp" />
</html>