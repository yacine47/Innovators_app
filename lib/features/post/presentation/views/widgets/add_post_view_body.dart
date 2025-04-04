import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/post_model.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/core/widgets/custom_text_form_field.dart';
import 'package:linkdin_app/core/widgets/upload_image_widget.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/post_card.dart';
import 'package:linkdin_app/features/post/presentation/view_model/post_cubit/post_cubit.dart';

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? decription;
  String selectedCategory = 'Simple Post'; // default option
  String? raisedAmount;
  String? targetAmount;

  final List<String> postCategories = [
    'Simple Post',
    'Investment',
    'Donation',
  ];

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.sizeOf(context).height;

    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
        child: Column(
          children: [
            SizedBox(height: h * 0.02),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Select Post Type',
              ),
              items: postCategories
                  .map((type) => DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
            SizedBox(height: h * 0.02),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextFormField(
                      borderColor: Colors.transparent,
                      hint: 'Post Description',
                      maxLines: 12,
                      minLines: 8,
                      onSaved: (value) {
                        decription = value;
                      },
                    ),
                    // Show fields only if the selected category is Investment or Donation
                    if (selectedCategory == 'Investment' ||
                        selectedCategory == 'Donation')
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          borderColor: Colors.transparent,
                          hint: 'Raised Amount',
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            raisedAmount = value;
                          },
                        ),
                      ),
                    if (selectedCategory == 'Investment' ||
                        selectedCategory == 'Donation')
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextFormField(
                          borderColor: Colors.transparent,
                          hint: 'Target Amount',
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            targetAmount = value;
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            SizedBox(height: h * 0.03),
            BlocConsumer<PostCubit, PostState>(
              listener: (context, state) {
                if (state is PostSuccess) {
                  GoRouter.of(context).pop();
                }
              },
              builder: (context, state) {
                return CustomButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();

                      await Hive.box<PostModel>(kPostsBox).add(
                        PostModel(
                          id: 0.toString(),
                          userId: Hive.box(kSettingsBox).get('user').id,
                          caption: decription!,
                          imageUrl: null,
                          comments: [],
                          likes: [],
                          isSimplePost: selectedCategory == 'Simple Post',
                          createdAt: DateTime.now(),
                          usersInv: [],
                          username: Hive.box(kSettingsBox).get('user').name,
                          userAvatar: Hive.box(kSettingsBox)
                              .get('user')
                              .profileImageUrl,
                          category: selectedCategory, // Save the selected type
                          raisedAmount: double.tryParse(raisedAmount ??
                              ''), // Save the raised amount if any
                          targetAmount: double.tryParse(targetAmount ??
                              ''), // Save the target amount if any
                        ),
                      );

                      BlocProvider.of<PostCubit>(context).getData();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  title: 'Add Post',
                );
              },
            ),
            SizedBox(height: h * 0.02),
          ],
        ),
      ),
    );
  }
}
