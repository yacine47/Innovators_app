import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/core/widgets/custom_text_form_field.dart';
import 'package:linkdin_app/features/views/widgets/navigation_between_auth.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hint: 'Email',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hint: 'Password',
            ),
            SizedBox(height: 16),
            CustomTextFormField(
              hint: 'Confirm password',
            ),
            SizedBox(height: 24),
            CustomButton(
              title: 'Sign up',
              onPressed: () {},
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
    );
  }
}
