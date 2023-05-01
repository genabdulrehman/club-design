import 'package:design/clubPage.dart';
import 'package:design/constants/colors.dart';
import 'package:design/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateClub extends StatefulWidget {
  const UpdateClub({super.key});

  @override
  State<UpdateClub> createState() => _UpdateClubState();
}

class _UpdateClubState extends State<UpdateClub> {
  TextEditingController _moneyController = TextEditingController();
  TextEditingController _stageController = TextEditingController();
  TextEditingController _auditionsController = TextEditingController();
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
          "Update Club",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.sp, right: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.sp,
            ),
            Text(
              "Money Talk",
              style: GoogleFonts.inter(
                color: mainColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            CustomTextField(
              controller: _moneyController,
              validator: () {},
              hintText: "Money Talk",
              label: "Money Talk",
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Stage",
              style: GoogleFonts.inter(
                color: mainColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            CustomTextField(
              controller: _moneyController,
              validator: () {},
              hintText: "Stage",
              label: "Stage",
            ),
            SizedBox(
              height: 20.sp,
            ),
            Text(
              "Auditions",
              style: GoogleFonts.inter(
                color: mainColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10.sp,
            ),
            CustomTextField(
              controller: _moneyController,
              validator: () {},
              hintText: "Auditions",
              label: "Auditions",
            ),
            SizedBox(
              height: 20.sp,
            ),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (a) {},
                  activeColor: mainColor,
                ),
                Text(
                  "Club is now closed",
                  style:
                      GoogleFonts.inter(color: Colors.black, fontSize: 12.sp),
                ),
              ],
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
