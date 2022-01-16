import 'package:flutter/material.dart';
import 'package:resturant_app/screens/forgot_password_screen.dart';
import 'package:resturant_app/screens/main_screen.dart';
import 'package:resturant_app/shared/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isPasswordShown = false;

  @override
  Widget build(BuildContext context) {
    userNameController.text = "abed";
    passwordController.text = "123";

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80, bottom: 8),
                width: double.infinity,
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF747474)),
                ),
              ),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/BMW_logo_%28gray%29.svg/600px-BMW_logo_%28gray%29.svg.png",
                scale: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
                child: TextField(
                  controller: userNameController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.green,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "User Name",
                    hintStyle: TextStyle(color: Color(0xFF939393)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 131, 22, 22),
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 163, 154, 154),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 25),
                child: TextField(
                  obscureText: !isPasswordShown,
                  controller: passwordController,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.green,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: TextButton(
                      child: Text(isPasswordShown ? "Hide" : "Show", style: TextStyle(color: Colors.purple)),
                      onPressed: () {
                        isPasswordShown = !isPasswordShown;
                        // print("isPasswordShown");
                        // print(isPasswordShown);
                        setState(() {});
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xFF939393)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 131, 22, 22),
                      ),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 163, 154, 154),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  validateLoginFieldText(),
                  style: TextStyle(color: validateLoginFieldColor(validateLoginFieldText())),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: MyElevatedButton(
                  height: 40,
                  gradient: LinearGradient(
                      colors: validateLoginField()
                          ? [Color(0xFFF46186), Color(0xFFEE87D7)]
                          : [Color.fromARGB(255, 119, 118, 118), Color.fromARGB(255, 202, 188, 199)]),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                  onClick: validateLoginField()
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainScreen()),
                          );
                        }
                      : null,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: Text("Facebook")),
                  Container(
                    color: Colors.grey,
                    width: 1,
                    height: 20,
                  ),
                  TextButton(onPressed: () {}, child: Text("Google")),
                  Container(
                    color: Colors.grey,
                    width: 1,
                    height: 20,
                  ),
                  TextButton(onPressed: () {}, child: Text("iCloud")),
                ],
              ),
              const SizedBox(
                height: 200,
              ),
              Row(
                children: [
                  Container(
                    width: 130,
                    child: TextButton(
                      child: Text("Forgot Password"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(width: 170, child: TextButton(onPressed: () {}, child: Text("Create New Account"))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validateLoginField() {
    // if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
    //   return false;
    // } else
    if (userNameController.text == "abed" && passwordController.text == "123") {
      return true;
    } else {
      return false;
    }
  }

  String validateLoginFieldText() {
    if (userNameController.text == "abed" && passwordController.text == "123") {
      return "Correct User Name & Password";
    } else if (userNameController.text.isEmpty || passwordController.text.isEmpty) {
      return "";
    } else {
      return "Wrong User Name & Password";
    }
  }

  Color validateLoginFieldColor(String msg) {
    if (msg == "Correct User Name & Password") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
