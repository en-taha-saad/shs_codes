import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class HelpButton extends StatefulWidget {
  const HelpButton({Key? key}) : super(key: key);

  @override
  _HelpButtonState createState() => _HelpButtonState();
}

class _HelpButtonState extends State<HelpButton> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: "btn2",
      backgroundColor: generalColor,
      label: Row(
        children: [
          Icon(Icons.chat),
          SizedBox(
            width: 5,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: closeExtend ? 0 : 120,
            child: textWidget(
              stringText: closeExtend ? '' : 'طلب مساعدة',
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ],
      ),
      onPressed: () {},
    );
  }

  bool closeExtend = false;

  late Timer timer;
  int _start = 5;

  void startTimer() {
    _start = 5;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            closeExtend = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
