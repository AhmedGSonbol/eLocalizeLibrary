import 'dart:io';
import 'package:elocalize_library_task/core/database/users_operations.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:elocalize_library_task/core/models/user_model.dart';
import 'package:elocalize_library_task/core/database/books_operations.dart';
import 'package:elocalize_library_task/features/books/books_screen.dart';
import 'package:elocalize_library_task/features/users/users_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(HomeInitialState());

  static AppCubit get(context) => BlocProvider.of(context);



  List<Widget> screens =
  [
    BooksScreen(),
    UsersScreen(),
  ];

  int currentHomeNavBarScreenIndex = 0;

  void changeBottomNavBarScreen(int screenIndex)
  {
    currentHomeNavBarScreenIndex = screenIndex;

    emit(ChangeBottomNavBarScreenState());
  }


  List<BookModel> booksModel = [];

  void getAllBooks()async
  {
    var map = await getAllBooksData();
    // print(map);
    map.forEach((element)
    {
      booksModel.add(BookModel.fromMap(element));
    });

    emit(GetAllBooksSuccessState());
  }

  void insertBook(BookModel bookModel)async
  {

    await insertBookData(bookModel);
    booksModel.add(bookModel);
    emit(AddBookSuccessState());
  }

  void updateBook(BookModel book_Model)async
  {

    await updateBookData(book_Model);
    booksModel.forEach((book) {
      if (book.id == book_Model.id)
      {
        book.availableCopies = book_Model.availableCopies;
      }
    });
    emit(UpdateBookSuccessState());
  }


  List<UserModel> usersModel = [];

  void getAllUsers()async
  {

    var map = await getAllUsersData();
    map.forEach((element)
    {
      usersModel.add(UserModel.fromMap(element));
    });

    emit(GetAllUsersSuccessState());
  }

  void insertUser(UserModel userModel)async
  {
    var x = await insertUserData(userModel);
    print(x);
    usersModel.add(userModel);
    emit(AddUserSuccessState());
  }



  String? book_image_path;

  final picker = ImagePicker();

  Future getBookImage() async
  {
    final XFile? pickedImage = await picker.pickImage(
        source: ImageSource.gallery);

    if (pickedImage != null) {
      book_image_path = File(pickedImage.path).path;


      emit(PickImageSuccessState());
    }
    else {
      // print('No Image Selected !');
      emit(PickImageErrorState());
    }
  }

  void clearBookImage()
  {
    book_image_path = null;

    emit(ClearBookImageState());
  }





}