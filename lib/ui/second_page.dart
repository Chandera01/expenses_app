import 'package:expense_app_ui/data/local/models/expense_model.dart';
import 'package:expense_app_ui/data/local/models/filter_expense_model.daart.dart';
import 'package:expense_app_ui/domain/app_constians.dart';
import 'package:expense_app_ui/ui/add_exp_page.dart';
import 'package:expense_app_ui/ui/block/expense_block.dart';
import 'package:expense_app_ui/ui/block/expense_event.dart';
import 'package:expense_app_ui/ui/block/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}
String selectedExpenseType = "Debit";
List<String> mExpenseType = ["Debit","Credit","Loan","Lead","Borrow"];


DateFormat mFormat = DateFormat.yMMMd();

  List<FilterExpenseModel> filterData = [];

class _SecondPageState extends State<SecondPage> {

  List<ExpenseModel> mExpense = [];

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBlock>().add(FetchInitialExpenseEvent());
    // context.read()<ExpenseBlock>().add(FetchInitialExpenseEvent());
  }

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
            SizedBox(height: 20),


            /// Expense List Header

            Expanded(
              child: BlocBuilder<ExpenseBlock,ExpenseState>(builder: (_,state){
                  if(state is ExpenseLoadingState){
                    return Center(child: CircularProgressIndicator(),);
                  }else if(state is ExpenseErrorState){
                        return Center(child: Text(state.errorMsg),);
                  }else if(state is ExpenseLoadedState){

                    filterDatadateWise(allExp: state.mExp);

                    ///
                    /// Expense List
                    ///
                      return state.mExp.isNotEmpty ? ListView.builder(
                        // itemCount: state.mExp.length,
                        itemCount: filterData.length,
                          itemBuilder: (_,index){
                          // var allExp = state.mExp;

                         return Container(
                           margin: EdgeInsets.only(bottom: 15),
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
                                       ///
                                       ///date Filter
                                       ///
                                       ///
                                       ///
                                       filterData[index].typeName,
                                       style: TextStyle(
                                           fontSize: 17, fontWeight: FontWeight.bold),
                                     ),
                                     Text(
                                       "-\$${filterData[index].totalAmount}",
                                       style: TextStyle(
                                           fontSize: 17, fontWeight: FontWeight.bold),
                                     ),
                                   ],
                                 ),
                                 Divider(),
                                 ///
                                 ////EXPENSE FILTER LIST
                                 /////
                                 ///
                                 ListView.builder(
                                   itemCount: filterData[index].allExpenses.length,
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemBuilder: (_,childIndex){
                                   return  SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Image.asset(
                                            AppConstants.mCat.where((exp){
                                              return exp.id==filterData[index].allExpenses[childIndex].categoryId;
                                            }).toList()[0].imgPath,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        title: Text(filterData[index].allExpenses[childIndex].title),
                                        subtitle: Text(filterData[index].allExpenses[childIndex].desc),
                                        trailing: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "${mFormat.format(DateTime.fromMicrosecondsSinceEpoch(int.parse(filterData[index].allExpenses[childIndex].createdAt)))}",
                                              style: TextStyle(
                                                  fontSize: 15, color: Colors.grey),
                                            ),
                                            Text(
                                              "-\$${filterData[index].allExpenses[childIndex].amount}",
                                              style: TextStyle(
                                                  fontSize: 18, color: Colors.pinkAccent),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                                 })

                               ],
                             ),
                           ),
                         );


                      }) : Center(child: Text("No expenses Found"),);
                  }
                  return Container();
              }),
            )

          /*  Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Expense List",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 20),

            /// Expense List using separate boxes
            Expanded (
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
            ),*/
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
        child: const Icon(Icons.add),
      ),
    );
  }

  void filterDatadateWise({required List<ExpenseModel> allExp}) {
    filterData.clear();
    ///date/month
    ///total Amount
    ///list of Expense
      List<String> UniqueDates = [];

    for (ExpenseModel eachExp in allExp) {
      String eachDate = mFormat.format(
          DateTime.fromMicrosecondsSinceEpoch(int.parse(eachExp.createdAt)));

      if(!UniqueDates.contains(eachDate)){
        UniqueDates.add(eachDate);
      }

    }

    for(String eachDate in UniqueDates){
      num totalAmt = 0.0;
      List<ExpenseModel> eachDateExp = [];

      for(ExpenseModel eachExp in allExp){
        String expDate = mFormat.format(DateTime.fromMicrosecondsSinceEpoch(int.parse(eachExp.createdAt)));

        if(eachDate==expDate){
          eachDateExp.add(eachExp);
          if(eachExp.expenseType=="Debit"){
                  // debit
                  totalAmt += eachExp.amount;
          }else{
            // credit
            totalAmt-=eachExp.amount;
          }
        }

      }

      filterData.add(FilterExpenseModel(typeName: eachDate, totalAmount: totalAmt, allExpenses: eachDateExp));

    }
    // print(filterData[0].allExpenses.length);
  }
  
}
