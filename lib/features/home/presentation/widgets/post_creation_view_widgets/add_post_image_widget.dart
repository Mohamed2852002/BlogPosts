import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/services/pick_image_service.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/core/utils/widgets/custom_button.dart';

class AddPostImageWidget extends StatefulWidget {
  const AddPostImageWidget({super.key, required this.onImagePicked});
  final Function(File? image) onImagePicked;
  @override
  State<AddPostImageWidget> createState() => _AddPostImageWidgetState();
}

class _AddPostImageWidgetState extends State<AddPostImageWidget> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child:
          pickedImage != null
              ? Column(
                spacing: 16,
                children: [
                  GestureDetector(
                    onTap: () => imagePickerDialog(),
                    child: Image.file(pickedImage!),
                  ),
                  CustomButton(
                    backgroundColor: Colors.red,
                    onPressed: () {
                      pickedImage = null;
                      widget.onImagePicked(pickedImage);
                      setState(() {});
                    },
                    btnText: 'Remove Image',
                  ),
                ],
              )
              : DottedBorder(
                options: RectDottedBorderOptions(
                  dashPattern: const [10, 5],
                  color: Colors.grey.withValues(alpha: 0.5),
                  strokeWidth: 2,
                  padding: const EdgeInsets.all(16),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    imagePickerDialog();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.upload, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(
                        'Add Image',
                        style: Styles.styleBold16(
                          context,
                        ).copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  imagePickerDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            contentPadding: const EdgeInsets.only(top: 16),
            backgroundColor: AppColors.surfaceColor,
            title: const Text('Select Image Source'),
            titleTextStyle: Styles.styleBold26(context),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        final File? temp =
                            await PickImageService.pickImageFromCamera();
                        if (temp != null) {
                          pickedImage = temp;
                          widget.onImagePicked(pickedImage);
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                          ),
                          // color: Colors.grey,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text('Camera', style: Styles.styleBold16(context)),
                  ],
                ),
                Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        Navigator.pop(context);
                        final File? temp =
                            await PickImageService.pickImageFromGallery();
                        if (temp != null) {
                          pickedImage = temp;
                          widget.onImagePicked(pickedImage);
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.white, width: 2),
                          ),
                          // color: Colors.grey,
                        ),
                        child: const Icon(
                          Icons.photo_library_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text('Gallery', style: Styles.styleBold16(context)),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
