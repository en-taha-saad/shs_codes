import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/modules/signin/bindings/signin_binding.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

final storedToken = GetStorage();
var savedToken = storedToken.read('token');
int statusCode = 100;
bool providers = false;
String? getImage;
String? getFirstName;
String? getSecondName;
String personalIdDrawer = '';

Future<dynamic> tokenIsCorrect() async {
  try {
    var headers = {
      'Authorization': 'Bearer $savedToken',
      'Accept': 'application/json'
    };
    var request = http.Request(
      'GET',
      Uri.parse('$url/profile'),
    );
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var data = jsonDecode(await response.stream.bytesToString())[0];
      print('response.statusCode = ${response.statusCode}');
      statusCode = response.statusCode;
      getFirstName = data["first_name"];
      getSecondName = data["second_name"];
      personalIdDrawer = data["personal_id"];
      print('getFirstName = $getFirstName');
      print('getFirstName = $getSecondName');
      print('getFirstName = $personalIdDrawer');
      if (data["image"] != null) {
        if (data["image"]["image_url"] != null) {
          print('data["image"]["image_url"] = ${data["image"]["image_url"]}');
          getImage = data["image"]["image_url"];
        }
      }
      savedToken = storedToken.read('token');
    } else {
      if (response.statusCode == 401) {
        print('response.statusCode = ${response.statusCode}');
        statusCode = response.statusCode;
        savedToken = null;
        storedToken.remove('token');
      }
    }
  } catch (e) {
    print('catch error = $e');
  }
}

void main() async {
  // await GetStorage.init();
  // storedToken.remove('token');
  // tokenIsCorrect();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => runApp(
      GetMaterialApp(
        theme: ThemeData(
          unselectedWidgetColor: generalColor,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [Locale('ar', 'AR')],
        builder: (context, widget) => ResponsiveWrapper.builder(
          widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        ),
        themeMode: ThemeMode.dark,
        title: "SHS helpline project",
        debugShowCheckedModeBanner: false,
        initialBinding: SigninBinding(),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
}

// #region restart app widget
// class RestartWidget extends StatefulWidget {
//   RestartWidget({this.child});
//   final Widget? child;
//   static void restartApp(BuildContext context) {
//     context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
//   }
//   @override
//   _RestartWidgetState createState() => _RestartWidgetState();
// }
// class _RestartWidgetState extends State<RestartWidget> {
//   Key key = UniqueKey();
//   void restartApp() {
//     setState(() {
//       key = UniqueKey();
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return KeyedSubtree(
//       key: key,
//       child: widget.child!,
//     );
//   }
// }
// #endregion
