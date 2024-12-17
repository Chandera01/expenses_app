import 'package:expense_app_ui/ui/add_exp_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}
String selectedExpenseType = "Debit";
List<String> mExpenseType = ["Debit","Credit","Loan","Lead","Borrow"];
class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // search icon and logo
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "asset/image/logoremvoe.png",
                  fit: BoxFit.contain,
                  width: 120,
                ),
                Icon(
                  Icons.search,
                  size: 40,
                ),
              ],
            ),
            SizedBox(height: 20),

            // user profile
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "asset/image/profileicon.jpg",
                  height: 45,
                  width: 45,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Morning",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "chanderakinjal",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: StatefulBuilder(builder: (_, ss) {
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
                  style: OutlinedButton.styleFrom(
                    /*shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Color(0xFFe0e0e0),*/
                    side: BorderSide.none,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            /// Purple Container
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF727dd6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expense total",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "\$3,734",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                        Row(
                          children: [
                            OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                "+\$240",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide.none,
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                minimumSize: Size(45, 25),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                            Text(
                              "than last month",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      "asset/image/containersideimg.png",
                      height: 160,
                      width: 160,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),

            /// Expense List Header
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Expense List",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),

            /// Expense List using separate boxes
            Expanded(
              child: ListView(
                children: [
                  // Tuesday, 14 Section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tuesday, 14",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "-\$1380",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(),
                          ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                "asset/image/shpotroll-removebg-preview.png",
                                color: Color(0xFF727dd6),
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text("Shop"),
                            subtitle: Text("Buy new Clothes"),
                            trailing: Text(
                              "-\$90",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.pinkAccent),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                "asset/image/mobile-removebg-preview.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text("Electronic"),
                            subtitle: Text("Buy new iPhone 14"),
                            trailing: Text(
                              "-\$1290",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.pinkAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Monday Section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Monday",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "-\$60",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(),
                          ListTile(
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                "asset/image/transportation-removebg-preview.png",
                                color: Colors.orangeAccent,
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text("Transportation"),
                            subtitle: Text("Trip to Malang"),
                            trailing: Text(
                              "-\$60",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.pinkAccent),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
