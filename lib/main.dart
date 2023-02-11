import 'package:flutter/material.dart';
import 'package:form_login_flutter/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  var _userNameErr = 'Account is Invalid';
  var _passErr = 'Password must be more than 6 characters';
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: const FlutterLogo()),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
              child: Text(
                'Hello\nWelcome Back',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                controller: _userController,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                decoration: InputDecoration(
                    labelText: 'UserName',
                    errorText: _userInvalid ? _userNameErr : null,
                    labelStyle: const TextStyle(
                        color: Color(0xff888888), fontSize: 15)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                    controller: _passController,
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                        labelText: 'PassWord',
                        errorText: _passInvalid ? _passErr : null,
                        labelStyle: const TextStyle(
                            color: Color(0xff888888), fontSize: 15)),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? 'HIDE' : 'SHOW',
                      style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                      onPressed: onSignInClicked,
                      style: ElevatedButton.styleFrom(
                          side:
                          const BorderSide(width: 1, color: Colors.blue)),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 16),
                      ))),
            ),
            SizedBox(
              height: 130,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'New User? Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff888888),
                    ),
                  ),
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClicked() {
    setState(() {
      if(_userController.text.length < 6 || !_userController.text.contains('@')){
        _userInvalid = true;
      }else{
        _userInvalid = false;
      }

      if(_passController.text.length < 6){
        _passInvalid = true;
      }else{
        _passInvalid = false;
      }

      if(!_userInvalid && !_passInvalid){
        Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }

    });
  }
  Widget gotoHome(BuildContext context){
    return const HomePage();
  }
}
