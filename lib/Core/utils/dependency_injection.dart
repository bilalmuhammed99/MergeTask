import 'package:dio/dio.dart';
import 'package:flutter_application_1/Core/api/api_service.dart';
import 'package:flutter_application_1/Core/api/dio_factory.dart';
import 'package:flutter_application_1/Features/Auth/data/repos/login_repository_implementation.dart';
import 'package:flutter_application_1/Features/Home/data/respos/Home_repositroy_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  Dio dio = DioFactory.getDio();

  getIt.registerSingleton<ApiService>(
    ApiService(
      dio,
    ),
  );

  getIt.registerSingleton<HomeRepositoryImplementation>(
    HomeRepositoryImplementation(
      getIt.get<ApiService>(),
    ),
  );

  getIt.registerSingleton<LoginRepositoryImplementations>(
    LoginRepositoryImplementations(
      getIt.get<ApiService>(),
    ),
  );
}
