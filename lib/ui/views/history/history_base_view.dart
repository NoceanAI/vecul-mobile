import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/history/history_view.dart';
import 'package:vecul/ui/views/index/index_view_model.dart';

import 'activity_view.dart';

class HistoryBaseView extends StatelessWidget {
  const HistoryBaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            splashRadius: 20.r,
            icon: Icon(
              CupertinoIcons.arrow_left,
              color: const Color(0xFF0D1C2E),
              size: 25.r,
            ),
            onPressed:(){ locator<IndexViewModel>().setIndex(0);},
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: 20.h),
            TabBar(
              labelStyle: TextStyle(
                fontFamily: sfPro,
                fontSize: 17.sp,
                color: AppColors.black33,
              ),
              indicatorWeight: 3.h,
              indicatorColor: AppColors.blue00,
              labelColor: AppColors.black33,
              unselectedLabelColor: Colors.black.withOpacity(0.1),
              tabs: const [
                Tab(text: 'History'),
                Tab(text: 'Activity'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HistoryView(),
                  ActivityView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
