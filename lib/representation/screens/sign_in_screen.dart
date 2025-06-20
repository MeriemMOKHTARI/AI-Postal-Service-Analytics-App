import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/Gotouter.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_state.dart';
import 'profile_screen.dart';
import 'widgets/custom_form_button.dart';
import 'widgets/custom_input_field.dart';
import 'widgets/dont_have_an_account.dart';
import 'widgets/forget_password_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocConsumer<SignInCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("success"),
              ),
            );
            context.read<SignInCubit>().getUserData();
            GoRouter.of(context).push(routerapp.HomePath);
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/head.png'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.10),
                      // Logo
                      Image.asset(
                        'assets/images/li.png',
                        height: 80,
                      ),
                      const SizedBox(height: 20),
                      // Title
                      const Text(
                        'Connectez-vous\nà votre compte',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Entrez votre e-mail et votre mot de passe pour vous connecter',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Form(
                              key: context.read<SignInCubit>().signInFormKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomInputField(
                                    labelText: 'Email',
                                    hintText: 'Entrer votre adresse email...',
                                    controller:
                                        context.read<SignInCubit>().signInEmail,
                                  ),
                                  const SizedBox(height: 16),
                                  CustomInputField(
                                    labelText: 'Password',
                                    hintText: 'Enter votre mot de passe...',
                                    obscureText: true,
                                    suffixIcon: true,
                                    controller: context
                                        .read<SignInCubit>()
                                        .signInPassword,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value:
                                                false, // TODO: Implement remember me functionality
                                            onChanged: (value) {
                                              // TODO: Implement remember me functionality
                                            },
                                          ),
                                          const Text(
                                            'Se souvenir de moi',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      ForgetPasswordWidget(size: size),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  state is SignInLoading
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : CustomFormButton(
                                          innerText: 'Se connecter',
                                          onPressed: () {
                                            print('hello');
                                            context
                                                .read<SignInCubit>()
                                                .signIn();
                                            print('hello');
                                          },
                                        ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const SizedBox(height: 20),
                                  DontHaveAnAccountWidget(size: size),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
