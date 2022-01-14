import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../../Home.dart';
import 'SignUp.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value){
        if(value!.isEmpty){
          return "이메일을 입력하세요.";
        } else {
          if(!RegExp(
              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]"
          ).hasMatch(value)) {
            return "이메일 형식에 맞지 않습니다.";
          }
          return null;
        }
      },
      onSaved: (value)
      {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle, color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          hintText: "이메일",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10)
          ),
      ),
    );
    final passwordField = TextFormField(
      cursorColor: Colors.black45,
      cursorHeight: 17,
      autofocus: false,
      controller: _passwordController,
      obscureText: true,
      validator: (value){
        RegExp regex = RegExp(r'^.{6,}$');
        if(value!.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        if(!regex.hasMatch(value)) {
          return '6자 이상 입력해주세요.';
        }
      },
      onSaved: (value)
      {
        _passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key, color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          hintText: "비밀번호",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
    final loginBtn = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signIn(_emailController.text, _passwordController.text);
        },
        child: const Text(
          'Log In', textAlign: TextAlign.center,
        ),
        textColor: Colors.white,
      ),
    );
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(30),
            children: [
              const SizedBox(
                height: 100,
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 36,
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              emailField,
              const SizedBox(
                height: 8,
              ),
              passwordField,
              const SizedBox(
                height: 16,
              ),
              loginBtn,
              const SizedBox(
                height: 15,
              ),

              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('계정이 없으신가요? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                    },
                    child: const Text(
                        '회원가입',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void signIn(String email, String password) async {
    if(_formKey.currentState!.validate()) {
      await _auth.signInWithEmailAndPassword(email: email, password: password)
          .then((uid)=>{
            Fluttertoast.showToast(msg: "성공적으로 로그인 되었습니다."),
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Home())),
      }).catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
