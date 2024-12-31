import 'package:expense_app_ui/data/local/models/expense_model.dart';

class FilterExpenseModel {
  String typeName;
  num totalAmount;
  List<ExpenseModel> allExpenses;

  FilterExpenseModel(
      {required this.typeName,
      required this.totalAmount,
      required this.allExpenses});
}
