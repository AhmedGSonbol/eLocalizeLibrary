import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/models/user_model.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/core/widgets/appTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserWidgetBuilder extends StatelessWidget
{
  const UserWidgetBuilder({super.key, required this.user_model , this.isChooseUser = false});

  final UserModel user_model;

  final bool isChooseUser;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      height: 85.h,

      child: Row(
        children:
        [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [
                Row(
                  children:
                  [
                    Text('Name: ',style: TextStyles.font20DarkBlueMedium),
                    Expanded(child: Text(user_model.userName,style: TextStyles.font20DarkBlueMedium,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                  ],
                ),
                verticalSpacing(5.0),
                Row(
                  children:
                  [
                    Text('Code: ',style: TextStyles.font20DarkBlueMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    Expanded(child: Text(user_model.userCode,style: TextStyles.font14GrayRegular,maxLines: 1,overflow: TextOverflow.ellipsis,)),
                  ],
                ),


              ],
            ),
          ),

          if(isChooseUser)
          AppTextButton(

            buttonText: 'Choose',
            onPressed: ()
            {
              Navigator.of(context).pop(user_model);
            }
            ,buttonWidth: 70.0
            ,buttonHeight: 50.0
            ,),
        ],
      ),
    );
  }
}
