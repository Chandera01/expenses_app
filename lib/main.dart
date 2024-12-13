import 'package:expense_app_ui/domain/app_constians.dart';
import 'package:expense_app_ui/ui/splash_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.App_Name,
      home: SplashPage(),
    );
  }
}