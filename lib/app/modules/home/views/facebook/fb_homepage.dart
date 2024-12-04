// import 'dart:html';

import 'dart:io';
import 'dart:ui';
import 'package:badges/badges.dart' as badges;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation_flutter/app/api_providers/api_url.dart';
import 'package:donation_flutter/app/modules/global_widgets/main_drawer_widget.dart';
import 'package:donation_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:donation_flutter/app/modules/home/views/homepage_listing_profile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FbHomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 10),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey[200]),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                  size: 30,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          width: Get.width * .1,
                          height: Get.height * .25,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black54),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/social/images/fire_black.png"),
                                        fit: BoxFit.cover)),
                              ),

                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black54),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/social/images/knowledge_black.png"),
                                        fit: BoxFit.cover)),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black54),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/social/images/debate.png"),
                                        fit: BoxFit.contain)),
                              ),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black54),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/social/images/cuiriocity.png"),
                                        fit: BoxFit.cover)),
                              ),

                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black54),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/social/images/shield.png"),
                                        fit: BoxFit.cover)),
                              ),
                              // Text("Stories", style: TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1.2),),
                              //  Text("See Archive"),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 180,
                          width: Get.width * .75,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              makeStory(
                                  storyImage:
                                      'assets/social/images/story/story-1.jpg',
                                  userImage:
                                      'assets/social/images/aatik-tasneem.jpg',
                                  userName: 'Aatik Tasneem',
                                  text:
                                      "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined."),
                              makeStory(
                                storyImage:
                                    'assets/social/images/story/story-3.jpg',
                                userImage:
                                    'assets/social/images/aiony-haust.jpg',
                                userName: 'Aiony Haust',
                                text: "",
                              ),
                              makeStory(
                                  storyImage:
                                      'assets/social/images/story/story-4.jpg',
                                  userImage:
                                      'assets/social/images/averie-woodard.jpg',
                                  userName: 'Averie Woodard',
                                  text:
                                      "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined."),
                              makeStory(
                                  storyImage:
                                      'assets/social/images/story/story-5.jpg',
                                  userImage:
                                      'assets/social/images/azamat-zhanisov.jpg',
                                  userName: 'Azamat Zhanisov',
                                  text: ""),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    makeFeed(
                      userName: 'Aiony Haust',
                      userImage: 'assets/social/images/aiony-haust.jpg',
                      feedTime: '1 hr ago',
                      feedText:
                          'All the Lorem Ipsum generators on the Internet tend to repeat predefined.',
                      feedImage: 'assets/social/images/story/story-2.jpg',
                      isFired: false,
                      isGeneral: false,
                      isDebate: false,
                    ),
                    makeFeed(
                      userName: 'Azamat Zhanisov',
                      userImage: 'assets/social/images/azamat-zhanisov.jpg',
                      feedTime: '3 mins ago',
                      feedText:
                          "All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                      feedImage: '',
                      isFired: true,
                      isGeneral: true,
                      isDebate: false,
                    ),
                    makeFeed(
                      userName: 'Azamat Zhanisov',
                      userImage: 'assets/social/images/azamat-zhanisov.jpg',
                      feedTime: '3 mins ago',
                      feedText:
                          "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                      feedImage: 'assets/social/images/averie-woodard.jpg',
                      isFired: false,
                      isGeneral: false,
                      isDebate: false,
                    ),
                    makeFeed(
                      userName: 'Azamat Zhanisov',
                      userImage: 'assets/social/images/azamat-zhanisov.jpg',
                      feedTime: '3 mins ago',
                      feedText:
                          "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
                      feedImage: '',
                      isFired: false,
                      isGeneral: false,
                      isDebate: true,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget makeStory({storyImage, userImage, userName, text}) {
    return AspectRatio(
      aspectRatio: 1.6 / 2,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image:
              DecorationImage(image: AssetImage(storyImage), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: DecorationImage(
                        image: AssetImage(userImage), fit: BoxFit.cover)),
              ),
              Container(
                  height: Get.height * .1,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  )),
              Text(
                userName,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget makeFeed(
      {userName,
      userImage,
      feedTime,
      feedText,
      feedImage,
      isFired,
      isGeneral,
      isDebate}) {
    if (isFired == true) {
      return Row(
        children: [
          Container(
            width: Get.width * .8,
            height: Get.height * .5,
            decoration: BoxDecoration(
              color:
                  isFired == true ? Colors.red.withOpacity(.1) : Colors.white,
            ),
            margin: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: isFired == true
                          ? Colors.red.withOpacity(.1)
                          : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(userImage),
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  userName,
                                  style: TextStyle(
                                      color: Colors.grey[900],
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  feedTime,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        isFired == false
                            ? Container()
                            : Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/social/images/fire.png"),
                                        fit: BoxFit.cover)),
                              ),
                        IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            size: 30,
                            color: Colors.grey[600],
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    feedText,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                        height: 1.5,
                        letterSpacing: .7),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  isDebate == true
                      ? Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    //  color: Colors.blue.withOpacity(.3),
                                    ),
                                width: Get.width * .4,
                                child: Text(
                                  "Do you think bangladesh can turn back within a year?",
                                  style: TextStyle(
                                      fontSize: 13,
                                      height: 1,
                                      letterSpacing: .7,
                                      color: Colors.blue[800]),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    //   color: Colors.green.withOpacity(.5),
                                    ),
                                width: Get.width * .4,
                                child: Text(
                                  "It may take more than a year?",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.green[800],
                                      height: 1,
                                      letterSpacing: .7),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  feedImage != ''
                      ? Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(feedImage),
                                  fit: BoxFit.cover)),
                        )
                      : Container(),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(color: Colors.green.shade50),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  makeLike(),
                                  Transform.translate(
                                      offset: Offset(-5, 0),
                                      child: makeWater()),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "2.5K",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[800]),
                                  )
                                ],
                              ),
                              isGeneral == true
                                  ? Row(
                                      children: <Widget>[
                                        Text(
                                          "Authenticity",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[800]),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "77%",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[800]),
                                        )
                                      ],
                                    )
                                  : Container(),
                              Text(
                                "400 Comments",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.grey[800]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              giveWater(isActive: true),
                              makeCommentButton(),
                              InkWell(
                                  onTap: () {
                                    controller.showClaimList(Get.context);
                                  },
                                  child: makeShareButton()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          color: isFired == true ? Colors.red.withOpacity(.1) : Colors.white,
        ),
        margin: EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: isFired == true
                      ? Colors.red.withOpacity(.1)
                      : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(userImage),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userName,
                              style: TextStyle(
                                  color: Colors.grey[900],
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              feedTime,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    isFired == false
                        ? Container()
                        : Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/social/images/fire.png"),
                                    fit: BoxFit.cover)),
                          ),
                    IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        size: 30,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                feedText,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[800],
                    height: 1.5,
                    letterSpacing: .7),
              ),
              SizedBox(
                height: 20,
              ),
              isDebate == true
                  ? Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                //  color: Colors.blue.withOpacity(.3),
                                ),
                            width: Get.width * .4,
                            child: Text(
                              "Do you think bangladesh can turn back within a year?",
                              style: TextStyle(
                                  fontSize: 13,
                                  height: 1,
                                  letterSpacing: .7,
                                  color: Colors.blue[800]),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //   color: Colors.green.withOpacity(.5),
                                ),
                            width: Get.width * .4,
                            child: Text(
                              "It may take more than a year?",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.green[800],
                                  height: 1,
                                  letterSpacing: .7),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              feedImage != ''
                  ? Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(feedImage), fit: BoxFit.cover)),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: Colors.green.shade50),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              makeLike(),
                              Transform.translate(
                                  offset: Offset(-5, 0), child: makeLove()),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "2.5K",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey[800]),
                              )
                            ],
                          ),
                          isGeneral == true
                              ? Row(
                                  children: <Widget>[
                                    Text(
                                      "Authenticity",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[800]),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "77%",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey[800]),
                                    )
                                  ],
                                )
                              : Container(),
                          Text(
                            "400 Comments",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[800]),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          makeLikeButton(isActive: true),
                          makeCommentButton(),
                          InkWell(
                              onTap: () {
                                controller.showClaimList(Get.context);
                              },
                              child: makeShareButton()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget makeLike() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeLove() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }

  Widget makeWater() {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white)),
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/social/images/water.png"),
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }

  Widget makeLikeButton({isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.thumb_up,
              color: isActive ? Colors.blue : Colors.grey,
              size: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Like",
              style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget giveWater({isActive}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue),
                  image: DecorationImage(
                      image: AssetImage("assets/social/images/water.png"),
                      fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeCommentButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.chat, color: Colors.grey, size: 18),
            SizedBox(
              width: 5,
            ),
            Text(
              "Comment",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  Widget makeShareButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/social/images/claim.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Claim?",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
