class CloudAPI {
  addExpense({
    required String cat,
    required double amount,
    required String note,
    required DateTime date,
  }) async {
    // a network delay
    await Future.delayed(Duration(seconds: 5));
    // added to the cloud
  }
}
