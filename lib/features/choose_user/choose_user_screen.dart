import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/features/users/widgets/user_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseUserScreen extends StatelessWidget {
  const ChooseUserScreen({super.key});

  @override
  Widget build(BuildContext context)
  {


    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding:  EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 10.0.h),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index)
              {
                return UserWidgetBuilder(user_model: cubit.usersModel[index],isChooseUser: true,);

              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.usersModel.length,
            ),
          ),
        );

      },
    );
  }
}
