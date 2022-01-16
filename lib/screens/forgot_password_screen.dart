import 'package:flutter/material.dart';
import 'package:resturant_app/shared/custom_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController forgotPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 80, bottom: 8),
              width: double.infinity,
              child: Text(
                "Forgot Password",
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
                controller: forgotPasswordController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                cursorColor: Colors.green,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Email ID / Phone Number",
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
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: MyElevatedButton(
                height: 40,
                gradient: LinearGradient(
                    colors: [Color(0xFFF46186), Color(0xFFEE87D7)]),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                onClick: () {},
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Login Screen"),
            )
          ],
        ),
      ),
    );
  }
}
