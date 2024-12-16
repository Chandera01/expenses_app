import 'package:flutter/material.dart';
import 'package:expense_app_ui/data/local/models/usere_model.dart';
import 'package:expense_app_ui/data/local/db_helper.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController newpassController = TextEditingController();

  TextEditingController confirmpassController = TextEditingController();

  DbHelper dbHelper = DbHelper.instance;

  bool isPassVisible = false;

  bool isConfirmPassVisible = false;

  // Create a function that returns InputDecoration
  InputDecoration decorationtext() {
    return InputDecoration(
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
        borderSide: BorderSide(color: Colors.purpleAccent, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      filled: true, // Adds a fill color to the input field
      fillColor: Colors.white, // Color of the fill
    );
  }

/*  Future<void> signup(BuildContext context) async {
    if (newpassController.text == confirmpassController.text) {
      UserModel newUser = UserModel(
          username: usernameController.text,
          email: emailController.text,
          mobile: mobileController.text,
          password: newpassController.text,
          createAt: DateTime.now().toString());

      bool success = await DbHelper.instance.addUser(newUser);
      if (success) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User account created successfully!'),
          backgroundColor: Colors.green,
        ));
        // Optionally, navigate back to the login page
        Navigator.pop(context);
      } else {
        // Show failure message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to create account. Please try again.'),
          backgroundColor: Colors.red,
        ));
      }
    } else {
      // Show password mismatch error
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Passwords do not match. Please try again.'),
        backgroundColor: Colors.red,
      ));
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
              Divider(),
              Text(
                "Create your new Account here",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff3545dc),
                ),
              ),

              // username
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: usernameController,
                  decoration: decorationtext(),
                ),
              ),

              // e-mail
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: decorationtext().copyWith(
                    labelText: 'Enter your e-mail',
                    hintText: 'Enter your e-mail here',
                  ),
                ),
              ),

              // mobile no
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  decoration: decorationtext().copyWith(
                    labelText: 'Enter Your mobile no',
                    hintText: 'Enter your mobile no here',
                  ),
                ),
              ),

              // password
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: newpassController,
                  obscureText: !isPassVisible,
                  obscuringCharacter: "*",
                  decoration: decorationtext().copyWith(
                    suffixIcon: InkWell(
                      onTap: () {
                        isPassVisible = !isPassVisible;
                        setState(() {});
                      },
                      child: Icon(isPassVisible
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter your new password',
                  ),
                ),
              ),

              // confirm password
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: confirmpassController,
                  obscureText: !isConfirmPassVisible,
                  obscuringCharacter: "*",
                  decoration: decorationtext().copyWith(
                    suffixIcon: InkWell(
                      onTap: () {
                        isConfirmPassVisible = !isConfirmPassVisible;
                        setState(() {});
                      },
                      child: Icon(isConfirmPassVisible
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded),
                    ),
                    labelText: 'Confirm password',
                    hintText: 'Enter your Confirm password',
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () async {
                  if (usernameController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      mobileController.text.isNotEmpty &&
                      newpassController.text.isNotEmpty &&
                      confirmpassController.text.isNotEmpty) {
                    if (newpassController.text == confirmpassController.text) {
                      // register user
                      if (await dbHelper.checkIfEmailAlreadyExists(
                          email: emailController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Email already exists@!")));
                      } else {
                        bool check = await dbHelper.registerUse(
                            newUser: UserModel(
                                username: usernameController.text,
                                email: emailController.text,
                                mobile: mobileController.text,
                                password: newpassController.text,
                                createAt: DateTime.now()
                                    .microsecondsSinceEpoch
                                    .toString()));
                        if (check) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Account registred Successfully!!"),
                              backgroundColor: Colors.green));
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  "Failed to regisred accout,try again !!"),
                              backgroundColor: Colors.red));
                        }
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Password osen\'t match !!!"),
                          backgroundColor: Colors.orange));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please fill all the required blanlks"),
                        backgroundColor: Colors.orange));
                  }
                }, // Call signup method
                child: Text(
                  "Sign up",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Color(0xFF727dd6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.blue)),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "  Log in",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
