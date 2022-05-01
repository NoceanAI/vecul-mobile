import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/dismiss_keyboard.dart';
import 'package:vecul/ui/widgets/vehicle_info_card.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  final List<String> vehicleNames = const [
    'bmw_logo',
    'ford_logo',
    'lexus_logo',
    'tesla_logo',
    'hyundai_logo',
    'honda_logo',
  ];

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder borderOutline = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.blue00),
      borderRadius: BorderRadius.circular(5.r),
    );
    return DismissKeyboard(
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 60.r,
          height: 60.r,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {},
            child: Icon(
              CupertinoIcons.map,
              color: AppColors.blue00,
              size: 31.r,
            ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 72.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            child: Card(
                              elevation: 0.7,
                              child: Container(
                                height: 35.r,
                                width: 35.r,
                                padding: EdgeInsets.all(7.8.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),

                                ///Replace with SVG
                                child: Image.asset('menu'.png),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              locator<NavigatorService>().pushNamed(profileView);
                            },
                            child: CircleAvatar(
                              radius: 19.r,
                              backgroundImage: AssetImage('user'.png),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 19.h),
                      Text(
                        'Let\'s help you\nchoose a car',
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.black4F,
                            fontFamily: sfPro,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 19.h),
                      TextFormField(
                        textInputAction: TextInputAction.search,
                        cursorColor: AppColors.blue00,
                        style: TextStyle(
                          fontFamily: sfPro,
                          color: AppColors.black33,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            CupertinoIcons.search,
                            color: AppColors.blue00,
                          ),
                          prefixIconColor: AppColors.blue00,

                          ///TODO: Replace with SVG
                          // suffixIcon: SvgPicture.asset('filter'.svg),
                          suffixIcon: const RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              CupertinoIcons.slider_horizontal_3,
                              color: AppColors.blue00,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.r, horizontal: 16.r),
                          border: borderOutline,
                          enabledBorder: borderOutline,
                          focusedBorder: borderOutline,
                          hintText: 'search',
                          hintStyle: TextStyle(
                            fontFamily: sfPro,
                            color: AppColors.greyE0,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 19.h),
                      SizedBox(
                        height: 64.r,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                height: 64.r,
                                width: 64.r,
                                padding: EdgeInsets.all(10.r),
                                child: Image.asset(
                                    vehicleNames[index % vehicleNames.length]
                                        .png),
                              ),
                            );
                          },
                          itemCount: 10,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(width: 10.w),
                        ),
                      ),
                      SizedBox(height: 34.h),
                    ],
                  ),
                )
              ];
            },
            body: ListView.separated(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.only(bottom: 70.h),
              itemCount: 5,
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 20.h,
              ),
              itemBuilder: (BuildContext context, int index) =>
                  const VehicleInfoCard(),
            ),
          ),
        ),
      ),
    );
  }
}
