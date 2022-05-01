
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';

class ChatBubble extends StatelessWidget {
  final bool isSender;
  const ChatBubble({Key? key, required this.isSender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: isSender ? TextDirection.rtl : null,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isSender)
              CircleAvatar(
                radius: 11.r,
              ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 240.w,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: isSender ? AppColors.blue00 : AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.r,
                      spreadRadius: 0,
                      color: const Color.fromARGB(128, 210, 210, 210),
                      offset: Offset(0, 2.r),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.all(20.r),
                child: Text(
                  'Hi Claudio! Please select your product.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: isSender ? AppColors.white : AppColors.greyAE,
                  ),
                ),
              ),
            ),
          ],
        ),
        isSender ? SizedBox(width: 24.w) : const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '9:55',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.greyAE,
              ),
            ),
          ],
        ),
      ],
    );
  }
}