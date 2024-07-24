import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/core/models/user_model.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/core/widgets/appTextButton.dart';
import 'package:elocalize_library_task/core/widgets/appTextFormField.dart';
import 'package:elocalize_library_task/core/widgets/appToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});


  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var userCodeController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit,AppStates>
      (
      listener: (context, state)
      {
        if(state is AddUserSuccessState)
        {
          Apptoast.showToast(msg: 'The user has been added successfully', state: ToastStates.SUCCESS);
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
                    Center(child: Text('Add User',style: TextStyles.font32BlueBold,)),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'User Name',controller: userNameController,),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'User Code',controller: userCodeController,),

                    verticalSpacing(40.0),
                    AppTextButton(
                      buttonText: 'Add User',
                      onPressed: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          AppCubit.get(context).insertUser(
                            UserModel(
                              userName: userNameController.text,
                              userCode: userCodeController.text,
                            ),
                          );
                          userNameController.clear();
                          userCodeController.clear();
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
