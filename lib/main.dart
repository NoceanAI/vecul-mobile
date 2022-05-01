import 'package:flutter/material.dart';
import 'package:vecul/core/services/navigator_service.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/splash/splash_view.dart';

void main(){
  setupLocator();
  runApp(const Vecul());
}

class Vecul extends StatelessWidget {
  const Vecul({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context) {
        return MaterialApp(
          title: 'Vecul',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routes.onGenerateRoute,
          navigatorKey: locator<NavigatorService>().key,
          theme: ThemeData(
            fontFamily: sfPro,
            scaffoldBackgroundColor: Colors.white,
          ),
          home:  const SplashView(),
        );
      },
      designSize: const Size(375, 812),
    );
  }
}
