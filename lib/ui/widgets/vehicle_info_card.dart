import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

import 'rating_row.dart';

class VehicleInfoCard extends StatelessWidget {
  const VehicleInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 326.r,
            height: 168.r,
            color: AppColors.greyE8,
            padding: EdgeInsets.only(right: 15.r, top: 10.r),
            alignment: Alignment.topRight,
            child: Card(
              shape: const CircleBorder(),
              child: SizedBox(
                height: 26.r,
                width: 26.r,
                child: Icon(
                  Icons.favorite,
                  color: AppColors.red,
                  size: 15.r,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding:
            EdgeInsets.symmetric(horizontal: 13.r, vertical: 10.r),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Range Rover Sports 2015',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontFamily: sfPro,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 3.h),
                          const RatingRow(
                            numberOfTrips: 24,
                            rating: 4,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 30.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '₦500/day',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: AppColors.grey82,
                            fontFamily: sfPro,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '₦700',
                          style: TextStyle(
                            fontSize: 15.sp,
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.greyE0,
                            fontFamily: sfPro,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
