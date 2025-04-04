import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:linkdin_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:linkdin_app/features/views/widgets/navigation_between_auth.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/core/widgets/custom_text_form_field.dart';
import 'package:linkdin_app/features/home/presentation/views/home_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .2,
              ),
              Text('LOGIN', style: AppStyles.style28),
              SizedBox(height: 68),
              CustomTextFormField(
                hint: 'Email',
                onSaved: (value) {
                  email = value;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hint: 'Password',
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(height: 16),
              // Text('Forgot Password', style: AppStyles.style12),
              SizedBox(height: 16),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    GoRouter.of(context).go(HomeView.path);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    title: 'SIGN IN',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<LoginCubit>(context).login(
                          email: email!,
                          password: password!,
                        );
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 24),
              NavigationBetweenAuth(
                onTap: () {
                  GoRouter.of(context).push(SignUpView.path);
                },
                textSpan: 'Sign Up',
                text: 'Don\'t have account',
              ),
              SizedBox(height: 16),

              // SizedBox(height: 16),
              // const SocialMediaListIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
