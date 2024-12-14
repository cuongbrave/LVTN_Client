import 'package:b2004772/common/models/course_entities.dart';
import 'package:b2004772/common/utils/app_colors.dart';
import 'package:b2004772/common/widgets/text_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/question_entities.dart';
import '../models/test_entities.dart';
import '../utils/image_res.dart';

BoxDecoration appBoxShadow(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? boxBorder}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: boxBorder,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: sR,
          blurRadius: bR,
          offset: const Offset(0, 1),
        )
      ]);
}

BoxDecoration appBoxShadowWithRadius(
    {Color color = AppColors.primaryElement,
    double radius = 15,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.h),
        topRight: Radius.circular(20.h),
      ),
      border: border,
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.red.withOpacity(0.6),
          spreadRadius: sR,
          blurRadius: bR,
          offset: Offset(0, 1),
        )
      ]);
}

BoxDecoration appBoxDecorationTextField(
    {Color color = AppColors.primaryBackground,
    double radius = 15,
    Color borderColor = AppColors.primaryFourElementText}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: color,
      border: Border.all(color: borderColor));
}

//app bar with image
class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;

  const AppBoxDecorationImage(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.imagePath = ImageRes.profile,

      });

  @override
  Widget build(BuildContext context) {
    //print("my appbar");
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitHeight,
            //lay img từ server về
            image: NetworkImage(imagePath)),
        borderRadius: BorderRadius.circular(20.w),
      ),
    );
  }
}

class AppBoxDecorationImageVer2 extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit boxFit;
  final Function()? func;

  final CourseItem? courseItem;

  const AppBoxDecorationImageVer2(
      {super.key,
      this.width = 40,
      this.height = 40,
      this.imagePath = ImageRes.profile,
        this.boxFit = BoxFit.fitHeight,
        this.courseItem,
        this.func
      });

  @override
  Widget build(BuildContext context) {
    //print("my appbar");
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: boxFit,
              //lay img từ server về
              image: Image.asset(imagePath).image),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: courseItem==null?Container():Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, bottom: 40.h),
              child: Text10Normal(text: courseItem!.name!,fontWeight: FontWeight.bold, color: AppColors.primaryElement,),
            )
          ],
        ),
      ),


    );
  }
}
//show luoi Test Items
class AppBoxDecorationImageVer3 extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit boxFit;
  final Function()? func;

  final TestItem? testItem;

  const AppBoxDecorationImageVer3(
      {super.key,
        this.width = 40,
        this.height = 40,
        this.imagePath = ImageRes.profile,
        this.boxFit = BoxFit.fitHeight,
        this.testItem,
        this.func
      });

  @override
  Widget build(BuildContext context) {
    //print("my appbar");
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: boxFit,
              //lay img từ server về
              image: Image.asset(imagePath).image),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: testItem==null?Container():Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w,),
              child: Text10Normal(text: testItem!.name!,fontWeight: FontWeight.bold, color: AppColors.primaryElement,),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, bottom: 30.h),
              child: Text10Normal(text: testItem!.description!,fontWeight: FontWeight.bold, color: AppColors.primaryElement,),
            )
          ],
        ),
      ),


    );
  }
}


//show luoi QuestionListForTest Items
class AppBoxDecorationImageVer4 extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final BoxFit boxFit;
  final Function()? func;

  final QuestionItem? questionItem;

  const AppBoxDecorationImageVer4(
      {super.key,
        this.width = 40,
        this.height = 40,
        this.imagePath = ImageRes.profile,
        this.boxFit = BoxFit.fitHeight,
        this.questionItem,
        this.func
      });

  @override
  Widget build(BuildContext context) {
    //print("my appbar");
    return GestureDetector(
      onTap: func,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: boxFit,
              //lay img từ server về
              image: Image.asset(imagePath).image),
          borderRadius: BorderRadius.circular(20.w),
        ),
        child: questionItem==null?Container():Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w, bottom: 40.h),
              child: Text10Normal(text: questionItem!.question_text!,fontWeight: FontWeight.bold, color: AppColors.primaryElement,),
            )
          ],
        ),
      ),


    );
  }
}


//BackgroundDecoration

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;

  const BackgroundDecoration({super.key,
    required this.child,
    this.showGradient=false // true --> hidden background color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(
          decoration: BoxDecoration(
            color: showGradient?null:AppColors.primaryElementBg,
          ),
          child: CustomPaint(
            painter: BackgroundPainter(),
          ),
        )),
        Positioned.fill(child: SafeArea(child: child)),
        //Column()
      ],
    );
  }
}

class BackgroundPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width*0.2, 0);
    path.lineTo(0, size.height*0.4);
    path.close();

    final path1 = Path();
    path1.moveTo(size.width, 0);
    path1.lineTo(size.width*0.8, 0);
    path1.lineTo(size.width*0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
    throw UnimplementedError();
  }

}
