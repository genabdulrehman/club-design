import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function validator;
  final String hintText;
  final String label;
  final TextInputType? textInputType;
  final bool? hideText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.label,
    this.textInputType,
    this.hideText,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: lightColor,
      borderRadius: BorderRadius.circular(40),
      elevation: 2,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          // color: Colors.pink.withOpacity(0.3),
          border: Border.all(color: mainColor),
          borderRadius: BorderRadius.circular(
            40.sp,
          ),
        ),
        child: Center(
          child: TextFormField(
            controller: widget.controller,
            validator: (value) => widget.validator(value),
            style: GoogleFonts.inter(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            obscureText: widget.hideText == null ? false : true,
            decoration: InputDecoration(
              hintText: widget.label,
              // contentPadding: EdgeInsets.only(left: 20, right: 20),
              border: InputBorder.none,
              // enabledBorder: InputBorder(borderSide: BorderSide(color: Colors.grey)),
              // enabledBorder: const OutlineInputBorder(
              //   borderSide: const BorderSide(color: Colors.grey, width: 0.0),
              // ),
              // focusedBorder: InputBorder(
              // borderSide: BorderSide(color: kGreyColor),
              // ),

              // label: Text(widget.label),
              hintStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: mainColor),
            ),
          ),
        ),
      ),
    );
  }
}
