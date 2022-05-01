import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/dashboard/dashboard_view.dart';
import 'package:vecul/ui/views/history/history_base_view.dart';
import 'package:vecul/ui/views/messages/messages_view.dart';

import 'index_view_model.dart';

class IndexView extends StatelessWidget {
  const IndexView({Key? key}) : super(key: key);

  Widget getCurrentScreen(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 2:
        return const MessagesView();
      case 3:
        return const HistoryBaseView();
      default:
        return const DashboardView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IndexViewModel>.reactive(
        viewModelBuilder: () => locator<IndexViewModel>(),
        builder: (context, model, child) {
          return Scaffold(body: getCurrentScreen(model.currentIndex),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: model.setIndex,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('home'.svg, color: getIconColor(model.currentIndex, 0),), label: 'add car'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('add_car'.svg, color: getIconColor(model.currentIndex, 1),), label: 'add car'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('messaging'.svg, color: getIconColor(model.currentIndex, 2)), label: 'messaging',),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset('notification'.svg,color: getIconColor(model.currentIndex, 3),),
                    label: 'notification'),
              ],
            ),
          );
        },
    );
  }

  Color getIconColor(int currentIndex, int iconIndex){
    return currentIndex == iconIndex? const Color(0xFF577BD1).withOpacity(0.8): AppColors.blue00;
  }
}
