function fn_submit() {
	if(document.frm.sno.value.trim() == "") {
		alert("학생번호가 입력되지 않았습니다.")
		frm.sno.focus();
		return false;
	}
	if(document.frm.ekor.value.trim() == "") {
		alert("국어점수가 입력되지 않았습니다.")
		frm.ekor.focus();
		return false;
	}
	if(document.frm.emath.value.trim() == "") {
		alert("수학점수가 입력되지 않았습니다.")
		frm.emath.focus();
		return false;
	}
	if(document.frm.eeng.value.trim() == "") {
		alert("영어점수가 입력되지 않았습니다.")
		frm.eeng.focus();
		return false;
	}
	if(document.frm.ehist.value.trim() == "") {
		alert("역사점수가 입력되지 않았습니다.")
		frm.ehist.focus();
		return false;
	}
	
	alert("학생성적이 모두 입력되었습니다.")
	return true;
}