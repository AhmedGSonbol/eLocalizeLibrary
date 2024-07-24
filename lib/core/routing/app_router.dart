import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:elocalize_library_task/core/routing/routes.dart';
import 'package:elocalize_library_task/features/add_book/add_book_Screen.dart';
import 'package:elocalize_library_task/features/add_user/add_user_Screen.dart';
import 'package:elocalize_library_task/features/book_details/book_details_screen.dart';
import 'package:elocalize_library_task/features/book_transactions/book_transactions_screen.dart';
import 'package:elocalize_library_task/features/books/books_screen.dart';
import 'package:elocalize_library_task/features/choose_user/choose_user_screen.dart';
import 'package:elocalize_library_task/features/home/home_Screen.dart';
import 'package:elocalize_library_task/features/users/users_Screen.dart';
import 'package:flutter/material.dart';


class AppRouter
{
  Route generateRoute(RouteSettings settings)
  {
    final arguments = settings.arguments;

    switch(settings.name)
    {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen(),);
      case Routes.bookDetailsScreen:
        return MaterialPageRoute(builder: (context) => BookDetailsScreen(book_model: arguments as BookModel,),);
      case Routes.booksScreen:
        return MaterialPageRoute(builder: (context) => BooksScreen(),);
      case Routes.usersScreen:
        return MaterialPageRoute(builder: (context) => UsersScreen(),);
      case Routes.addUserScreen:
        return MaterialPageRoute(builder: (context) => AddUserScreen(),);
      case Routes.addBookScreen:
        return MaterialPageRoute(builder: (context) => AddBookScreen(),);
      case Routes.chooseUserScreen:
        return MaterialPageRoute(builder: (context) => ChooseUserScreen(),);
      case Routes.bookTransactionsScreen:
        return MaterialPageRoute(builder: (context)
        {
          Map<String , dynamic> data  = arguments as Map<String , dynamic>;

          return BookTransactionsScreen(isBorrow: data['isBorrow'], bookModel: data['bookModel']);
        }
        );
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No routes defined for ${settings.name}'),
          ),
        ),);
    }
  }
}