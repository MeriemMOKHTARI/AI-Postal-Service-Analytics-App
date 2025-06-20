import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/user_cubit.dart';
import '../cubit/user_signupcubit.dart';
import '../cubit/user_state.dart';
import 'widgets/already_have_an_account_widget.dart';
import 'widgets/custom_form_button.dart';
import 'widgets/custom_input_field.dart';
import 'widgets/page_heading.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: BlocConsumer<SignUpCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.errMessage),
            ));
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: context.read<SignUpCubit>().signUpFormKey,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.1),
                        // Logo
                        Image.asset(
                          'assets/images/li.png', // Add your logo here
                          height: 80,
                        ),
                        const SizedBox(height: 20),
                        // Title
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
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

                        // Login Link

                        const SizedBox(height: 30),
                        // White Card Container
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              // Name and First Name Row
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomInputField(
                                      labelText: 'Nom',
                                      hintText: 'Your last name',
                                      isDense: true,
                                      controller: context
                                          .read<SignUpCubit>()
                                          .signUpLastname,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: CustomInputField(
                                      labelText: 'Prénom',
                                      hintText: 'Your first name',
                                      isDense: true,
                                      controller: context
                                          .read<SignUpCubit>()
                                          .signUpFirstname,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              CustomInputField(
                                labelText: 'Email',
                                hintText: 'Enter votre adresse email...',
                                isDense: true,
                                controller:
                                    context.read<SignUpCubit>().signUpEmail,
                              ),
                              const SizedBox(height: 16),
                              CustomInputField(
                                labelText: 'Username',
                                hintText: 'Enter votre Username...',
                                isDense: true,
                                controller:
                                    context.read<SignUpCubit>().signUpName,
                              ),
                              const SizedBox(height: 16),
                              CustomInputField(
                                labelText: 'Password',
                                hintText: '******',
                                isDense: true,
                                obscureText: true,
                                suffixIcon: true,
                                controller:
                                    context.read<SignUpCubit>().signUpPassword,
                              ),
                              const SizedBox(height: 16),
                              const AlreadyHaveAnAccountWidget(),
                              // Username field hidden as per design but kept for functionality

                              const SizedBox(height: 24),
                              state is SignUpLoading
                                  ? const CircularProgressIndicator()
                                  : CustomFormButton(
                                      innerText: 'Confirmer',
                                      onPressed: () {
                                        context.read<SignUpCubit>().signUp();
                                      },
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
