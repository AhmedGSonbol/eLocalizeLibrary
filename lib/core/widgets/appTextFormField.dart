import 'package:elocalize_library_task/core/theming/colors.dart';
import 'package:elocalize_library_task/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Apptextformfield extends StatelessWidget
{

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? labelTextStyle;
  final bool? isObSecureText;
  final Widget? suffixIcon;
  final int? maxLines;
  final String? initialValue;
  final TextInputType? keyboardType;
  final bool? enabled ;
  final TextEditingController controller;
  final String labelText;

  final String? Function(String?)? validator;
  final void Function()? onTap;


  const Apptextformfield(
      {
        super.key,
        this.focusedBorder,
        this.contentPadding,
        this.enabledBorder,
        this.inputTextStyle,
        this.labelTextStyle,
        this.isObSecureText,
        this.suffixIcon,
        this.maxLines,
        this.keyboardType,
        this.initialValue,
        this.enabled,
        required this.controller,
        required this.labelText,

        this.validator,
        this.onTap

      });

  @override
  Widget build(BuildContext context)
  {
    return TextFormField(
      onTap: onTap,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 18.h
        ),

        enabledBorder: enabledBorder ?? const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0),),
          borderSide: BorderSide(
            color: ColorsManager.lightergray,
            width: 1.3
          )
        ),
        focusedBorder: focusedBorder ?? const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0),),
            borderSide: BorderSide(
                color: ColorsManager.mainColor,
                width: 1.3
            )
        ),

        border: enabledBorder ?? const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0),),
            borderSide: BorderSide(
                color: ColorsManager.lightergray,
                width: 1.3
            )
        ),
        labelStyle: labelTextStyle ?? TextStyles.font14GrayRegular,
        // hintText: hintText,
        label: Text(labelText),
        suffixIcon: suffixIcon ?? const SizedBox(),
      ),
      maxLines: maxLines ?? 1,
      obscureText: isObSecureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: <TextInputFormatter>
      [
        if(keyboardType != null && keyboardType == TextInputType.number)
          FilteringTextInputFormatter.digitsOnly


      ],
      validator: validator ?? (value)
      {
        if(value == null || value.isEmpty)
        {
          return 'Required !';
        }

      },
      initialValue: initialValue,
      enabled: enabled ?? true,
      controller: controller,



    );
  }
}
