import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:elocalize_library_task/core/routing/routes.dart';
import 'package:elocalize_library_task/core/theming/colors.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/core/widgets/appImageProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsScreen extends StatelessWidget
{
  BookDetailsScreen({super.key,required this.book_model});

   BookModel book_model;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children:
        [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80.0),
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 20.0.h,horizontal: 10.0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children:
                [
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Hero(
                          tag: book_model.id.toString(),
                          child: appImageProvider(
                            img_path: book_model.imageLocalPath ,
                            width: 150.0,
                            height: 250.0
                          ),
                        ),

                        verticalSpacing(10.0),

                        Text('(${book_model.availableCopies} of ${book_model.totalCopies})',style: TextStyles.font14GrayRegular,),
                      ],
                    ),
                  ),



                  verticalSpacing(20.0),



                  Container(
                    width: double.infinity,
                    height: 30.0,
                    color: ColorsManager.lightgray,
                    child: Center(child: Text('Book Name')),
                  ),
                  verticalSpacing(10.0),
                  Text(book_model.bookName,style: TextStyles.font26DarkBlueBold.copyWith(height: 1.1),),

                  verticalSpacing(20.0),

                  Container(
                    width: double.infinity,
                    height: 30.0,
                    color: ColorsManager.lightgray,
                    child: Center(child: Text('Book Author')),
                  ),

                  verticalSpacing(10.0),

                  Text(book_model.author,style: TextStyles.font13GrayRegular,),


                  verticalSpacing(20.0),

                  Container(
                    width: double.infinity,
                    height: 30.0,
                    color: ColorsManager.lightgray,
                    child: Center(child: Text('Book Description')),
                  ),
                  verticalSpacing(10.0),

                  Text(book_model.bookDescription,style: TextStyles.font13DarkBlueRegular,),


                ],
              ),
            ),
          ),

          Row(
            children:
            [
              Expanded(
                child: GestureDetector(
                  onTap: ()
                  {
                    Navigator.of(context).pushNamed(Routes.bookTransactionsScreen,arguments: {'isBorrow':true,'bookModel':book_model});
                  },
                  child: Container(
                    height: 70.0.h,
                    color: ColorsManager.mainColor,
                    child: Center(child: Text('Borrow',style: TextStyles.font26WhiteSemiBold,)),
                  ),
                ),
              ),

              Container(
                height: 70.0.h,
                width: 2,
                color: Colors.black,
              ),

              Expanded(
                child: GestureDetector(
                  onTap: ()
                  {
                    Navigator.of(context).pushNamed(Routes.bookTransactionsScreen,arguments: {'isBorrow':false,'bookModel':book_model});
                  },
                  child: Container(
                    height: 70.0.h,
                    color: ColorsManager.gray,
                    child: Center(child: Text('Return',style: TextStyles.font26WhiteSemiBold,)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
