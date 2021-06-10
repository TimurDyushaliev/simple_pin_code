import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:simple_pin_code/controllers/pin_code_controller.dart';
import 'package:simple_pin_code/view/widgets/pin_code_numbers.dart';

class PinCodePage extends StatelessWidget {
  final PinCodeController pinCodeController = Get.put(PinCodeController());

  List<bool> get isPinCodeEdited => pinCodeController.isPinCodeEdited;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Get.size.height * 0.06),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: Get.size.width * 0.04),
                child: SvgPicture.asset('assets/icons/help.svg'),
              )),
          SizedBox(height: Get.size.height * 0.085),
          Text(
            'Please enter PIN code',
            textScaleFactor: 1,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: Get.size.height * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              4,
              (index) => Obx(
                () => Container(
                  height: 28,
                  width: 28,
                  margin:
                      EdgeInsets.symmetric(horizontal: Get.size.width * 0.03),
                  decoration: BoxDecoration(
                    color: isPinCodeEdited[index]
                        ? Colors.green
                        : Colors.transparent,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black.withOpacity(0.12)),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          PinCodeNumbers(
            onNumberPressed: (number) {
              pinCodeController.increase();
            },
            onBackspacePressed: () {
              pinCodeController.decrease();
            },
          ),
          SizedBox(height: Get.size.height * 0.05),
        ],
      ),
    );
  }
}
