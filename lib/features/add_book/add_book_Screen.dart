import 'dart:io';

import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/core/widgets/appTextButton.dart';
import 'package:elocalize_library_task/core/widgets/appTextFormField.dart';
import 'package:elocalize_library_task/core/widgets/appToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddBookScreen extends StatelessWidget {
  AddBookScreen({super.key});


  var formKey = GlobalKey<FormState>();

  var bookNameController = TextEditingController();
  var bookDescriptionController = TextEditingController();
  var copiesController = TextEditingController();
  var authorController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) 
      {
        if(state is AddBookSuccessState)
        {
          Apptoast.showToast(msg: 'The book has been added successfully', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state)
      {

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 10.0.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Center(child: Text('Add Book',style: TextStyles.font32BlueBold,)),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'Book Name',controller: bookNameController,),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'Book Description',maxLines: 2,controller: bookDescriptionController,),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'Author',controller: authorController,),
                    verticalSpacing(20.0),
                    Apptextformfield(
                      controller: copiesController,
                      labelText: 'Copies',
                      keyboardType: TextInputType.number,
                      validator: (value)
                      {
                        if(value == null || value.isEmpty)
                        {
                          return 'Required !';
                        }

                        if(value is int)
                        {
                          return 'Only intger values allowed !';
                        }

                        if(int.parse(value) < 0)
                        {
                          return 'Only positive values allowed !';
                        }

                      },
                    ),
                    verticalSpacing(20.0),
                    AppTextButton(
                      buttonText: AppCubit.get(context).book_image_path != null ? 'Cancel Book Cover' :  'Upload Book Cover',
                      onPressed: ()
                      {
                        if(AppCubit.get(context).book_image_path != null)
                        {
                          AppCubit.get(context).clearBookImage();
                        }
                        else
                        {
                          AppCubit.get(context).getBookImage();
                        }

                      }
                      ,buttonWidth: 150.0
                      ,buttonHeight: 50.0
                      ,),
                    verticalSpacing(20.0),

                    if(AppCubit.get(context).book_image_path != null)
                      Image.file(File(AppCubit.get(context).book_image_path!),
                        width: 100.0.h,
                        height: 150.0.h,
                      ),

                    verticalSpacing(40.0),
                    AppTextButton(
                      buttonText: 'Add Book',
                      onPressed: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          AppCubit.get(context).insertBook(
                              BookModel(
                                bookName: bookNameController.text,
                                bookDescription: bookDescriptionController.text,
                                author: authorController.text,
                                totalCopies: int.parse(copiesController.text),
                                availableCopies: int.parse(copiesController.text),
                                imageLocalPath: AppCubit.get(context).book_image_path ?? '',
                              )
                          );
                          bookNameController.clear();
                          bookDescriptionController.clear();
                          authorController.clear();
                          copiesController.clear();

                          AppCubit.get(context).clearBookImage();
                        }
                      }
                      ,buttonHeight: 50.0
                      ,),

                  ],
                ),
              ),
            ),
          ),
        );

      },
    );
  }
}
