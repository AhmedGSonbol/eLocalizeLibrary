import 'package:elocalize_library_task/core/helpers/bloc_observer.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/routing/app_router.dart';
import 'package:elocalize_library_task/core/routing/routes.dart';
import 'package:elocalize_library_task/core/theming/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


void main()async
{
  WidgetsFlutterBinding.ensureInitialized();

  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();

  // Observe changes that is happening in the states.
  Bloc.observer = MyBlocObserver();


  runApp(
      LibraryApp(
    appRouter: AppRouter(),
  ));
}

class LibraryApp extends StatelessWidget
{

  final AppRouter appRouter;

  const LibraryApp({super.key , required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (context) => AppCubit()..getAllBooks()..getAllUsers(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E Localize Library Task',
          theme: Themes.whiteTheme,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.homeScreen,
        ),
      ),
    );

  }
}
