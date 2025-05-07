import 'package:dio/dio.dart';
import 'package:expense_tracker_pro/features/auth/data/models/user_model.dart';
import 'package:expense_tracker_pro/features/transaction/data/models/transaction_model.dart';

abstract class DashboardRemoteDatasource {
  Future<Map<String, dynamic>> dashboard();
}

class DashboardRemoteDatasourceImplementation
    extends DashboardRemoteDatasource {
  final Dio dio;

  DashboardRemoteDatasourceImplementation({required this.dio});

  @override
  Future<Map<String, dynamic>> dashboard() async {
    var response = await dio.get('/users/dashboard');
    return {
      'user': UserModel.fromJson(response.data['data']),
      'transaction': TransactionModel.fromJsonList(
        response.data['transaction'],
      ),
    };
  }
}
