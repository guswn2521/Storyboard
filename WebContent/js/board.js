function writingcheck(){
    var writeForm=document.writeForm;
    var writer = writeForm.writer;
    var title=writeForm.title;
    var contents=writeForm.contents;
    var pw=writeForm.pw;
    if(writer.value.length===0){
        alert('작성자는 필수 입력 입니다');
        writer.focus();
        return;
    }
    if(title.value.length===0){
        alert('제목은 필수 입력 입니다');
        title.focus();
        return;
    }
    if(contents.value.length===0){
        alert('내용은 필수 입력 입니다');
        contents.focus();
        return;
    }
    if(pw.value.length===0){
        alert('비밀번호는 필수 입력 입니다');
        pw.focus();
        return;
    }
    writeForm.submit();
};
function updatecheck(){
    var updateForm=document.updateForm;
    var writer = updateForm.writer;
    var title=updateForm.title;
    var contents=updateForm.contents;
    var pw=updateForm.pw;
    if(!writer.value.length){
        alert('작성자는 필수 입력입니다');
        writer.focus();
        return;
    }
    if(!title.value){
        alert('제목은 필수 입력입니다');
        title.focus();
        return;
    }
    if(!contents.value){
        alert('내용은 필수 입력입니다');
        contents.focus();
        return;
    }
    if(!pw.value){
        alert('비밀번호는 필수 입력입니다');
        pw.focus();
        return;
    }
    updateForm.submit();
};
function reset(){
    writer.value='';
    mail.value='';
    page.value='';
    title.value='';
    contents.value='';
    pw.value='';
    return true;
};
function deletecheck(){
    var deleteForm=document.deleteForm;
    
    if(!deleteForm.dpw.value){
        alert('비밀번호는 필수 입력입니다');
        deleteForm.dpw.value.focus();
        return;
    }
   	deleteForm.submit();

}
