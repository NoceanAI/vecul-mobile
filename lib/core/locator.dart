import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vecul/ui/views/authentication/auth_view_model.dart';
import 'package:vecul/ui/views/dashboard/dashboard_view_model.dart';
import 'package:vecul/ui/views/index/index_view_model.dart';
import 'package:vecul/ui/views/onboarding/onboarding_view_model.dart';
import 'networking/network_helper.dart';
import 'services/navigator_service.dart';
import 'services/dialog_service.dart';

final locator = GetIt.instance;
setupLocator(){
  ///Async dependencies
  locator.registerSingletonAsync<SharedPreferences>(() => SharedPreferences.getInstance());

  ///Services
  locator.registerLazySingleton<NavigatorService>(() => NavigatorService());
  locator.registerLazySingleton<DialogService>(() => DialogService());

  ///Networking
  locator.registerLazySingleton<NetworkHelper>(() => NetworkHelper());

  ///Permanent ViewModels
  locator.registerLazySingleton<OnboardingViewModel>(() => OnboardingViewModel());
  locator.registerSingleton<AuthViewModel>(AuthViewModel());
  locator.registerLazySingleton<IndexViewModel>(() => IndexViewModel());
  locator.registerLazySingleton<DashboardViewModel>(() => DashboardViewModel());
}