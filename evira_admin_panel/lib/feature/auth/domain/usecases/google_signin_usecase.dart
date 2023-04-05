import 'package:evira_admin_panel/feature/auth/domain/repositories/auth_repository.dart';

class GoogleSignInUseCase {
  final AuthRepository authRepository;
  GoogleSignInUseCase({required this.authRepository});
  Future<String> googleSignInUseCase() async {
    return await authRepository.googleSignin();
  }
}
