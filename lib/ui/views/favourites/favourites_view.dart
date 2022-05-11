import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/car_info_card.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 58.h),
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    splashRadius: 20.r,
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 25.r,
                    ),
                    onPressed: locator<NavigatorService>().goBack,
                  ),
                ),
                Center(
                  child: Text(
                    'Favourites',
                    style: TextStyle(
                      color: AppColors.black4F,
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 25),
                    // VehicleInfoCard(imageUrl: 'bentayga_hybrid'.jpg, rate: 1000, carName: 'Bentayga Hybrid',),
                    // SizedBox(height: 29.h),
                    // VehicleInfoCard(imageUrl: 'car_1'.jpg, carName: 'Genesis G70', rate: 3000,),
                    // SizedBox(height: 29.h),
                    // VehicleInfoCard(imageUrl: 'bentayga_hybrid'.jpg, rate: 500, carName: 'Bentayga',),
                    // SizedBox(height: 29.h),
                    // VehicleInfoCard(imageUrl: 'car_0'.jpeg, carName: 'Audi', rate: 5000,),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
