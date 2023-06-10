import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:design/constants/colors.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller.text.length > 5 ? post = true : false;
    });
  }

  bool post = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1,
        title: Text(
          "Create post",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.delete,
            color: Colors.red.withOpacity(0.5),
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            height: 30,
            width: 60,
            margin: EdgeInsets.only(bottom: 10.h, top: 10.h, right: 20.w),
            decoration: BoxDecoration(
              color:
                  post ? mainColor.withOpacity(1) : mainColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                5.sp,
              ),
            ),
            child: Center(
              child: Text(
                "Post",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 15,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/post1.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  "Abdul Rehman",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: controller,
              onChanged: (a) {
                setState(() {
                  a.length > 5 ? post = true : post = false;
                });
              },
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 20.sp,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "What\'s on your mind?",
              ),
              maxLines: 10,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PostWidgets(
                  icon: Icons.image,
                  title: "Photo",
                ),
                SizedBox(
                  width: 30.w,
                ),
                PostWidgets(
                  icon: Icons.more_horiz,
                  title: "Others",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostWidgets extends StatelessWidget {
  String title;
  IconData icon;

  PostWidgets({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
          child: Icon(
            icon,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
