import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/core/utils/widgets/custom_button.dart';
import 'package:social_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:social_app/features/auth/presentation/cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_in/alternative_sign_in.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_in/dont_have_an_account_widget.dart';
import 'package:social_app/features/auth/presentation/widgets/sign_in/sign_in_view_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'Username',
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  email = value!;
                },
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Password',
                textInputType: TextInputType.visiblePassword,
                isPassword: true,
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Styles.styleSemiBold14(
                        context,
                      ).copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              CustomButton(
                btnText: 'Sign In',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SignInCubit>().login(
                      username: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 30),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 30),
              const SignInViewDivider(),
              const SizedBox(height: 20),
              const AlternativeSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
