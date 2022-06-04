import 'package:ebook_read/controller/theme_controller.dart';
import 'package:ebook_read/my_string.dart';
import 'package:ebook_read/routes/routes.dart';
import 'package:ebook_read/theme_utils.dart';
import 'package:ebook_read/view/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'language/localiztion.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'E-Library ',
            locale: Locale(GetStorage().read<String>("lang").toString()),
            translations: LocaliztionApp(),
            fallbackLocale: Locale(ene),
            theme: ThemeApp.light,
            darkTheme: ThemeApp.dark,
            themeMode:  ThemeController().themeDataGet,
            initialRoute: AppRoutes.welcome,
            onGenerateRoute: _getRoute,
            getPages: AppRoutes.routes,


          );

        }

    );
  }
  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/loginScreen') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => const LogIn(),
      fullscreenDialog: true,
    );
  }
}
