import 'package:flutter/material.dart';
import 'package:vecul/core/models/car.dart';
import 'package:vecul/ui/exports.dart';

import 'rating_row.dart';

class CarInfoCard extends StatelessWidget {
  final Car car;
  const CarInfoCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        locator<NavigatorService>().pushNamed(carInfoView, arguments: car);
      },
      child: Card(
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 326.r,
              height: 168.r,
              padding: EdgeInsets.only(right: 15.r, top: 10.r),
              decoration: BoxDecoration(
                color: AppColors.greyE8,
                image: DecorationImage(
                  image: AssetImage('bentayga_hybrid'.jpg),
                  fit: BoxFit.cover,
                 ),
              ),
              alignment: Alignment.topRight,
              child: Hero(
                tag: car.id,
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
                              '${car.carDetail.make} ${car.carDetail.model} ${car.carDetail.carYear}',
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
                            '₦${car.price}/day',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: AppColors.grey82,
                              fontFamily: sfPro,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '₦${(car.price * 1.3)~/1}',
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
      ),
    );
  }
}
