import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/core/routing/routes.dart';
import 'package:elocalize_library_task/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget
{
  HomeScreen({super.key});


  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit , AppStates>(
    listener: (context, state) {},
    builder: (context, state)
    {

      var cubit = AppCubit.get(context);

      return Scaffold(


          extendBodyBehindAppBar: true,

        body: SafeArea(
          child: SingleChildScrollView(
            padding:  EdgeInsets.only(bottom: 50.0.h),

            physics: const BouncingScrollPhysics(),
            child: Column(
              children:
              [
                Container(
                  color: ColorsManager.lightergray,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 10.0.h),
                    child: Row(
                      children:
                      [
                        Image.asset('assets/images/logo.png',width: 60.0,height: 60.0,),
                        horizontalSpacing(10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            RichText(text: TextSpan(
                                children:
                                [
                                  TextSpan(text: 'E Localize ',style: TextStyle(color: Colors.black , fontSize: 25.0.sp , fontFamily: 'Inter')),
                                  TextSpan(text: 'Library Task',style: TextStyle(color: Colors.black , fontSize: 15.0.sp , fontFamily: 'Inter')),
                                ]
                            ),
                            ),

                            const Text('By Ahmed Gehad Sonbol',),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                verticalSpacing(20.0),

                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.0.h),
                  child: cubit.screens[cubit.currentHomeNavBarScreenIndex],
                )

              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index)
          {
            cubit.changeBottomNavBarScreen(index);
          },
          selectedItemColor: ColorsManager.mainColor,


          items:
          const [
            BottomNavigationBarItem(
                icon: Icon(
                    Icons.book,
                  color: ColorsManager.darkBlue,
                ),
                label: 'Books',
              activeIcon: Icon(
                Icons.book,
                color: ColorsManager.mainColor,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.groups,
                  color: ColorsManager.darkBlue,
                ),
                activeIcon:  Icon(
                  Icons.groups,
                  color: ColorsManager.mainColor,
                ),
                label: 'Users',
            ),
          ],

          currentIndex: cubit.currentHomeNavBarScreenIndex,

        ),
        floatingActionButton: cubit.currentHomeNavBarScreenIndex == 0 // books screen
            ?
        FloatingActionButton(
          onPressed: ()
          {
            // add Book
            Navigator.of(context).pushNamed(Routes.addBookScreen);
          },
          child: const Icon(
              Icons.library_add,
            color: ColorsManager.mainColor,

          ),
        )
            :
        FloatingActionButton(
          onPressed: ()
          {
            // add User
            Navigator.of(context).pushNamed(Routes.addUserScreen);
          },
          child: const Icon(
              Icons.person_add_alt_1_outlined,
            color: ColorsManager.mainColor,
          ),
        )

        );

    },
    );
  }
}
