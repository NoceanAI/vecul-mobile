import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class ChatCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String? title;
  final bool read;
  const ChatCard(
      {Key? key,
      this.imageUrl,
      required this.name,
      this.title,
      this.read = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        locator<NavigatorService>().pushNamed(chatView);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.h),
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Image.asset(
              imageUrl ?? 'user'.png,
              height: 58.r,
              width: 58.r,
            ),
            SizedBox(width: 14.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.black33,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  title ?? 'Landlord',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.greyAE,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}