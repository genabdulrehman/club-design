import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:design/add_post.dart';
import 'package:design/report_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:design/constants/colors.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPost()),
            );
          }),
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Dressing Room",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                showFilterBottomsheet(context);
              },
              icon: Icon(
                Icons.edit_note_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          PostWidget(
            authorName: "Abdulrehman",
            authorImage: "assets/speaker.png",
            postDesc:
                "It's a tracker that collents all tasks in one place, shows the progress, and all important information.",
            likes: 342,
            comments: 50,
            imgs: [
              "assets/post1.jpeg",
              "assets/post2.jpeg",
              "assets/post2.jpeg",
            ],
          ),
          PostWidget(
            authorName: "Crissa",
            authorImage: "assets/post3.jpeg",
            postDesc:
                "It's a tracker that collents all tasks in one place, shows the progress, and all important information.",
            likes: 500,
            comments: 78,
            imgs: [
              "assets/post2.jpeg",
              "assets/post1.jpeg",
              "assets/post3.jpeg",
            ],
          ),
          PostWidget(
            authorName: "Oscar",
            authorImage: "assets/post2.jpeg",
            postDesc:
                "It's a tracker that collents all tasks in one place, shows the progress, and all important information.",
            likes: 500,
            comments: 78,
            imgs: [
              "assets/post3.jpeg",
              "assets/post2.jpeg",
              "assets/post1.jpeg",
            ],
          ),
        ]),
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  String authorName;
  String postDesc;
  List<String> imgs;
  String authorImage;
  int likes;
  int comments;
  PostWidget({
    Key? key,
    required this.authorName,
    required this.postDesc,
    required this.imgs,
    required this.authorImage,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isLiked = false;

  bool isComment = false;

  updateReaction(bool react) {
    setState(() {
      react != react;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.h,
      width: 400.w,
      margin: EdgeInsets.only(top: 5.h),
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 40.h,
                width: 40.w,
                child: ClipOval(
                  child: Image.asset(
                    widget.authorImage,
                  ),
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Text(
                widget.authorName,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  _showbottomSheet(context);
                },
                child: Icon(
                  Icons.more_horiz,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          widget.imgs.isEmpty
              ? Container()
              : Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                      height: 300.h,
                      width: 350.w,
                      child: PageView.builder(
                          itemCount: widget.imgs.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              widget.imgs[index],
                            );
                          })),
                ),
          Text(
            widget.postDesc,
            style: GoogleFonts.inter(
              color: Colors.black,
              height: 1.3,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ReactionWidget(
                title: "${widget.comments} Comments",
                icon: Icons.comment,
                isSelected: isComment,
                onTap: () {
                  _showCommentBottomSheet(context);
                  setState(() {
                    isComment = !isComment;
                    print(isComment);
                  });
                },
              ),
              ReactionWidget(
                title: "${widget.likes} Likes",
                icon: Icons.favorite,
                isSelected: isLiked,
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              ReactionWidget(
                title: "10 Shares",
                icon: Icons.share_rounded,
                isSelected: false,
                onTap: () {
                  print("done");
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReactionWidget extends StatefulWidget {
  String title;
  bool isSelected;
  IconData icon;
  Function() onTap;
  ReactionWidget({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ReactionWidget> createState() => _ReactionWidgetState();
}

class _ReactionWidgetState extends State<ReactionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Row(
        children: [
          Icon(
            widget.icon,
            color: widget.isSelected ? mainColor : Colors.grey,
            size: 18,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            widget.title,
            style: GoogleFonts.inter(
              color: widget.isSelected ? mainColor : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

void _showbottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // color: Colors.black,
          height: 250.h,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 13.h,
              ),
              Container(
                height: 115.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 13.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'Are You Sure?',
                          desc: 'Are you sure want to block the user?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {},
                        )..show();
                      },
                      child: Text(
                        "Block User",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.8),
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReportUser()),
                        );
                      },
                      child: Text(
                        "Report User",
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.sp),
                  ),
                  child: Center(
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      });
}

void _showCommentBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            // height: 400,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20.sp,
                ),
                topRight: Radius.circular(20.sp),
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 5.h,
                                width: 40.w,
                                margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.sp),
                                    color: Colors.grey),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  children: [
                                    CommentWidget(),
                                    CommentWidget(),
                                    CommentWidget(),
                                    CommentWidget(),
                                    CommentWidget(),
                                    CommentWidget(),
                                    CommentWidget(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.sp),
                      color: Color.fromARGB(255, 239, 239, 239),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                      child: Row(children: [
                        Container(
                          height: 40.h,
                          width: 40.h,
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
                        Container(
                          height: 40.h,
                          width: 280.w,
                          padding: EdgeInsets.only(right: 15.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.sp),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: SizedBox(
                                    width: 230.w,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 5, left: 15.w)),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Post",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    color: mainColor,
                                  ),
                                ),
                              ]),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.h,
              width: 40.h,
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
              width: 20.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "abdul",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black,
                    ),

                    // maxLines: 3,
                    // overflow: TextOverflow.clip,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    "It's a tracker that collects all tasks in one place, shows the progress, and all iomportant information.",
                    // maxLines: 3,
                    // overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            Spacer(),
            Icon(
              Icons.reply,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(
              width: 20.w,
            ),
            Icon(
              Icons.favorite,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
        Divider(
          endIndent: 20.w,
          indent: 20.w,
          color: Colors.grey.withOpacity(0.5),
        ),
      ],
    );
  }
}

void showFilterBottomsheet(BuildContext context) {
  List<IconData> _icons = [
    Icons.photo_library,
    Icons.photo,
    Icons.person_4_sharp,
  ];
  List<String> _names = [
    "All posts",
    "My posts",
    "Following",
  ];
  int _selected = 0;
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  20.sp,
                ),
                topRight: Radius.circular(20.sp),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 5.h,
                  width: 40.w,
                  margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.grey),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Text(
                        "Filter your posts",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 100,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: ListView.builder(
                    itemCount: _icons.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 80.w,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: _selected == index
                                  ? mainColor.withOpacity(0.1)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(
                                20.sp,
                              ),
                              border: Border.all(
                                  color: _selected == index
                                      ? mainColor
                                      : Colors.grey.withOpacity(0.5),
                                  width: 3),
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _icons[index],
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    _names[index],
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Container(
                    height: 100,
                    color: mainColor.withOpacity(0.1),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: SizedBox(
                                height: 60,
                                width: 100,
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: mainColor,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            Container(
                              height: 100,
                              // color: mainColor.withOpacity(0.1),
                              child: Row(children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: SizedBox(
                                    height: 60,
                                    width: 100,
                                    child: Center(
                                      child: Text(
                                        'Apply',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    backgroundColor: mainColor,
                                  ),
                                )
                              ]),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
