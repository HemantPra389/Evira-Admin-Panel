import 'package:evira_admin_panel/feature/auth/domain/usecases/auth_sendOTP_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/auth_verifyOTP_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/google_signin_usecase.dart';
import 'package:get_it/get_it.dart';

import 'feature/auth/data/datasource/network_db/auth_network_db.dart';
import 'feature/auth/data/datasource/network_db/auth_network_db_impl.dart';
import 'feature/auth/data/repositories/auth_repository_impl.dart';
import 'feature/auth/domain/repositories/auth_repository.dart';
import 'feature/auth/domain/usecases/createUser_profile_usercase.dart';
import 'feature/auth/domain/usecases/create_user_usecase.dart';
import 'feature/auth/domain/usecases/login_user_usecase.dart';

GetIt locator = GetIt.instance;

Future<void> setup() async {
  //usecase

  //usecase-auth
  locator.registerLazySingleton<CreateUserUsecase>(
      () => CreateUserUsecase(repository: locator()));
  locator.registerLazySingleton<CreateUserProfileUseCase>(
      () => CreateUserProfileUseCase(repository: locator()));
  locator.registerLazySingleton<LoginUserUseCase>(
      () => LoginUserUseCase(repository: locator()));
  locator.registerLazySingleton<AuthSendOTPUseCase>(
      () => AuthSendOTPUseCase(authRepository: locator()));
  locator.registerLazySingleton<AuthVerifyOTPUseCase>(
      () => AuthVerifyOTPUseCase(authRepository: locator()));
  locator.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(authRepository: locator()));
  locator.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(authRepository: locator()));



  //Repostory
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authnetworkDB: locator()));
  

  //Network DB
  locator.registerLazySingleton<AuthNetworkDB>(() => AuthNetworkDBImpl());
  
}
