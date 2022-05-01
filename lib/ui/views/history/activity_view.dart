import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/activity_tile.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 27.h),
              Padding(
                padding: EdgeInsets.only(left: 17.w),
                child: Text(
                  'April, 2022',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightBlue.withAlpha(82),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const ActivityTile(),
              SizedBox(height: 5.h),
              const ActivityTile(
                text: 'Payment have been made from obom ebuka, check payment history',
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 17.w),
                child: Text(
                  'May, 2022',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.lightBlue.withAlpha(82),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              const ActivityTile(
                text: 'Hurray! Your personal account has been upgraded. boss level activated',
              ),
              SizedBox(height: 5.h),
              const ActivityTile(),
              SizedBox(height: 5.h),
              const ActivityTile(
                text: 'Payment have been made from obom ebuka, check payment history',
              ),
              SizedBox(height: 5.h),
              const ActivityTile(
                text: 'Hurray! Your personal account has been upgraded. boss level activated',
              ),
              SizedBox(height: 5.h),
              const ActivityTile(),
              SizedBox(height: 5.h),
              const ActivityTile(),
              SizedBox(height: 5.h),
              const ActivityTile(),
              SizedBox(height: 5.h),
              const ActivityTile(),
            ],
          ),
        ],
      ),
    );
  }
}


