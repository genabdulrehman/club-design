import 'package:design/clubPage.dart';
import 'package:design/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/colors.dart';

class ReportUser extends StatefulWidget {
  const ReportUser({super.key});

  @override
  State<ReportUser> createState() => _ReportUserState();
}

class _ReportUserState extends State<ReportUser> {
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 2,
        title: Text(
          "Report Abusive Content",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 30.h),
        child: Column(
          children: [
            CustomTextField(
              controller: _emailController,
              validator: () {},
              hintText: "User email",
              label: "My email",
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: _emailController,
              validator: () {},
              hintText: "My email",
              label: "User being reported",
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: _emailController,
              validator: () {},
              hintText: "User email",
              label: "Objectionable content posted",
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
              controller: _emailController,
              validator: () {},
              hintText: "User email",
              label: "Location in app",
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButton(
                buttonBackgroundColor: mainColor,
                name: "Submit",
                iconColor: Colors.transparent,
                iconBgColor: Colors.transparent,
                ontap: () {}),
          ],
        ),
      ),
    );
  }
}
