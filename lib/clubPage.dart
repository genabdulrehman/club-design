import 'dart:math' as pi;

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:design/functions/add_picture.dart';
import 'package:design/functions/update_club.dart';
import 'package:design/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'constants/colors.dart';

class ClubDetailScreen extends StatefulWidget {
  bool? isUser;
  ClubDetailScreen({
    Key? key,
    this.isUser,
  }) : super(key: key);

  @override
  State<ClubDetailScreen> createState() => _ClubDetailScreenState();
}

class _ClubDetailScreenState extends State<ClubDetailScreen> {
  List<String> _clubsImages = [
    // "assets/images/onboarding1.jpeg",
    // "assets/images/onboarding2.jpeg",
    // "assets/images/onboarding3.jpeg",
    // "assets/images/onboarding4.jpeg",
  ];

  final page = PageController();
  TextEditingController _experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClubTopDetailsWidget(
              clubsImages: _clubsImages,
              controller: page,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    Icons.star,
                    color: Colors.purple,
                  ),
                Text(
                  "5.0",
                  style: TextStyle(color: Colors.purple),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Center(
              child: Container(
                height: 105.h,
                width: 343.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  color: Colors.grey.withOpacity(0.2),
                  // image: DecorationImage(
                  //     image: NetworkImage(
                  //         "https://www.mapitstudio.com/wp-content/uploads/2021/04/sieninis-medinis-pasaulio-zemelapis-su-saliu-valstybiu-pavadinimais-kelioniu-zemelapis-azuolas-map-it-studio.jpg"),
                  //     fit: BoxFit.cover),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Types",
                            style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 141, 11, 170),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          Text(
                            "05",
                            style: GoogleFonts.girassol(
                                color: Color.fromARGB(255, 141, 11, 170),
                                fontWeight: FontWeight.bold,
                                fontSize: 40.sp),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Numbers",
                            style: GoogleFonts.roboto(
                                color: Color.fromARGB(255, 141, 11, 170),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                          Text(
                            "10",
                            style: GoogleFonts.girassol(
                                color: Color.fromARGB(255, 141, 11, 170),
                                fontWeight: FontWeight.bold,
                                fontSize: 40.sp),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 15.h),
              child: Text(
                "About Club",
                style: GoogleFonts.roboto(
                    color: Color.fromARGB(255, 141, 11, 170),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 10.h),
              child: Wrap(
                children: [
                  Text(
                    "A nightclub is a bar or a disco where people can dance or be entertained late into the night.",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Colors.black,
                      ),
                      Text(
                        "+1 335 234 2342",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 15.h),
              child: Text(
                "Auditions",
                style: GoogleFonts.roboto(
                    color: Color.fromARGB(255, 141, 11, 170),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 5.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.blur_circular_sharp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Lincencing Permit Requirements.",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 15.h),
              child: Text(
                "Money Talk",
                style: GoogleFonts.roboto(
                    color: Color.fromARGB(255, 141, 11, 170),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 5.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.blur_circular_sharp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Bikni Cost : N / A",
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 10.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Colors.black,
                  name: "Update Club",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => UpdateClub()));
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 1.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Colors.black,
                  name: "Add Pictures",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddPicture()));
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 1.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Colors.black,
                  name: "Mark as closed",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.info,
                      animType: AnimType.rightSlide,
                      title: 'Are You Sure?',
                      desc: 'Please confirm marking club as closed.',
                      btnCancelOnPress: () {
                        AnimatedSnackBar.material(
                          'cancelled',

                          type: AnimatedSnackBarType.error,
                          // brightness: Brightness.light,
                        ).show(
                          context,
                        );
                      },
                      btnOkOnPress: () {
                        AnimatedSnackBar.material(
                          'Club marked as closed successfully',

                          type: AnimatedSnackBarType.success,
                          // brightness: Brightness.light,
                        ).show(
                          context,
                        );
                      },
                    )..show();
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 1.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Color.fromARGB(255, 141, 11, 170),
                  name: "Add money talk review",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.question,
                      body: Column(
                        children: [
                          Center(
                            child: Text(
                              'Your Experience?',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomTextField(
                                controller: _experienceController,
                                validator: (a) {},
                                hintText: "Write your experience...",
                                label: "Write your experience..."),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomButton(
                                buttonBackgroundColor: mainColor,
                                name: "Submit Review",
                                iconColor: mainColor,
                                iconBgColor: Colors.white,
                                ontap: () {}),
                          ),
                        ],
                      ),
                      title: '',
                      desc: 'This is also Ignored',
                      // btnOkOnPress: () {},
                    )..show();
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 1.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Color.fromARGB(255, 141, 11, 170),
                  name: "Add auditions review",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.question,
                      body: Column(
                        children: [
                          Center(
                            child: Text(
                              'Your Experience?',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomTextField(
                                controller: _experienceController,
                                validator: (a) {},
                                hintText: "Write your experience...",
                                label: "Write your experience..."),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomButton(
                                buttonBackgroundColor: mainColor,
                                name: "Submit Review",
                                iconColor: mainColor,
                                iconBgColor: Colors.white,
                                ontap: () {}),
                          ),
                        ],
                      ),
                      title: '',
                      desc: 'This is also Ignored',
                      // btnOkOnPress: () {},
                    )..show();
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 1.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Color.fromARGB(255, 141, 11, 170),
                  name: "Add stage",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.question,
                      body: Column(
                        children: [
                          Center(
                            child: Text(
                              'Stage Emphasis',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Experience',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomTextField(
                                controller: _experienceController,
                                validator: (a) {},
                                hintText: "Write your experience...",
                                label: "Write your experience..."),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomButton(
                                buttonBackgroundColor: mainColor,
                                name: "Submit Review",
                                iconColor: mainColor,
                                iconBgColor: Colors.white,
                                ontap: () {}),
                          ),
                        ],
                      ),
                      title: '',
                      desc: 'This is also Ignored',
                      // btnOkOnPress: () {},
                    )..show();
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 22.w, top: 1.h, right: 22.w, bottom: 10.h),
              child: CustomButton(
                  buttonBackgroundColor: Color.fromARGB(255, 141, 11, 170),
                  name: "Add connections review",
                  iconColor: Colors.black,
                  iconBgColor: Colors.white,
                  ontap: () {
                    // Navigator.pushNamed(context, checkoutScreenRoute);
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.scale,
                      dialogType: DialogType.question,
                      body: Column(
                        children: [
                          Center(
                            child: Text(
                              'Dancers Etiquette',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Management',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Staff',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Tattoed Dancers',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Black Dancers',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Hispanic Dancers',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Think Dancers',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Older Dancers',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Text(
                              'Safeness Dancers',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: 1,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 20),
                            child: CustomButton(
                                buttonBackgroundColor: mainColor,
                                name: "Cleaniness Dancers",
                                iconColor: mainColor,
                                iconBgColor: Colors.white,
                                ontap: () {}),
                          ),
                        ],
                      ),
                      title: '',
                      desc: 'This is also Ignored',
                      // btnOkOnPress: () {},
                    )..show();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ClubTopDetailsWidget extends StatelessWidget {
  List<String> clubsImages;
  PageController controller;
  ClubTopDetailsWidget({
    Key? key,
    required this.clubsImages,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 339.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
      child: Stack(
        children: [
          PageView.builder(
              controller: controller,
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/3/32/Wikipedia_space_ibiza%2803%29.jpg",
                  fit: BoxFit.cover,
                );
              })),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.001),
                  ])),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 50.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, top: 22.h, right: 15.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 34.h,
                            width: 34.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // image: DecorationImage(
                                //   image: AssetImage(
                                //     "assets/images/onboarding1.jpeg",
                                //   ),
                                // ),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Tobie's Lounge",
                                style: GoogleFonts.roboto(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Center(
                                child: SmoothPageIndicator(
                                  controller: controller,
                                  count: 5,
                                  effect: ExpandingDotsEffect(
                                    dotHeight: 7,
                                    dotWidth: 9,
                                    dotColor: Color.fromARGB(255, 141, 11, 170)
                                        .withOpacity(0.2),
                                    activeDotColor:
                                        Color.fromARGB(255, 141, 11, 170),
                                    // type: WormType.thin,
                                    // strokeWidth: 5,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 33.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.sp),
                                // color: Colors.white.withOpacity(0.4),
                                border: Border.all(color: Colors.white)),
                            child: Icon(
                              Icons.favorite,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.w,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 14.sp,
                            color: Color.fromARGB(255, 141, 11, 170),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "2004 wilmington Hawy, NC.",
                            style: GoogleFonts.roboto(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Icon(
                            Icons.timer,
                            size: 14.sp,
                            color: Color.fromARGB(255, 141, 11, 170),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "8pm to 10pm",
                            style: GoogleFonts.roboto(
                              fontSize: 10.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  Color buttonBackgroundColor;
  String name;
  Color iconColor;
  Color iconBgColor;
  VoidCallback ontap;
  CustomButton({
    Key? key,
    required this.buttonBackgroundColor,
    required this.name,
    required this.iconColor,
    required this.iconBgColor,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Material(
        color: buttonBackgroundColor,
        borderRadius: BorderRadius.circular(20.sp),
        child: InkWell(
          onTap: ontap,
          splashColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20.sp),
          child: Container(
            height: 45.h,
            width: double.infinity,
            padding: EdgeInsets.only(left: 20.w, right: 5.w),
            decoration: BoxDecoration(
              // color: buttonBackgroundColor,
              borderRadius: BorderRadius.circular(20.sp),
              border: Border.all(
                  color: buttonBackgroundColor == Colors.purple
                      ? Colors.grey
                      : Colors.transparent),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      color: buttonBackgroundColor == Colors.black
                          ? Colors.white
                          : Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconBgColor,
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: iconColor,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
