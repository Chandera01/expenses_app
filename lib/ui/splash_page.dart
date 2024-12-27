import 'dart:async';
import 'package:expense_app_ui/ui/on_boading/login_page.dart';
import 'package:expense_app_ui/ui/second_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {



  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
   var getValue = prefs.getString("userId");


      if(getValue!=null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecondPage(),));
      }else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage(),));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Image.asset(
              "asset/image/logoremvoe.png",
              height: 120,
              width: 120,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "asset/image/boxjpg.png",
              width: 350,
              fit: BoxFit.contain,
              height: 400,
            ),
            SizedBox(height: 20),
            Text(
              "Easy way to monitor",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your expense",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              "Safe Your Future by managing Your",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              "expense right now",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
