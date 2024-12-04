import 'package:donation_flutter/app/model/icon_model.dart';
import 'package:donation_flutter/app/modules/admin/controllers/admin_controller.dart';
import 'package:donation_flutter/app/modules/global_widgets/square_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class HomeTopOptionWidget extends GetWidget<AdminController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: _size.width * .65,
        width: _size.width,
        color: Colors.white,
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            crossAxisCount: kIsWeb ? 5 : 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.3,
            children: List.generate(iconButtonData.length, (index) {
              return InkWell(
                onTap: iconButtonData[index].press,
                child: AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 475),
                  columnCount: kIsWeb ? 5 : 3,
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: SquareCardWidget(
                        width: 35,
                        aspectRetio: kIsWeb ? 1.6 : 1.2,
                        image: iconButtonData[index].image,
                        allpadding: 0.0,
                        name: iconButtonData[index].title!.tr,
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
