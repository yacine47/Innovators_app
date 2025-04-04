// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class PageViewContent extends StatelessWidget {
  const PageViewContent({
    super.key,
    required this.title,
    required this.description,
    required this.img,
  });

  final String title;
  final String description;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 2 / 1.9,
          child: Image.asset(
            img,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.style23.copyWith(
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                description,
                style: AppStyles.style16,
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
