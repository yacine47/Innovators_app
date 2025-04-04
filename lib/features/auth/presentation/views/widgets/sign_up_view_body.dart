import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/core/widgets/custom_text_form_field.dart';
import 'package:linkdin_app/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:linkdin_app/features/home/presentation/views/home_view.dart';
import 'package:linkdin_app/features/views/widgets/navigation_between_auth.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? name;
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
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .08,
              ),
              Text('Create a new account', style: AppStyles.style28),
              SizedBox(height: 36),
              CustomTextFormField(
                hint: 'Name',
                onSaved: (value) {
                  name = value;
                },
              ),
              SizedBox(height: 16),
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
              CustomTextFormField(
                hint: 'Confirm password',
              ),
              SizedBox(height: 24),
              BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    GoRouter.of(context).go(HomeView.path);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    title: 'SIGN IN',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        BlocProvider.of<SignUpCubit>(context).signUp(
                          email: email!,
                          password: password!,
                          fullName: name!,
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
                  GoRouter.of(context).pop();
                },
                textSpan: 'Sign in',
                text: 'Do you have an account?',
              ),
              SizedBox(height: 16),
              // const Divider(
              //   // height: 1,
              //   thickness: 0.2,
              //   color: Colors.black,
              // ),
              // SizedBox(height: 16.sp),
              // const SocialMediaListIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
