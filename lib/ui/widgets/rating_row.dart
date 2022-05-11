import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class RatingRow extends StatelessWidget {
  final int numberOfTrips;
  final int rating;
  final double? iconSize;
  final double? textSize;
  final bool showRating;
  const RatingRow({
    Key? key,
    required this.numberOfTrips,
    this.rating = 0, this.iconSize, this.textSize, this.showRating = false,
  })  : assert(rating <= 5, 'Rating cannot be greater than 5'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(5, (index) {
          return Icon(
            Icons.star_border_rounded,
            color: index < rating
                ? AppColors.blue
                : const Color.fromARGB(81, 0, 63, 186),
            size: iconSize?? 15.r,
          );
        }),
        if(showRating)
          SizedBox(width: 5.w),
        if(showRating)
          Text(
            rating.toDouble().toString(),
            style: TextStyle(
              fontSize: textSize??10.sp,
              color: AppColors.blue00,
              fontFamily: sfPro,
              fontWeight: FontWeight.w500,
            ),
          ),
        Text(
          '($numberOfTrips trips)',
          style: TextStyle(
            fontSize: textSize??10.sp,
            color: AppColors.greyBD,
            fontFamily: sfPro,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}