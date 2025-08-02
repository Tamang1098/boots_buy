
//  import 'package:boots_buy/core/network/api_service.dart';
//  import 'package:boots_buy/core/network/hive_service.dart';
//  import 'package:boots_buy/features/auth/data/data_source/local_datasource/user_hive_data-source.dart';
//  import 'package:boots_buy/features/auth/data/data_source/remote_datasource/user_remote_data_source.dart';
//  import 'package:boots_buy/features/auth/data/data_source/user_data_source.dart';
//  import 'package:boots_buy/features/auth/data/repository/local_repository/user_local_repository.dart';
//  import 'package:boots_buy/features/auth/data/repository/remote_repository/user_remote_repository.dart' show UserRemoteRepository;
//  import 'package:boots_buy/features/auth/domain/repository/user_repository.dart';
//  import 'package:boots_buy/features/auth/domain/use_case/user_login_usecase.dart';
//  import 'package:boots_buy/features/auth/domain/use_case/user_register_usecase.dart';
//  import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
//  import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_viewmodel.dart';
//  import 'package:boots_buy/features/home/presentation/view_model/homepage_viewmodel.dart';
//  import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
//  import 'package:dio/dio.dart';
//  import 'package:get_it/get_it.dart';
//
//  final serviceLocator = GetIt.instance;
//
// Future<void> setupServiceLocator() async {
//    await _initHiveService();
//    await _initSplashModule();
//    await _initAuthModule();
//    await _initHomeModule();
//  }
//
//  Future<void> _initHiveService() async {
//    serviceLocator.registerLazySingleton(() => HiveService());
//  }
//
//
//  Future<void> _initApiService() async {
//    serviceLocator.registerLazySingleton<Dio>(() => Dio());
//    serviceLocator.registerLazySingleton(() => ApiService(serviceLocator<Dio>()));
//  }
//
//  Future<void> _initAuthModule() async {
//    serviceLocator.registerLazySingleton<IUserDataSource>(
//      () => UserHiveDataSource(hiveService: serviceLocator<HiveService>()),
//    );
//
//    // Register remote data source
//    serviceLocator.registerLazySingleton<UserRemoteDataSource>(
//          () => UserRemoteDataSource(apiService: serviceLocator<ApiService>()),
//    );
//
//    // Remote repository (use this instead if you want remote server)
//    serviceLocator.registerLazySingleton<IUserRepository>(
//          () => UserRemoteRepository(
//        remoteDataSource: serviceLocator<UserRemoteDataSource>(),
//      ),
//    );
//
//    // serviceLocator.registerLazySingleton<IUserRepository>(
//    //   () => UserLocalRepository(
//    //     dataSource: serviceLocator<IUserDataSource>(),
//    //   ),
//    // );
//
//
//
//    serviceLocator.registerLazySingleton<UserLoginUsecase>(
//      () => UserLoginUsecase(
//        userRepository: serviceLocator<IUserRepository>(),
//      ),
//    );
//
//    serviceLocator.registerLazySingleton<UserRegisterUsecase>(
//      () => UserRegisterUsecase(
//        userRepository: serviceLocator<IUserRepository>(),
//      ),
//    );
//
//
//
//    serviceLocator.registerFactory<LoginViewModel>(
//      () => LoginViewModel(
//        userLoginUsecase: serviceLocator<UserLoginUsecase>(),
//      ),
//    );
//
//    serviceLocator.registerFactory<SignupViewModel>(
//      () => SignupViewModel(
//        userRegisterUsecase: serviceLocator<UserRegisterUsecase>(),
//      ),
//    );
//  }
//
//  Future<void> _initSplashModule() async {
//    // If SplashViewModel has dependencies, inject them here
//    serviceLocator.registerFactory<SplashViewModel>(
//      () => SplashViewModel(),
//    );
//  }
//
//  Future<void> _initHomeModule() async {
//    // If HomePageViewModel has dependencies, inject them here
//    serviceLocator.registerFactory<HomeViewModel>(
//      () => HomeViewModel(),
//    );
//  }


import 'package:boots_buy/core/network/api_service.dart';
import 'package:boots_buy/core/network/hive_service.dart';
import 'package:boots_buy/core/utils/mysnackbar.dart';
import 'package:boots_buy/features/auth/data/data_source/local_datasource/user_hive_data-source.dart';
import 'package:boots_buy/features/auth/data/data_source/remote_datasource/user_remote_data_source.dart';
import 'package:boots_buy/features/auth/data/data_source/user_data_source.dart';
import 'package:boots_buy/features/auth/data/repository/remote_repository/user_remote_repository.dart' show UserRemoteRepository;
import 'package:boots_buy/features/auth/domain/repository/user_repository.dart';
import 'package:boots_buy/features/auth/domain/use_case/user_login_usecase.dart';
import 'package:boots_buy/features/auth/domain/use_case/user_register_usecase.dart';
import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
import 'package:boots_buy/features/auth/presentation/view_model/signup_viewmodel/signup_viewmodel.dart';
import 'package:boots_buy/features/home/presentation/view_model/homepage_viewmodel.dart';
import 'package:boots_buy/features/splash/presentation/view_model/splash_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  await _initHiveService();
  await _initApiService();
  await _initSplashModule();
  await _initAuthModule();
  await _initHomeModule();
}

Future<void> _initHiveService() async {
  serviceLocator.registerLazySingleton(() => HiveService());
}

Future<void> _initApiService() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton(() => ApiService(serviceLocator<Dio>()));
}

Future<void> _initAuthModule() async {
  serviceLocator.registerLazySingleton<IUserDataSource>(
        () => UserHiveDataSource(hiveService: serviceLocator<HiveService>()),
  );

  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSource(apiService: serviceLocator<ApiService>()),
  );

  // Register remote repository (comment out below if you want to use local)
  serviceLocator.registerLazySingleton<IUserRepository>(
        () => UserRemoteRepository(
      remoteDataSource: serviceLocator<UserRemoteDataSource>(),
    ),
  );

  // Uncomment this if you want to use local instead of remote
  // serviceLocator.registerLazySingleton<IUserRepository>(
  //   () => UserLocalRepository(
  //     dataSource: serviceLocator<IUserDataSource>(),
  //   ),
  // );

  serviceLocator.registerLazySingleton<UserLoginUsecase>(
        () => UserLoginUsecase(
      userRepository: serviceLocator<IUserRepository>(),
    ),
  );

  serviceLocator.registerLazySingleton<UserRegisterUsecase>(
        () => UserRegisterUsecase(
      userRepository: serviceLocator<IUserRepository>(),
    ),
  );

  serviceLocator.registerFactory<LoginViewModel>(
        () => LoginViewModel(
      userLoginUsecase: serviceLocator<UserLoginUsecase>(),
    ),
  );

  serviceLocator.registerFactory<SignupViewModel>(
        () => SignupViewModel(
      userRegisterUsecase: serviceLocator<UserRegisterUsecase>(), 
      showSnackBar: showMySnackBar,
    ),
  );
}

Future<void> _initSplashModule() async {
  serviceLocator.registerFactory<SplashViewModel>(
        () => SplashViewModel(),
  );
}

Future<void> _initHomeModule() async {
  serviceLocator.registerFactory<HomeViewModel>(
        () => HomeViewModel(),
  );
}


