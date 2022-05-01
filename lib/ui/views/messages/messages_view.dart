import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/index/index_view_model.dart';
import 'package:vecul/ui/widgets/chat_card.dart';
import 'package:vecul/ui/widgets/dismiss_keyboard.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.blue00),
      borderRadius: BorderRadius.circular(5.r),
    );
    return DismissKeyboard(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            splashRadius: 20.r,
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: AppColors.greyAE,
              size: 25.r,
            ),
            onPressed:(){ locator<IndexViewModel>().setIndex(0);},
          ),
          actions: [
            Icon(
              Icons.more_vert,
              color: AppColors.greyAE,
              size: 25.r,
            ),
            SizedBox(width: 20.w),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              TextField(
                cursorColor: AppColors.lightBlue,
                decoration: InputDecoration(
                  hintText: 'Search Chats',
                  hintStyle: const TextStyle(
                    color: AppColors.lightBlue,
                    fontWeight: FontWeight.w300,
                  ),
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    color: AppColors.lightBlue,
                    size: 22.r,
                  ),
                  border: border,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(top: 24.h),
                  itemBuilder: (context, index) {
                    return const ChatCard(name: 'James');
                  },
                  itemCount: 10,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(height: 10.h);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
