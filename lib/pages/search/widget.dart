import 'package:app/common/entities/entities.dart';
import 'package:app/common/routes/names.dart';
import 'package:app/common/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'logic.dart';


class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 343.w,
          height: 54.h,
          margin: EdgeInsets.only(bottom: 0.h, top: 15.h),
          padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
          decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.all(Radius.circular(27.h)),
              border: Border.all(color: AppColors.primaryFourElementText)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 285.w,
                height: 54.h,
                margin: EdgeInsets.only(bottom: 5.h,top:5.h, left: 10.w),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Search your doctor ...",
                    hintStyle: TextStyle(
                      color: AppColors.primaryThreeElementText,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                  onChanged: (value) {
                    // controller.state.email.value = value;
                  },
                  maxLines: 1,
                  autocorrect: false, // 自动纠正
                  obscureText: false, // 隐藏输入内容, 密码框
                ),
              ),
              GestureDetector(child:SizedBox(
                width: 40.w,
                height: 25.h,
                child: Image.asset("assets/icons/search1.png",color: AppColors.primarySecondaryElementText,),
              ),onTap: (){
                var value = controller.text;
                if (value.isNotEmpty){
                  controller.clear();
                  FocusManager.instance.primaryFocus?.unfocus();
                  Logic(context: context).handleSearch(value);
                }

              },),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildListItem extends StatelessWidget {
  final DoctorData item;
  const BuildListItem({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(AppRoutes.Detail, arguments: item);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 15.h,bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
          boxShadow: [
            BoxShadow(
              blurRadius: 10, //阴影范围
              spreadRadius: 0.1, //阴影浓度
              color: Colors.grey.withOpacity(0.2), //阴影颜色
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 71.w,
              height: 71.w,
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.h)),
              ),
              child: Image.network("$SERVER_API_URL${item.avatar}"),
            ),
            Container(
              width: 230.w,
              margin: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "${item.name}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Container(
                    child: Text(
                      "${item.description}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width:14.w,
                        height: 14.w,
                        child: Image.asset(
                          "assets/icons/clock.png",
                          fit: BoxFit.fill,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Container(
                        child: Text(
                          "${item.workAt}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      SizedBox(
                        width:14.w,
                        height: 14.w,
                        child: Image.asset(
                          "assets/icons/position.png",
                          fit: BoxFit.fitHeight,
                          color: AppColors.primaryText,
                        ),
                      ),
                      Container(
                        child: Text(
                          "${item.position}",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

                ],),),
          ],
        ),
      ),
    );
  }
}


class DoctorItem extends StatelessWidget {
  final List<DoctorData> doctorList;
  const DoctorItem({super.key, required this.doctorList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 180.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          var item = doctorList.elementAt(index);
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppRoutes.Detail, arguments: item);
            },
            child: Container(
              width: 191.w,
              height: 180.w,
              padding: EdgeInsets.all(10.w),
              margin: EdgeInsets.only(
                  left: index == 0 ? 16.w : 0.w,
                  right: 16.w,
                  bottom: 15.h,
                  top: 10.h),
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                borderRadius: BorderRadius.all(Radius.circular(10.h)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10, //阴影范围
                    spreadRadius: 0.1, //阴影浓度
                    color: Colors.grey.withOpacity(0.2), //阴影颜色
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.network(
                      "$SERVER_API_URL${item.avatar}",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${item.name}",
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${item.departmentName}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        RatingStars(
                          axis: Axis.horizontal,
                          value: 4.0,
                          onValueChanged: (v) {

                          },
                          starCount: 5,
                          starSize: 12,
                          maxValue: 5,
                          starSpacing: 2,
                          maxValueVisibility: false,
                          valueLabelVisibility: false,
                          animationDuration: Duration(milliseconds: 1000),
                          starOffColor: const Color(0xffe7e8ea),
                          starColor: Colors.yellow,
                          angle: 0,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Experience",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.primaryThreeElementText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "${item.experience} Years",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],),
                        SizedBox(
                          height: 5.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Patients",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.primaryThreeElementText,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                "${item.patient}",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],),
                      ],),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}