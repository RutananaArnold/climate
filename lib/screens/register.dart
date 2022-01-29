import 'package:agriculture_app/components/rounded_button.dart';
import 'package:agriculture_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../components/RoundedInputField.dart';
import '../components/RoundedPasswordField.dart';
import '../components/palette.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  String? tel;

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
            const SizedBox(height: 15.0),
            inputSection(),
            const SizedBox(height: 25.0),
            registerButton(),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: InkWell(
                  child: const Text(
                    "login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Login(),
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

  inputSection() {
    return Column(
      children: [
        RoundedInputField(
          hintText: "Name",
          field: emailController,
          fcolor: Colors.white70,
          onChanged: (value) {},
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(29),
          ),
          child: IntlPhoneField(
            decoration: const InputDecoration(
              hintText: 'Mobile Number',
              hintStyle: TextStyle(
                color: kappColorDark,
              ),
              border: InputBorder.none,
            ),
            initialCountryCode: 'UG',
            onChanged: (phone) {
              tel = "'" + phone.completeNumber + "'";
            },
          ),
        ),
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
  registerButton() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kappSecondary),
            ),
          )
        : RoundButton(
            text: "SIGN UP",
            color: Colors.red[500],
            press: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => Login()),
                  (route) => false);
            },
          );
  }
}
