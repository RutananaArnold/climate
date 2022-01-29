import 'package:agriculture_app/components/RoundedInputField.dart';
import 'package:agriculture_app/components/RoundedPasswordField.dart';
import 'package:agriculture_app/screens/register.dart';
import 'package:agriculture_app/components/rounded_button.dart';
import 'package:flutter/material.dart';

import '../components/palette.dart';
import 'index.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool _shConfirmPass = true;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25.0),
            const Text(
              "Agriculture Mobile",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.8,
                  color: Colors.white),
            ),
            const SizedBox(height: 25.0),
            headerSection(),
            const SizedBox(height: 25.0),
            inputSection(),
            const SizedBox(height: 25.0),
            loginButton(),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InkWell(
                  child: const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Register(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
            ),
            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }

  //UI Components
  headerSection() {
    return const CircleAvatar(
      radius: 120,
      foregroundImage: AssetImage("assets/images/Agriculture-Logo.jpg"),
    );
  }

  inputSection() {
    return Column(
      children: [
        RoundedInputField(
          hintText: "Email",
          field: emailController,
          fcolor: Colors.white70,
          onChanged: (value) {},
        ),
        RoundedPasswordField(
          passwordhint: 'Password',
          field: passController,
          fcolor: Colors.white70,
          hideText: _shConfirmPass,
          showHide: () {
            setState(() {
              _shConfirmPass = !_shConfirmPass;
            });
          },
        ),
      ],
    );
  }

  //LogicTrigger
  loginButton() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kappSecondary),
            ),
          )
        : RoundButton(
            text: "SIGN IN",
            color: Colors.red[500],
            press: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Index()),
                  (route) => true);
            },
          );
  }
}
