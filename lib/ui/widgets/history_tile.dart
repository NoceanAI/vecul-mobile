
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColors.lightBlue.withAlpha(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 10.r),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.r),
              color: AppColors.white,
            ),
            padding: EdgeInsets.symmetric(horizontal: 9.75.r, vertical: 8.72.r),
            child: Text(
              'OE',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColors.blue00,
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(width: 14.r),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black33,
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '15th April 2022',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue00,
                  fontSize: 8.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '\$1,600',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.blue00,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}