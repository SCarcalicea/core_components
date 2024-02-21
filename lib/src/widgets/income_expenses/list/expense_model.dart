class ExpenseModel {

  final bool isExpense;
  final String itemDetails;
  final String itemDate;
  final String itemValue;
  static String type = "EXPENSE";

  const ExpenseModel({
  required this.isExpense,
  required this.itemDetails,
  required this.itemDate,
  required this.itemValue
  });
}