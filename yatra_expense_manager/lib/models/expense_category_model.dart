class ExpenseCategoryModel {
  final String catId;
  final String title;

  ExpenseCategoryModel({
    required this.title,
  }) : catId = DateTime.now().microsecondsSinceEpoch.toString();
}
