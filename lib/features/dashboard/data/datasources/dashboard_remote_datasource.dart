import 'package:dio/dio.dart';
import '../models/dashboard_model.dart';

abstract class DashboardRemoteDatasource {
  Future<DashboardModel> dashboard();
}

class DashboardRemoteDatasourceImplementation
    extends DashboardRemoteDatasource {
  final Dio dio;

  DashboardRemoteDatasourceImplementation({required this.dio});

  @override
  Future<DashboardModel> dashboard() async {
    var response = await dio.get('/users/dashboard');
    return DashboardModel.fromJson(response.data);
  }
}
