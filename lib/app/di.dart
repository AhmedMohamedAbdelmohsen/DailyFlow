import 'package:daily_flow/domain/usecase/task/create_task_usecase.dart';
import 'package:daily_flow/domain/usecase/task/task_usecase.dart';
import 'package:daily_flow/presentation/add_scheduler/manager/add_task_cubit.dart';
import 'package:daily_flow/presentation/home/manager/task_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:daily_flow/data/data_source/remote_data_source.dart';
import 'package:daily_flow/data/network/app_api.dart';
import 'package:daily_flow/data/network/dio_factory.dart';
import 'package:daily_flow/data/network/network_info.dart';
import 'package:daily_flow/data/repository/respository_impl.dart';
import 'package:daily_flow/domain/repository/repository.dart';
import 'package:daily_flow/domain/usecase/login/login_usecase.dart';
import 'package:daily_flow/presentation/login/manager/login_cubit/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_prefs.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  //shared prefs instance
  var sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
  }
}

initTaskModule() {
  if (!GetIt.I.isRegistered<TaskUseCase>()) {
    instance.registerFactory<TaskUseCase>(() => TaskUseCase(instance()));
    instance.registerFactory<TaskCubit>(() => TaskCubit(instance()));
  }
}

initAddTaskModule() {
  if (!GetIt.I.isRegistered<CreateTaskUseCase>()) {
    instance.registerFactory<CreateTaskUseCase>(
        () => CreateTaskUseCase(instance()));
    instance.registerFactory<AddTaskCubit>(() => AddTaskCubit(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  resetDi();
}

Future<void> resetModulesFirstTime() async {
  instance.reset(dispose: false);
  await initAppModule();
  resetDi();
}

resetDi() {
  initLoginModule();
  initTaskModule();
  initAddTaskModule();
}
