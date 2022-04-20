import 'package:vecul/ui/exports.dart';

class OnboardingViewModel extends BaseViewModel{
  int currentIndex = 0;

  void onPageChanged(int index){
    currentIndex = index;
    notifyListeners();
  }
}