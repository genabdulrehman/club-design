import 'package:design/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../clubPage.dart';

class AddPicture extends StatefulWidget {
  const AddPicture({super.key});

  @override
  State<AddPicture> createState() => _AddPictureState();
}

class _AddPictureState extends State<AddPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: Icon(
        //   Icons.arrow_back_ios_new,
        // ),
        title: Text(
          "Add New Club",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: mainColor),
                height: 80.h,
                width: 80.w,
                child: Icon(Icons.camera_alt),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
                buttonBackgroundColor: mainColor,
                name: "Submit",
                iconColor: mainColor,
                iconBgColor: Colors.white,
                ontap: () {}),
          ],
        ),
      ),
    );
  }
}
