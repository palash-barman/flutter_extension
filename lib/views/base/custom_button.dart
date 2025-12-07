import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import '../../util/style.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key,this.color,this.textStyle, this.padding =EdgeInsets.zero, required this.onTap,required this.text ,this.loading=false,this.width,this.height});
 final Function() onTap;
  final String text;
  final bool loading;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final  TextStyle? textStyle;


  @override

  Widget build(BuildContext context) {
    return  Padding(
      padding: padding,
      child: ElevatedButton(onPressed:loading? (){}:onTap,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r)
            ),
            backgroundColor: color??AppColors.primaryColor,
            minimumSize:Size(width??Get.width, height??53.h),

          ),
          child:loading?  SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(color: Colors.white,),
          ):Text(text,style:textStyle?? AppStyles.h3(fontWeight: FontWeight.w500,color:Colors.white),)),
    );
  }
}