import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_cubit.dart';
import 'package:elocalize_library_task/core/logic/cubit/app_states.dart';
import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:elocalize_library_task/core/models/user_model.dart';
import 'package:elocalize_library_task/core/routing/routes.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/core/widgets/appTextButton.dart';
import 'package:elocalize_library_task/core/widgets/appTextFormField.dart';
import 'package:elocalize_library_task/core/widgets/appToast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookTransactionsScreen extends StatelessWidget
{
  BookTransactionsScreen({super.key, required this.isBorrow , required this.bookModel});

  final bool isBorrow;

  final BookModel bookModel;


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {



    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {

        if(state is UpdateBookSuccessState)
        {
          Apptoast.showToast(msg: 'The ${ isBorrow ? 'borrowing' : 'return'} process was completed successfully', state: ToastStates.SUCCESS);
        }
      },
      builder: (context, state)
      {

        var bookNameController = TextEditingController();
        var totalCopiesController = TextEditingController();
        var availableCopiesController = TextEditingController();
        var numOfCopiesToBorrowOrReturnController = TextEditingController();
        var userNameController = TextEditingController();

        var cubit = AppCubit.get(context);

        bookNameController.text = bookModel.bookName;
        totalCopiesController.text = bookModel.totalCopies.toString();
        availableCopiesController.text = bookModel.availableCopies.toString();


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
                    Center(
                        child: Text(isBorrow ? 'Borrow Book' : 'Return Book',style: TextStyles.font32BlueBold,)),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'Book Name' ,enabled:  false,controller: bookNameController,),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'Total Copies'  ,enabled:  false,controller: totalCopiesController,),
                    verticalSpacing(20.0),
                    Apptextformfield(labelText: 'Available Copies',enabled:  false,controller: availableCopiesController,),
                    verticalSpacing(20.0),
                    Apptextformfield(
                      controller: numOfCopiesToBorrowOrReturnController,
                      labelText: 'Number Of Copies To ${isBorrow  ? 'Borrow' : 'Return'}',
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
                    Apptextformfield(
                      controller: userNameController,
                      labelText: 'User Name',
                      keyboardType: TextInputType.none,
                      onTap: ()async
                      {
                        var userModel = await Navigator.of(context).pushNamed(Routes.chooseUserScreen);

                        if(userModel != null)
                        {
                          userNameController.text = (userModel as UserModel).userName;
                        }
                      },
                    ),

                    verticalSpacing(40.0),
                    AppTextButton(
                      buttonText: isBorrow ? 'Borrow Book' : 'Return Book',
                      onPressed: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          
                          if(isBorrow)
                          {
                            if(int.parse(numOfCopiesToBorrowOrReturnController.text) > int.parse(availableCopiesController.text))
                            {
                              Apptoast.showToast(msg: 'Can\'t borrow more books than the available !', state: ToastStates.ERROR);
                            }
                            else
                            {
                              int availableCopies = int.parse(availableCopiesController.text) - int.parse(numOfCopiesToBorrowOrReturnController.text);
                              bookModel.availableCopies = availableCopies;
                              cubit.updateBook(bookModel);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                          }
                          else
                          {
                            if(int.parse(numOfCopiesToBorrowOrReturnController.text) + int.parse(availableCopiesController.text) > int.parse(totalCopiesController.text))
                            {
                              Apptoast.showToast(msg: 'Non-borrowed books can\'t be returned !', state: ToastStates.ERROR);
                            }
                            else
                            {
                              int availableCopies = int.parse(numOfCopiesToBorrowOrReturnController.text) + int.parse(availableCopiesController.text);
                              bookModel.availableCopies = availableCopies;
                              cubit.updateBook(bookModel);
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            }
                          }
                          
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
