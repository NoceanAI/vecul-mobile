import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class ActivityTile extends StatelessWidget {
  final String? text;
  const ActivityTile({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: AppColors.lightBlue.withAlpha(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 18.r),
      child: Row(
        children: [
          Icon(Icons.folder_outlined, size: 20.r,),
          SizedBox(width: 18.r),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text??'A booking is available on your honda civic 2019',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black33,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 5.h),
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
          ),
        ],
      ),
    );
  }
}