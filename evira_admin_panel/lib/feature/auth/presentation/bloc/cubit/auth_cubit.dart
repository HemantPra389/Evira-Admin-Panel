import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evira_admin_panel/feature/auth/domain/entities/user_credentail_entity.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/auth_sendOTP_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/auth_verifyOTP_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/createUser_profile_usercase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/create_user_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/google_signin_usecase.dart';
import 'package:evira_admin_panel/feature/auth/domain/usecases/login_user_usecase.dart';
import 'package:evira_admin_panel/injection_container.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> createUser(
      UserCredentialEntity userCredentialEntity, BuildContext context) async {
    emit(AuthLoading());
    var authState = await locator
        .call<CreateUserUsecase>()
        .createuserUsecase(userCredentialEntity, context);
    if (authState.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authState.toString()));
    }
  }

  Future<void> createProfile(Map<String, String> usercredentials,
      BuildContext context, File image) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<CreateUserProfileUseCase>()
        .createUserProfileUseCase(usercredentials, context, image);

    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> loginUser(
      UserCredentialEntity userCredentialEntity, BuildContext context) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<LoginUserUseCase>()
        .loginuserusecase(userCredentialEntity, context);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> authsendOTP(String phoneNumber) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<AuthSendOTPUseCase>()
        .authSendOTPUseCase(phoneNumber);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else if (authstate.toString() == "AuthCodeSent") {
      emit(AuthCodeSentState());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> authverifyOTP(int otp) async {
    emit(AuthLoading());
    var authstate =
        await locator.call<AuthVerifyOTPUseCase>().authVerifyOTPUsecase(otp);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(AuthLoading());
    var authstate = await locator
        .call<ForgotPasswordUseCase>()
        .forgotpasswordusecase(email);
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure(error: authstate.toString()));
    }
  }

  Future<void> googleSignIn() async {
    var authstate =
        await locator.call<GoogleSignInUseCase>().googleSignInUseCase();
    if (authstate.toString() == "Success") {
      emit(AuthSuccess());
    }else{
      emit(AuthFailure(error: authstate.toString()));
    }
  }
}
