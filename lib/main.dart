import 'package:expense_app_ui/data/local/db_helper.dart';
import 'package:expense_app_ui/domain/app_constians.dart';
import 'package:expense_app_ui/ui/block/expense_block.dart';
import 'package:expense_app_ui/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

void main() {
  runApp(
    BlocProvider<ExpenseBlock>(
      create: (context) => ExpenseBlock(dbHelper: DbHelper.instance),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.App_Name,
      home: SplashPage(),
    );
  }
}
