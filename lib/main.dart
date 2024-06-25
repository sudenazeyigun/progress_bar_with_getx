import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progressbar_with_getx/view/progress_bar_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(932, 430),

      builder: (context, child) =>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Progress Bar Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProgressBarView(),
      ),
    );
  }
}
