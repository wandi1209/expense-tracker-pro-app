import '../../../transaction/data/models/transaction_model.dart';
import '../../../user/data/models/user_model.dart';

class DashboardModel {
  final String status;
  final UserModel user;
  final List<TransactionModel> transactions;

  DashboardModel({
    required this.status,
    required this.user,
    required this.transactions,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    var transactionsList = json['transactions'] as List;
    List<TransactionModel> transactions = TransactionModel.fromJsonList(
      transactionsList,
    );

    return DashboardModel(
      status: json['status'],
      user: UserModel.fromJson(json['data']),
      transactions: transactions,
    );
  }
}
