import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

class SigninController extends GetxController {
  ButtonState state = ButtonState.idle;
  bool? success;

  onPressedSignIn() {
    print('state = $state');
    switch (state) {
      case ButtonState.idle:
        success = true;
        state = ButtonState.loading;
        Future.delayed(Duration(seconds: 1), () {
          if (success == true) {
            state = ButtonState.success;
            Future.delayed(Duration(seconds: 1), () {
              print('going to another screen');
            });
            update();
          } else {
            state = ButtonState.fail;
            update();
          }
        });
        update();
        break;

      case ButtonState.loading:
        break;
      case ButtonState.success:
        state = ButtonState.idle;
        update();
        break;
      case ButtonState.fail:
        state = ButtonState.idle;
        update();
        break;
    }
    update();
  }

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  // ignore: unnecessary_overrides
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
