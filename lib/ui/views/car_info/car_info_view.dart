import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/core/models/car.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/page_indicator.dart';
import 'package:vecul/ui/widgets/rating_row.dart';
import 'package:share_plus/share_plus.dart';

class CarInfoView extends StatelessWidget {
  final Car car;
  const CarInfoView({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(car.id);
    const divider = Divider(height: 0, color: AppColors.whiteF2, thickness: 1);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 55.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Row(
              children: [
                IconButton(
                  splashRadius: 20.r,
                  icon: Icon(
                    CupertinoIcons.arrow_left,
                    color: const Color(0xFF0D1C2E),
                    size: 25.r,
                  ),
                  onPressed: locator<NavigatorService>().goBack,
                ),
                const Spacer(),
                IconButton(
                  splashRadius: 20.r,
                  icon: Icon(
                    Icons.share_outlined,
                    color: const Color(0xFF0D1C2E),
                    size: 20.r,
                  ),
                  onPressed: () {
                    Share.share(
                      car.toJson().toString(),
                    );
                  },
                ),
                SizedBox(width: 20.w),
                Hero(
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
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(height: 10.h),
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.greyE0,
                  ),
                  height: 206.h,
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        bottom: 10.r,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PageIndicator(
                              isActive: true,
                              radius: 6.r,
                              inactiveColor: Colors.white,
                            ),
                            SizedBox(width: 2.r),
                            PageIndicator(
                              isActive: false,
                              radius: 6.r,
                              inactiveColor: Colors.white,
                            ),
                            SizedBox(width: 2.r),
                            PageIndicator(
                              isActive: false,
                              radius: 6.r,
                              inactiveColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          color: AppColors.greyBD,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '${car.carDetail.make} ${car.carDetail.model} ${car.carDetail.carYear}',
                        style: TextStyle(
                          color: AppColors.black33,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      RatingRow(
                          numberOfTrips: 23,
                          rating: 4,
                          iconSize: 18.r,
                          textSize: 14.sp),
                      SizedBox(height: 18.h),
                      Text(
                        'Trip Dates',
                        style: TextStyle(
                          color: AppColors.greyBD,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
                divider,
                SizedBox(height: 21.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today_outlined, size: 15.r),
                      SizedBox(width: 11.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tue, 19th May, 09.00AM',
                            style: TextStyle(
                              color: AppColors.greyF7,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'Thur, 14th June, 12.00PM',
                            style: TextStyle(
                              color: AppColors.greyF7,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.blue00,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 21.h),
                divider,
                SizedBox(height: 17.h),
                _buildHeader('Pick up'),
                SizedBox(height: 5.h),
                divider,
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.location, size: 15.r),
                      SizedBox(width: 11.w),
                      Text(
                        car.carDetail.pickUpPoint,
                        style: TextStyle(
                          color: AppColors.greyF7,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.blue00,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                divider,
                SizedBox(height: 17.h),
                _buildHeader('Return Point'),
                SizedBox(height: 5.h),
                divider,
                SizedBox(height: 18.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.location, size: 15.r),
                      SizedBox(width: 11.w),
                      Text(
                        car.carDetail.returnPoint,
                        style: TextStyle(
                          color: AppColors.greyF7,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Text(
                          'Edit',
                          style: TextStyle(
                            color: AppColors.blue00,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),
                divider,
                SizedBox(height: 17.h),
                _buildHeader('Trip Savings'),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(0, 63, 186, 0.05),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
                  margin: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.creditcard,
                        size: 15.r,
                      ),
                      SizedBox(width: 11.w),
                      Text(
                        '5+ day discount',
                        style: TextStyle(
                          color: AppColors.black4F,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'NGN3000.00',
                        style: TextStyle(
                          color: AppColors.blue00,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                _buildHeader('Distance'),
                SizedBox(height: 5.h),
                divider,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        '200 km',
                        style: TextStyle(
                          color: AppColors.black33,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'NGN200 fee for each additional kilometre',
                        style: TextStyle(
                          color: AppColors.greyBD,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                divider,
                SizedBox(height: 17.h),
                _buildHeader('Car Basics'),
                SizedBox(height: 5.h),
                divider,
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Image.asset('seat'.png, width: 12.r, height: 12.r),
                          SizedBox(height: 8.h),
                          Text(
                            '2 seats',
                            style: TextStyle(
                              color: AppColors.greyBD,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        children: [
                          Image.asset('gas_station'.png,
                              width: 12.r, height: 12.r),
                          SizedBox(height: 8.h),
                          Text(
                            'Gas',
                            style: TextStyle(
                              color: AppColors.greyBD,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                divider,
                SizedBox(height: 16.w),
                _buildHeader('Car Features'),
                SizedBox(height: 5.h),
                divider,
                SizedBox(height: 15.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.bluetooth, size: 18.r),
                    ],
                  ),
                ),
                SizedBox(height: 15.h),
                divider,
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      color: AppColors.grey82,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                 _DescriptionCard(
                  description: car.descripiton,
                  limit: 150,
                ),
                SizedBox(height: 17.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Text(
                    'Ratings',
                    style: TextStyle(
                      color: AppColors.grey82,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                divider,
                SizedBox(height: 10.h),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26.w),
                    child: RatingRow(
                        numberOfTrips: 23,
                        iconSize: 20.r,
                        textSize: 15.sp,
                        showRating: true,
                        rating: 4)),
                SizedBox(height: 10.h),
                divider,
                SizedBox(height: 20.h),
                _buildHeader('Reviews'),
                SizedBox(height:10.h),
                SizedBox(
                  height: 160.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const ReviewCard();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10.w);
                      },
                      itemCount: 5),
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyE0,
              offset: Offset(0, -2),
              spreadRadius: 2,
              blurRadius: 10
            ),
          ]
        ),
        height: 84.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'NGN700 ',
                        style: TextStyle(
                          color: AppColors.greyBD,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        'NGN500/day',
                        style: TextStyle(
                          color: AppColors.black33,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'NGN1000 est. total',
                    style: TextStyle(
                      color: AppColors.blue00,
                      fontSize: 8.sp,
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.r, vertical: 8.5.r),
                    backgroundColor: AppColors.blue00,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    )),
                onPressed: () {},
                child: Text(
                  'Book',
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    fontFamily: sfUI,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.greyBD,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _DescriptionCard extends StatefulWidget {
  final String description;
  final int limit;
  const _DescriptionCard(
      {Key? key, required this.description, this.limit = 100})
      : super(key: key);

  @override
  State<_DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<_DescriptionCard> {
  bool _showAll = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 63, 186, 0.05),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 15.r),
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      child: Text.rich(
        TextSpan(
          text: !_showAll && widget.description.length > widget.limit
              ? widget.description.substring(0, widget.limit) + '... '
              : widget.description + ' ',
          children: [
            if (widget.description.length > widget.limit)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _showAll = !_showAll;
                    });
                  },
                  child: Text(
                    _showAll ? 'Show less' : 'Read more',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: AppColors.blue00,
                    ),
                  ),
                ),
              ),
          ],
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.grey82,
          ),
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 213.r,
      height: 159.r,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(0, 63, 186, 0.05),
        borderRadius: BorderRadius.circular(5.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 21.r, vertical: 19.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('user'.png),
            radius: 16.r,
          ),
          SizedBox(height: 5.h),
          Text(
            'Mike Pence',
            style: TextStyle(
              color: AppColors.black33,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            children: [
              ...List.generate(5, (index) {
                return Icon(
                  Icons.star_border_rounded,
                  color: index < 4
                      ? AppColors.blue
                      : const Color.fromARGB(81, 0, 63, 186),
                  size: 10.r,
                );
              }),
              Text(
                '9th May, 2022',
                style: TextStyle(
                  color: AppColors.black33,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'Great! looking forward to next time, ride was comfortable',
            style: TextStyle(
              color: AppColors.grey82,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
