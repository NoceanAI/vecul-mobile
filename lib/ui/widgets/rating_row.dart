import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class RatingRow extends StatelessWidget {
  final int numberOfTrips;
  final int rating;
  const RatingRow({
    Key? key,
    required this.numberOfTrips,
    this.rating = 0,
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
            size: 15.r,
          );
        }),
        Text(
          '(23 trips)',
          style: TextStyle(
            fontSize: 10.sp,
            color: AppColors.greyBD,
            fontFamily: sfPro,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}