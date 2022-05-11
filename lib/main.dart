import 'package:flutter/material.dart';
import 'package:vecul/ui/exports.dart';
import 'package:vecul/ui/views/splash/splash_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async{
  await dotenv.load(fileName: '.env');
  setupLocator();
  runApp(const Vecul());
}

class Vecul extends StatelessWidget {
  const Vecul({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
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
          designSize: orientation  == Orientation.portrait?const Size(375, 812):Size(812, 375),
        );
      }
    );
  }
}
