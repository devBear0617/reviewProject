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
//준비
$(document).ready(function() {
	//idChecker
	$.ajax({
		type : "GET",
		url : "/review/mypage/join/idChecker",
		dataType : 'html',
		success : function(html) {
			$(".idChecker").append(html);
		}
	});
	//nmChecker
	$.ajax({
		type : "GET",
		url : "/review/mypage/join/nmChecker",
		dataType : 'html',
		success : function(html) {
			$(".nmChecker").append(html);
		}
	});
});

//id체크
function check_ID(){
    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    //아이디 유효성 검사
    if(!getCheck.test($("#id").val())){
    	alert("올바른 형식의 아이디가 아닙니다.");
    	$("#id").val("");
    	$("#id").focus();
     	return false;
    };
	
	$.ajax({
		url : '/review/mypage/join/idChecker',
		type : 'POST',
		dataType : 'text',
		data : {
			ID : $('.ID').val()
		},
		success : function(html) {
			$(".idChecker").empty();
			$(".idChecker").append(html);
		}
	});
}

//nm체크
function check_NM(){
	var getName= RegExp(/^[가-힣a-zA-Z0-9]+$/);
    //이름 유효성
    if (!getName.test($("#name").val())) {
      	alert("올바른 형식의 닉네임이 아닙니다");
      	$("#name").val("");
      	$("#name").focus();
      	return false;
    };
	
	$.ajax({
		url : '/review/mypage/join/nmChecker',
		type : 'POST',
		dataType : 'text',
		data : {
			NM : $('.NM').val()
		},
		success : function(html) {
			$(".nmChecker").empty();
			$(".nmChecker").append(html);
		}
	});
}

function check_info() {
    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
    var getName= RegExp(/^[가-힣a-zA-Z0-9]+$/);

  	//아이디 공백 확인
    if($("#id").val() == ""){
      	alert("아이디를 확인해주세요.");
      	$("#id").focus();
      	return false;
    }

    //아이디 유효성 검사
    if(!getCheck.test($("#id").val())){
    	alert("올바른 형식의 아이디가 아닙니다.");
    	$("#id").val("");
    	$("#id").focus();
     	return false;
    }

    //비밀번호
    if(!getCheck.test($("#pw").val())) {
    	alert("올바른 형식의 비밀번호가 아닙니다.");
    	$("#pw").val("");
    	$("#pw").focus();
    	return false;
    }

    //아이디랑 비밀번호랑 같은지
    if ($("#id").val()==($("#pw").val())) {
    	alert("아이디와 비밀번호가 일치합니다.");
    	$("#pw").val("");
    	$("#pw").focus();
    	return false;
  	}

    //비밀번호 똑같은지
   if($("#pw").val() != ($("#pwck").val())){ 
    	alert("비밀번호를 다시 확인해주세요.");
    	$("#pw").val("");
    	$("#pwck").val("");
   		$("#pw").focus();
   		return false;
   }

   //이메일 공백 확인
    if($("#mail").val() == ""){
      	alert("이메일을 입력해주세요.");
      	$("#mail").focus();
      	return false;
    }
         
    //이메일 유효성 검사
    if(!getMail.test($("#mail").val())){
      	alert("올바른 이메일의 형식이 아닙니다.")
      	$("#mail").val("");
      	$("#mail").focus();
      	return false;
    }

    //이름 유효성
    if (!getName.test($("#name").val())) {
      	alert("올바른 형식의 닉네임이 아닙니다");
      	$("#name").val("");
      	$("#name").focus();
      	return false;
    }
    
    return true;
}		
</script>

</head>
<jsp:include page="../share/Login_header.jsp" />
<body>

	<div class="center">
		<form action="/review/mypage/join" method="POST" id="joinMember" onsubmit="return check_info()">
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
						<input type="text" id="id" class="ID" maxlength="12"> 
					</td>
				</tr>
				<tr>
					<td colspan="2" class="td_st3">
						<div class="idChecker"></div>
					</td>
				</tr>
				
				<!-- PW -->
				<tr>
					<td class="td_st1">PW</td>
					<td class="td_st2">
						<input type="password" 
							class="text_st_pw" id="pw" maxlength="12">
							*4~12자리의 영문 대소문자와 숫자로만 입력
					</td>
				</tr>
				<tr>
					<td class="td_st1">PW-CHECK</td>
					<td class="td_st2">
						<input type="password" name="member_pw"
							class="text_st_pw" id="pwck" maxlength="12">
					</td>
				</tr>
				
				<!-- NAME -->
				<tr>
					<td class="td_st1">NAME</td>
					<td class="td_st2">
						<input type="text" id="name" class="NM">
					</td>
				</tr>
				<tr>
					<td colspan="2" class="td_st3">
						<div class="nmChecker"></div>
					</td>
				</tr>

				<!-- Email -->
				<tr>
					<td class="td_st1">EMAIL</td>
					<td class="td_st2">
						<input type="text" name="member_email" id="mail"
							class="text_st1">
					</td>
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