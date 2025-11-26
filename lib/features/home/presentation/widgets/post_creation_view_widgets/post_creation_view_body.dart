import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/functions/show_custom_snack_bar.dart';
import 'package:social_app/core/themes/app_colors.dart';
import 'package:social_app/core/utils/styles.dart';
import 'package:social_app/core/utils/widgets/custom_button.dart';
import 'package:social_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:social_app/features/home/presentation/widgets/post_creation_view_widgets/add_post_image_widget.dart';
import 'package:social_app/features/home/presentation/widgets/post_creation_view_widgets/create_post_text_field.dart';

class PostCreationViewBody extends StatefulWidget {
  const PostCreationViewBody({super.key});

  @override
  State<PostCreationViewBody> createState() => _PostCreationViewBodyState();
}

class _PostCreationViewBodyState extends State<PostCreationViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String title, content;
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title*', style: Styles.styleBold18(context)),
              const SizedBox(height: 8),
              CreatePostTextField(
                onSaved: (value) {
                  title = value!;
                },
                hintText: 'Enter an Engaging Title for Your Post',
              ),
              const SizedBox(height: 16),
              Text('Content*', style: Styles.styleBold18(context)),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: CreatePostTextField(
                  onSaved: (value) {
                    content = value!;
                  },
                  expands: true,
                  hintText: 'Share Your Thoughts With the Community...',
                ),
              ),
              const SizedBox(height: 16),
              Text('Image', style: Styles.styleBold18(context)),
              const SizedBox(height: 8),
              AddPostImageWidget(
                onImagePicked: (pickedImage) {
                  this.pickedImage = pickedImage;
                },
              ),
              const SizedBox(height: 22),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeFailure) {
                    showCustomSnackBar(
                      context,
                      state.errorMessage,
                      backgroundColor: Colors.red,
                    );
                  }
                  if (state is CreatePostSuccess) {
                    showCustomSnackBar(context, 'Post Created Successfully!');
                    Navigator.pop(context, true);
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    btnText: 'Publish Post',
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await context.read<HomeCubit>().createPost(
                          title: title,
                          content: content,
                          image: pickedImage,
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
            ],
          ),
        ),
      ),
    );
  }
}
