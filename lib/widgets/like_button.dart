import 'package:FlutterGalleryApp/res/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;

  LikeButton({this.likeCount = 0, this.isLiked = false});
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  int likeCount;
  bool isLiked;

  @override
  void initState() {
    super.initState();
    likeCount = widget.likeCount;
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //обязательный параметр
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          isLiked = !isLiked;
          if (isLiked) {
            likeCount++;
          } else {
            likeCount--;
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              Icon(isLiked ? AppIcons.like_fill : AppIcons.like),
              SizedBox(width: 4.21),
              Text(
                likeCount.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  height: 16 / 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
