import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progressbar_with_getx/controller/progress_bar_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBarView extends StatelessWidget {
  ProgressBarView({super.key});

  late final ProgressBarController progressBarController =
  Get.put(ProgressBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff556374),
        title: Text('Progress Bar Example'),
      ),
      body: Column(
        children: [
          progressBar(),
          nextItemButton(),
        ],
      ),
    );
  }

  Widget nextItemButton() {
    return GestureDetector(
      onTap: () {
        if (progressBarController.progressBarListviewIndex.value ==
            progressBarController.progressBarItems.length) {
          // Handle completion
        }

        progressBarController.nextItemText();
        progressBarController.markAsRead(
            progressBarController.progressBarListviewIndex.value);
        if (progressBarController.progressBarListviewIndex.value >= 4) {
          progressBarController.smoothScroll();
        }
      },
      child: Container(
        width: 200.w,
        height: 20.h,
        decoration: BoxDecoration(
          color: Color(0xff556374),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Obx(
              () => Center(
            child: Text(
              progressBarController.progressBarListviewIndex.value == 0
                  ? "Start"
                  : progressBarController.progressBarListviewIndex.value ==
                  progressBarController.progressBarItems.length
                  ? "Finish"
                  : "Next Item",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget progressBar() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0.h),
      child: Container(
        height: 20.h,
        child: Obx(
              () => ListView.builder(
            controller: progressBarController.scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: progressBarController.progressBarItems.length,
            itemBuilder: (context, index) {
              final item = progressBarController.progressBarItems[index];
              final isRead = item['status'] == 'read';
              bool isLastItemExist =
                  progressBarController.progressBarItems.isNotEmpty &&
                      progressBarController.progressBarItems.length - 1 ==
                          index; //son eleman mı?

              final previousIsRead = index > 0
                  ? progressBarController.progressBarItems[index - 1]
              ['status'] ==
                  'read'
                  : false;
              final nextIsRead =
              index < progressBarController.progressBarItems.length - 1
                  ? progressBarController.progressBarItems[index + 1]
              ['status'] ==
                  'read'
                  : false;

              return Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0.h),
                decoration: BoxDecoration(
                  color: isRead ? Color(0xff353C45) : Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: previousIsRead ? Radius.zero : Radius.circular(30.r),
                    bottomLeft: previousIsRead ? Radius.zero : Radius.circular(30.r),
                    topRight: nextIsRead ? Radius.zero : Radius.circular(30.r),
                    bottomRight: nextIsRead ? Radius.zero : Radius.circular(30.r),
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        width:  progressBarController
                            .progressBarListviewIndex.value ==
                            index + 1
                            ?45.sp:35.w,
                        height:  progressBarController
                            .progressBarListviewIndex.value ==
                            index + 1
                            ?45.sp:35.h,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: progressBarController
                                .progressBarItems[index]['status'] ==
                                'read'
                                ? Color(0xff20E7BD)
                                : Color(0xff556374)),
                        child: Center(
                          child: isLastItemExist
                              ? Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                color: Color(0xff8998A7), fontSize:  progressBarController
                                .progressBarListviewIndex.value ==
                                index + 1
                                ?30.sp:20.sp),
                          )
                              : progressBarController
                              .progressBarItems[index + 1]
                          ['status'] ==
                              'read' &&
                              !isLastItemExist
                              ? Icon(
                            Icons.check,
                            color: Color(0xff00312D),
                            size: 25.sp,
                          )
                              : Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                fontSize:  progressBarController
                                    .progressBarListviewIndex.value ==
                                    index + 1
                                    ?30.sp:20.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff8998A7)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        item['name'],
                        style: TextStyle(
                          fontSize:  progressBarController
                              .progressBarListviewIndex.value ==
                              index + 1
                              ? 40.sp:30.sp,
                          color: progressBarController
                              .progressBarListviewIndex.value ==
                              index + 1
                              ? Color(0xff20E7BD) // Seçili ise
                              : Color(0xff8998A7),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
