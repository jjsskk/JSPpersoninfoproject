<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./my_add.css"/>
    <title>Add Form</title>
    <style>

    </style>
</head>
<script>
    function formcheck() {
        var id = document.form1.id;
        if (id.value == "") {
            alert("id를 입력하세요");
            id.focus();
            return false;
        }
        var name = document.form1.name;
        if (name.value == "") {
            alert("이름를 입력하세요");
            name.focus();
            return false;
        }

        var pwd = document.form1.pwd;
        if (pwd.value == "") {
            alert("비밀번호를 입력하세요")
            pwd.focus();
            return false;
        }
        if (id.value.length < 3) {
            alert("id는 3글자이상이여야 합니다");
            id.focus();
            return false;
        }
        if (pwd.value.length < 3) {
            alert("비밀번호는 3글자이상이여야 합니다");
            id.focus();
            return false;
        }
        var phone = document.form1.phone_num;
        if (phone.value.length >11) {
            alert("전화번호는 11자리까지 010xxxxyyyy형태로 입력하세요!")
            pwd.focus();
            return false;
        }
    }

    function mouseOver(title) {
        title.style.color = "blue";
    }

    function mouseOut(title) {
        title.style.color = "black";
    }
</script>
<body>

<form name="form1" action="addpost.jsp" method="post" enctype="multipart/form-data" onsubmit="return formcheck()">
    <fieldset>
        <img src="./img/logo.svg" alt="logo">
        <h2 id="title" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">개인정보입력</h2>
        <div class="row">
            <div class="col-25"><label for="id" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">아이디:</label>
            </div>
            <div class="col-75"><input type="text" id="id" name="id" placeholder="3자 이상 입력"></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="name" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">이름:</label>
            </div>
            <div class="col-75"><input type="text" id="name" name="name" placeholder="3자 이상 입력"></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="pwd" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">비밀번호:</label>
            </div>
            <div class="col-75"><input type="password" id="pwd" name="pwd" placeholder="3자 이상 입력"></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="photo" onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">사진:</label>
            </div>
            <div class="col-75"><input type="file" id="photo" name="photo" ></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="phone" onmouseover="mouseOver(this)"
                                       onmouseout="mouseOut(this)">폰번호:</label></div>
            <div class="col-75"><input type="text" id="phone" name="phone_num" placeholder="010xxxxyyyy"></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="address" onmouseover="mouseOver(this)"
                                       onmouseout="mouseOut(this)">주소:</label></div>
            <div class="col-75"><input type="text" id="address" name="address"></div>
        </div>
        <div class="row">
            <div class="col-25"><label onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">성별:</label></div>

            <div class="col-37-5"><input type="radio" id="gender1" name="gender" value="M" checked><label>남</label>
            </div>
            <div class="col-37-5"><input type="radio" id="gender2" name="gender" value="W"><label>여</label></div>
        </div>
        <div class="row">
            <div class="col-25"><label onmouseover="mouseOver(this)" onmouseout="mouseOut(this)">취미:</label></div>
            <div class="col-25"><input type="checkbox" id="movie" name="hobby_movie" value="1" checked><label
                    for="movie">영화보기</label></div>
            <div class="col-25"><input type="checkbox" id="strength" name="hobby_health" value="1"><label
                    for="strength">헬스</label></div>
            <div class="col-25"><input type="checkbox" id="sew" name="hobby_sew" value="1"><label for="sew">뜨개질</label></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="major" onmouseover="mouseOver(this)"
                                       onmouseout="mouseOut(this)">전공선택:</label></div>
            <div class="col-75">
                <select id="major" name="major">
                    <optgroup label="자연계열">
                        <option value="전산전자공학부">전산전자공학부</option>
                        <option value="생명과학부">생명과학부</option>
                        <option value="기계제어공학부">기계제어공학부</option>
                    </optgroup>
                    <optgroup label="인문계열">
                        <option value="상담사회심리학부">상담사회심리학부</option>
                        <option value="경영경제학부">경영경제학부</option>
                        <option value="법학부">법학부</option>
                    </optgroup>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-25"><label for="date" onmouseover="mouseOver(this)"
                                       onmouseout="mouseOut(this)">생년월일:</label></div>
            <div class="col-75"><input id="date" type="date" min="1990-01-01" max="2022-12-31" name="birth"></div>
        </div>
        <div class="row">
            <div class="col-25"><label for="content" onmouseover="mouseOver(this)"
                                       onmouseout="mouseOut(this)">자기소개:</label></div>
            <div class="col-75"><textarea id="content" name="content" cols=30 rows=5 placeholder="자기소개 해주세요"></textarea></div>
        </div>
        <div id="sub"><input type="submit" value="저장"><input type="button" onclick= 'history.back()' value="취소" ></div>
    </fieldset>


</form>

</body>
</html>
