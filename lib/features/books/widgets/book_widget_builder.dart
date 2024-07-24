import 'dart:io';

import 'package:elocalize_library_task/core/helpers/spacing.dart';
import 'package:elocalize_library_task/core/models/book_model.dart';
import 'package:elocalize_library_task/core/routing/routes.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:elocalize_library_task/core/widgets/appImageProvider.dart';
import 'package:elocalize_library_task/core/widgets/appTextButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookWidgetBuilder extends StatelessWidget
{
  const BookWidgetBuilder({super.key, required this.book_model});

  final BookModel book_model;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      // color: Colors.greenAccent,
      height: 120.h,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Hero(
            tag: book_model.id.toString(),
            child: appImageProvider(img_path: book_model.imageLocalPath)
          ),
          horizontalSpacing(20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,

              children:
              [
                Text(book_model.bookName,style: TextStyles.font20DarkBlueMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                verticalSpacing(5.0),
                Text(book_model.author,style: TextStyles.font14GrayRegular,maxLines: 1,overflow: TextOverflow.ellipsis,),
                verticalSpacing(5.0),
                Text('${book_model.availableCopies} of ${book_model.totalCopies}',style: TextStyles.font14GrayRegular,),

              ],
            ),

          ),
          AppTextButton(
            buttonText: 'Borrow',
            onPressed: ()
            {
              Navigator.of(context).pushNamed(Routes.bookDetailsScreen,arguments: book_model);
            }
            ,buttonWidth: 70.0
            ,buttonHeight: 50.0
            ,)


        ],
      ),
    );
  }
}
