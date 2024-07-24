import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/features/users/widgets/user_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget
{
  UsersScreen({super.key});


  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit = AppCubit.get(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text('Users',style: TextStyles.font26DarkBlueBold),

            verticalSpacing(20.0),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index)
              {
                return UserWidgetBuilder(user_model: cubit.usersModel[index],);

              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: cubit.usersModel.length,
            ),
          ],
        );

      },

    );
  }
}
