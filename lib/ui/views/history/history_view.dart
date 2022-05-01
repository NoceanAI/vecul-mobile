import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/history_tile.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

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
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
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
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
              SizedBox(height: 5.h),
              const HistoryTile(),
            ],
          ),
        ],
      ),
    );
  }
}
