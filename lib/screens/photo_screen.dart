import 'package:FlutterGalleryApp/res/res.dart';
import 'package:FlutterGalleryApp/widgets/photo.dart';
import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'feed_screens.dart';

class FullScreenImage extends StatefulWidget {
  final String name;
  final String userName;
  final String photo;
  final String altDescription;

  FullScreenImage(
      {this.name, this.userName, this.photo, this.altDescription, Key key})
      : super(key: key);
  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Photo(photoLink: widget.photo ?? kFlutterDash),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Text(
              widget.altDescription ??
                  'Дождались меня белые ночи, над простором густых островов… Снова смотрят знакомые очи, и мелькает былое без слов.',
              overflow: TextOverflow.ellipsis,
              style: AppStyles.h3.copyWith(color: AppColors.manatee),
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: _buildPhotoMeta(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(likeCount: 0, isLiked: false),
                ButtonBar(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: AppColors.dodgerBlue,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                          child: Text('Save',
                              style:
                                  AppStyles.h4.copyWith(color: AppColors.white)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: AppColors.dodgerBlue,
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                          child: Text('Visit',
                              style:
                                  AppStyles.h4.copyWith(color: AppColors.white)),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Photo'),
      leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget _buildPhotoMeta() {
    return Row(
      children: <Widget>[
        UserAvatar('https://s1.1zoom.ru/big7/640/Scenery_Mountains_Lake_Grasslands_Canada_Banff_512435_2560x1687.jpg'),
        SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.name ?? 'Roman Ablaev', style: AppStyles.h1Black),
            Text(widget.userName ?? '@designer_79',
                style: AppStyles.h5Black.copyWith(color: AppColors.manatee)),
          ],
        ),
      ],
    );
  }
}
