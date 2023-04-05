import 'package:evira_admin_panel/feature/auth/presentation/bloc/cubit/auth_cubit.dart';
import 'package:evira_admin_panel/feature/auth/presentation/screens/auth_screens/create_profile_screen.dart';
import 'package:evira_admin_panel/feature/auth/presentation/screens/auth_screens/phone_auth_screen.dart';
import 'package:evira_admin_panel/feature/auth/presentation/screens/auth_screens/signup_screen.dart';
import 'package:evira_admin_panel/feature/main_app/presentation/screens/main_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:evira_admin_panel/core/asset_constants.dart' as asset;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_screen.dart';

class AuthMainScreen extends StatelessWidget {
  static const routename = '/authmainscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Signed in SuccessFully"),
              backgroundColor: Colors.green,
            ));
            Navigator.of(context).pushNamedAndRemoveUntil(
                MainHomeScreen.routename, (route) => false);
          }
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Theme.of(context).errorColor,
            ));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black87,
                strokeWidth: 7,
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    asset.splash_login,
                    width: 360,
                  ),
                  Text(
                    "Let's you in",
                    style: asset.introStyles(50),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 160,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              BlocProvider.of<AuthCubit>(context)
                                  .googleSignIn();
                            },
                            child: login_button(
                                'Continue with Google', asset.google_logo)),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => BlocProvider(
                                create: (context) => AuthCubit(),
                                child: PhoneAuthScreen(),
                              ),
                            ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone,
                                size: 32,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Continue with Number",
                                style: asset.introStyles(20),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    'or',
                    style: asset.introStyles(20, color: Colors.black54),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(LoginScreen.routename);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(35)),
                      child: const Text(
                        'Sign in with password',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Ubuntu',
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account?",
                        style: asset.introStyles(16, color: Colors.black54),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, SignUpScreen.routename);
                        },
                        child: Text(
                          "Sign up",
                          style: asset.introStyles(16),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Row login_button(String title, String iconpath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconpath,
          width: 35,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: asset.introStyles(20),
        )
      ],
    );
  }
}
