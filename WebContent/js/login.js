function login(){
    var loginForm=document.loginForm;
    var id=loginForm.id;
    var pw=loginForm.pw;
    if(id.value.length===0){
        alert('아이디는 필수입력입니다.');
        id.focus();
        return;
    }
    else if(pw.value.length===0){
        alert('비밀번호는 필수입력입니다.');
        pw.focus();
        return;
    }
    
    loginForm.submit();
};