import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

Future<void> init() async {
  final Dio dio = Dio(BaseOptions(baseUrl: '${dotenv.env["BASE_URL"]}'));
  locator.registerLazySingleton(() => dio);
}
