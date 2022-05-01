import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/widgets/chat_bubble.dart';
import 'package:vecul/ui/widgets/dismiss_keyboard.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const border = InputBorder.none;
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            splashRadius: 20.r,
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: AppColors.greyAE,
              size: 25.r,
            ),
            onPressed: locator<NavigatorService>().goBack,
          ),
          title: Text(
            'Paolo Cellar',
            style: TextStyle(
              fontSize: 23.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blue00,
            ),
          ),
          centerTitle: true,
          actions: [
            Icon(
              Icons.more_vert,
              color: AppColors.greyAE,
              size: 25.r,
            ),
            SizedBox(width: 20.w),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(
                    top: 24.h, left: 20.w, right: 20.w, bottom: 20.h),
                itemBuilder: (context, index) {
                  return ChatBubble(isSender: index % 2 == 0);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 24.h);
                },
                itemCount: 10,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 100.h,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: border,
                        enabledBorder: border,

                        hintText: 'Type your message',
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.greyAE,
                          letterSpacing: 0.2,
                        ),
                        // focusedBorder: border.copyWith(border),
                        prefixIcon: const Icon(
                          CupertinoIcons.smiley,
                          color: AppColors.greyAE,
                        ),
                        suffixIcon: CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                CupertinoIcons.add_circled_solid,
                                color: AppColors.greyAE,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Send',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.greyAE,
                                  letterSpacing: 0.2,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (MediaQuery.of(context).viewInsets.bottom == 0)
              SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
