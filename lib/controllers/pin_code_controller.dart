import 'package:get/get.dart';

class PinCodeController extends GetxController {
  RxList<bool> isPinCodeEdited = <bool>[false, false, false, false].obs;

  void increase() {
    if (!isPinCodeEdited[0]) {
      isPinCodeEdited[0] = true;
      return;
    }
    if (!isPinCodeEdited[1]) {
      isPinCodeEdited[1] = true;
      return;
    }
    if (!isPinCodeEdited[2]) {
      isPinCodeEdited[2] = true;
      return;
    }
    if (!isPinCodeEdited[3]) {
      isPinCodeEdited[3] = true;
      return;
    }
  }

  void decrease() {
    if (isPinCodeEdited[3]) {
      isPinCodeEdited[3] = false;
      return;
    }
      if (isPinCodeEdited[2]) {
      isPinCodeEdited[2] = false;
      return;
    }
      if (isPinCodeEdited[1]) {
      isPinCodeEdited[1] = false;
      return;
    }
      if (isPinCodeEdited[0]) {
      isPinCodeEdited[0] = false;
      return;
    }
  }
}
