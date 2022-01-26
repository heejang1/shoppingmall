class RegularExpression {
  //이름 2글자 이상
  RegExp regExpNa = RegExp(r'^.{2,}$');
  //이메일
  RegExp regExpEm = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
  //비밀번호 6글자 이상
  //TODO: 나중에 수정할것 특수문자, 대소문자, 숫자 포함 8 ~ 15자로 입력하세요.
  RegExp regExpPw = RegExp(r'^.{6,}$');
}