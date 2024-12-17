import 'package:expense_app_ui/domain/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  String selectedExpenseType = "Debit";
  List<String> mExpenseType = ["Debit","Credit","Loan","Lead","Borrow"];
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
                onSelected: (value){
                      selectedExpenseType = value ?? "Debit";
                },
                dropdownMenuEntries: mExpenseType.map((expenseType){
                  return DropdownMenuEntry(value: expenseType, label: expenseType);
                }).toList());
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the bottom sheet when FAB is pressed
          showModalBottomSheet(
            context: context,
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: mExpenseType.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Do something when an item is tapped
                        Navigator.pop(context);
                        print("Selected: ${mExpenseType[index]}");
                      },
                      child: Card(
                        elevation: 4.0,
                        color: Colors.blueAccent,
                        child: Center(
                          child: Text(
                            mExpenseType[index],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        child: Icon(Icons.grid_view),
      ),
    );
  }
}
