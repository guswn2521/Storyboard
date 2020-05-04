function joincheck(){
    var joinForm=document.joinForm;
    var id=joinForm.id;
    var pw=joinForm.pw;
    var repw=joinForm.repw;
    var name=joinForm.name;
    var nickname=joinForm.nickname;
    var mail=joinForm.mail;
    if(id.value.length===0){
        alert('아이디는 필수입력입니다.');
        id.focus();
        return;
    }
    if(id.value.length<3){
        alert('아이디는 최소 3자 이상입니다.');
        id.focus();
        id.value='';
        return;
    }
    if(pw.value.length===0){
        alert('비밀번호는 필수 입력입니다.');
        pw.focus();
        return;
    }
    if(repw.value.length===0){
        alert('비밀번호확인값은 필수 입력입니다.');
        repw.focus();
        return;
    }
    if(pw.value !== repw.value){
        alert('비밀번호와 비밀번호확인 값은 같아야 합니다.');
        pw.value='';
        pw.focus();
        return;
    }
    if(name.value.length===0){
        alert('이름은 필수 입력입니다.');
        name.focus();
        return;
    }
    if(nickname.value.length===0){
        alert('닉네임은 필수 입력입니다.');
        nickname.focus();
        return;
    }
    if(mail.value.length===0){
        alert('E-mail은 필수 입력입니다.');
        mail.focus();
        return;
    }
    joinForm.submit();
};
