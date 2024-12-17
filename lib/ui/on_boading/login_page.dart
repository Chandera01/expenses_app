import 'package:expense_app_ui/data/local/db_helper.dart';
import 'package:expense_app_ui/ui/on_boading/sign_up_page.dart';
import 'package:expense_app_ui/ui/second_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    bool isPassVisible = false;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "asset/image/loginlogo.png",
              fit: BoxFit.contain,
              height: 100,
              width: 100,
              color: Color(0xFF727dd6),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 70,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Username', // Label for the input field
                  hintText: 'Enter your username', // Hint text inside the field
                  border: OutlineInputBorder(
                    // Border around the input field
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Border when not focused
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Border when focused
                    borderSide:
                        BorderSide(color: Colors.purpleAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true, // Adds a fill color to the input field
                  fillColor: Colors.white, // Color of the fill
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 70,
              child: TextField(
                controller: passwordController,
                obscureText: !isPassVisible,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  suffixIcon: InkWell(
                    onTap: () {
                      isPassVisible = !isPassVisible;
                      setState(() {});
                    },
                    child: Icon(isPassVisible
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded),
                  ),
                  labelText: 'Password', // Label for the input field
                  hintText: 'Enter your Password', // Hint text inside the field
                  border: OutlineInputBorder(
                    // Border around the input field
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // Border when not focused
                    borderSide: BorderSide(color: Colors.purple, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    // Border when focused
                    borderSide:
                        BorderSide(color: Colors.purpleAccent, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true, // Adds a fill color to the input field
                  fillColor: Colors.white, // Color of the fill
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              DbHelper dbHelper = DbHelper.instance;
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                if (await dbHelper.authenticateUser(
                    email: emailController.text,
                    pass: passwordController.text)) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SecondPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Invailed credentials, login again!!")));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please fill all the required blanks")));
              }
            },
            child: SizedBox(
              height: 45,
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Icon(
                    Icons.east_rounded,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xFF727dd6),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "Forgotten password?",
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    // width: 150,
                    color: Color(0xFF727dd6).withOpacity(0.5),
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    width: 150,
                    color: Color(0xFF727dd6).withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account ?",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  "  Sign in",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ],
          ),

          /* ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));
            },
            child: Expanded(
              child: Text(
                "Create New Account",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            style: OutlinedButton.styleFrom(
              backgroundColor: Color(0xFF727dd6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),*/
        ],
      ),
    );
  }
}
