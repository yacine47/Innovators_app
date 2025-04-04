import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/widgets/upload_image_selected.dart';

class UploadImageWidget extends StatefulWidget {
  const UploadImageWidget({super.key});

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  final ImagePicker imagePicker = ImagePicker();
  File? imageSelected;

  Future<void> selectImages(context) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        imageSelected = File(image.path);
        // BlocProvider.of<AddStoreCubit>(context).storeImage = imageSelected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    return imageSelected != null
        ? Center(
            child: CustomUploadImageSelected(
                image: imageSelected!,
                onTap: () {
                  setState(() {
                    imageSelected = null;
                    // BlocProvider.of<AddStoreCubit>(context).storeImage =
                    imageSelected;
                  });
                }),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width),
              GestureDetector(
                onTap: () {
                  selectImages(context);
                },
                child: Icon(
                  Icons.image,
                  size: 36,
                  color: AppColors.grey04,
                ),
              ),
            ],
          );
  }
}
