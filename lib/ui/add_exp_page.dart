import 'package:expense_app_ui/data/local/models/expense_model.dart';
import 'package:expense_app_ui/domain/app_constians.dart';
import 'package:expense_app_ui/domain/ui_helper.dart';
import 'package:expense_app_ui/ui/block/expense_block.dart';
import 'package:expense_app_ui/ui/block/expense_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class AddExpPage extends StatefulWidget {
  @override
  State<AddExpPage> createState() => _AddExpPageState();
}

class _AddExpPageState extends State<AddExpPage> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  String selectedExpenseType = "Debit";

  int selectedCatIndex = -1;

  List<String> mExpenseType = ["Debit", "Credit", "Loan", "Lead", "Borrow"];

  DateTime selectedDate = DateTime.now();

  DateFormat mFormat = DateFormat.yMMMd();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: mFieldDecor(
                hint: "Enter title here...",
                heading: "title",
              ),
            ),
            mSpacer(),
            TextField(
              controller: descController,
              decoration:
                  mFieldDecor(hint: "Enter desc here...", heading: "Desc"),
            ),
            mSpacer(),
            TextField(
              controller: amountController,
              decoration: mFieldDecor(
                  hint: "Enter amount here..",
                  mPrefixText: "\$",
                  heading: "Amount"),
            ),
            mSpacer(),

            ///expense type
            StatefulBuilder(builder: (_, ss) {
              return DropdownMenu(
                  width: double.infinity,
                  inputDecorationTheme: InputDecorationTheme(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                      borderSide: BorderSide(width: 1),
                    ),
                  ),
                  initialSelection: selectedExpenseType,
                  onSelected: (value) {
                    selectedExpenseType = value ?? "Debit";
                  },
                  dropdownMenuEntries: mExpenseType.map((expenseType) {
                    return DropdownMenuEntry(
                        value: expenseType, label: expenseType);
                  }).toList());
            }),
            mSpacer(),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 21),
                        child: GridView.builder(
                            itemCount: AppConstants.mCat.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4),
                            itemBuilder: (_, index) {
                              return InkWell(
                                onTap: () {
                                  selectedCatIndex = index;
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  children: [
                                    Image.asset(
                                      AppConstants.mCat[index].imgPath,
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text(
                                      AppConstants.mCat[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    });
              },
              child: Container(
                width: double.infinity,
                height: 57,
                child: Center(
                  child: selectedCatIndex >= 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppConstants.mCat[selectedCatIndex].imgPath,
                              width: 35,
                              height: 35,
                            ),
                            Text(
                                "  -  ${AppConstants.mCat[selectedCatIndex].title}"),
                          ],
                        )
                      : Text("Choose a Category"),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    border: Border.all(width: 1, color: Colors.black)),
              ),
            ),
            mSpacer(),
            InkWell(
              onTap: () async{
                if(Platform.isIOS || Platform.isMacOS){
                 /* showCupertinoModalPopup(context: context, builder: (_){
                      return CupertinoDatePicker(
                          onDateTimeChanged: onDateTimeChanged)
                  });*/
                }else{
                       selectedDate = await  showDatePicker(context: context,
                                firstDate: DateTime(DateTime.now().year-1),
                                lastDate: DateTime.now()
                       ) ?? DateTime.now();

                       setState(() {

                       });
                }

              },
              child: Container(
                width: double.infinity,
                height: 57,
                child: Center(
                  child: Text(mFormat.format(selectedDate).toString()),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(21),
                    border: Border.all(width: 1, color: Colors.black)),
              ),
            ),
            mSpacer(),
            OutlinedButton(

              onPressed: ()
              async {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    amountController.text.isNotEmpty &&
                    selectedCatIndex >-1
                ){
                  var prefs = await SharedPreferences.getInstance();
                  String uid = prefs.getString("userId") ?? "";

                  context.read<ExpenseBlock>().add(AddExpenseEvent(newExp: ExpenseModel(
                      userId: int.parse(uid),
                      expenseType: selectedExpenseType,
                      title: titleController.text,
                      desc: descController.text,
                      createdAt:
                      selectedDate.microsecondsSinceEpoch.toString(),
                      amount: double.parse(amountController.text),
                      balance: 0,
                      categoryId: AppConstants.mCat[selectedCatIndex].id)));

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Expense Add !!!"),backgroundColor: Colors.green));
                  Navigator.pop(context);

                  // DbHelper dbHelper = DbHelper.instance;

                 /* bool check = await dbHelper.addExpense(
                      /*ExpenseModel(
                      userId: int.parse(uid),
                      expenseType: selectedExpenseType,
                      title: titleController.text,
                      desc: descController.text,
                      createdAt:
                          DateTime.now().microsecondsSinceEpoch.toString(),
                      amount: double.parse(amountController.text),
                      balance: 0,
                      categoryId: AppConstants.mCat[selectedCatIndex].id)*/


                  );*/

                  /*if (check) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Expense Add !!!"),backgroundColor: Colors.green));
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Expense Not added"),backgroundColor: Colors.red));
                  }*/
                }
              },
              child: Text("Add Expense"),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(21),
                ),
                minimumSize: Size(double.infinity, 55),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
