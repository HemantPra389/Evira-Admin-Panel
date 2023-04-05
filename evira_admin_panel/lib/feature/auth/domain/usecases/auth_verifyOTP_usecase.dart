import 'package:evira_admin_panel/feature/auth/domain/repositories/auth_repository.dart';

class AuthVerifyOTPUseCase {
  final AuthRepository authRepository;
  AuthVerifyOTPUseCase({required this.authRepository});
  Future<String> authVerifyOTPUsecase(int otp) async {
    return await authRepository.authverifyOTP(otp);
  }
}
