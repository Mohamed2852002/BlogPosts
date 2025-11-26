import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/functions/show_custom_snack_bar.dart';
import 'package:social_app/core/utils/widgets/custom_button.dart';
import 'package:social_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:social_app/features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_up/already_have_an_account_widget.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_up/terms_and_conditions_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String username, email, password, password2, firstName, lastName;
  bool termsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Username',
                      textInputType: TextInputType.name,
                      onSaved: (value) {
                        username = value!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Email',
                      isEmail: true,
                      textInputType: TextInputType.emailAddress,
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'First Name',
                      textInputType: TextInputType.name,
                      onSaved: (value) {
                        firstName = value!;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: 'Last Name',
                      textInputType: TextInputType.name,
                      onSaved: (value) {
                        lastName = value!;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                onSaved: (value) {
                  password = value!;
                },
                isPassword: true,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Confirm Password',
                textInputType: TextInputType.visiblePassword,
                onSaved: (value) {
                  password2 = value!;
                },
                isPassword: true,
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  termsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                btnText: 'Create Account',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (!termsAccepted) {
                      showCustomSnackBar(
                        context,
                        'Please accept the terms and conditions.',
                      );
                    } else {
                      context.read<SignUpCubit>().register(
                        username: username.trim(),
                        email: email.trim(),
                        password: password.trim(),
                        password2: password2.trim(),
                        firstName: firstName.trim(),
                        lastName: lastName.trim(),
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 30),
              const AlreadyHaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
