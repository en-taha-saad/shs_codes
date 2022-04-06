import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/routes/app_pages.dart';
import 'package:shs108private/main.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashView>
    with TickerProviderStateMixin {
  late Animation opacity;
  late AnimationController animationController;
  late Animation heartAnimation;
  late AnimationController heartAnimationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: Duration(milliseconds: 4000),
      vsync: this,
    );
    opacity = Tween<double>(begin: 1.0, end: 0.0).animate(animationController)
      ..addListener(() {});
    animationController.forward().then(
      (_) {
        if (savedToken != null && savedToken != '') {
          animationController.reverse();
          if (statusCode == 200) {
            if (providers) {
              Get.offAllNamed(Routes.DOCTOR_DASHBOARD);
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          } else {
            if (providers) {
              Get.offAllNamed(Routes.SIGNIN);
            } else {
              Get.offAllNamed(Routes.HOME);
            }
          }
        } else {
          if (providers) {
            Get.offAllNamed(Routes.SIGNIN);
          } else {
            Get.offAllNamed(Routes.HOME);
          }
        }
      },
    );
    heartAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    heartAnimation = Tween(
      begin: 150.0,
      end: 170.0,
    ).animate(
      CurvedAnimation(
        curve: Curves.slowMiddle,
        parent: heartAnimationController,
      ),
    );
    heartAnimationController.addStatusListener(
      (AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          heartAnimationController.repeat();
        }
      },
    );
    heartAnimationController.forward();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    animationController.dispose();
    heartAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Image.asset(
              headerIMG,
              fit: BoxFit.cover,
              height: 60,
              width: MediaQuery.of(context).size.width,
            ),
            Align(
              alignment: Alignment(0.0, -0.5),
              child: AnimatedBuilder(
                animation: heartAnimationController,
                builder: (_, child) {
                  return Container(
                    child: Image.asset(
                      faviconIMG,
                      fit: BoxFit.cover,
                      height: heartAnimation.value,
                      width: heartAnimation.value,
                    ),
                  );
                },
              ),
            ),
            Column(
              children: <Widget>[
                SizedBox(height: 60),
                Image.asset(
                  titleIMG,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 230,
                ),
                Spacer(flex: 2),
                Image.asset(
                  subtitleIMG,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 230,
                ),
                textWidget(
                  stringText: 'Smart Healthcare, Better Life',
                  fontSize: 20,
                  color: Color(0XFF003192),
                ),
                Spacer(flex: 3),
                Center(
                  child: Image.asset(
                    logo1IMG,
                    fit: BoxFit.cover,
                    height: 50,
                    width: 150,
                  ),
                ),
                SizedBox(height: 20),
                if (!providers)
                  textWidget(
                    stringText: 'SHS Mobile Release 2.2.1',
                    fontSize: 15,
                    color: Color(0XFF003192),
                  ),
                if (providers)
                  textWidget(
                    stringText: 'SHS+ Mobile Release 2.2.1',
                    fontSize: 15,
                    color: Color(0XFF003192),
                  ),
                Image.asset(
                  footerIMG,
                  fit: BoxFit.cover,
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
