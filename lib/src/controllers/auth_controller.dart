import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  final RxBool isButtonEnabled = false.obs;

  void updateButtonState(TextEditingController phoneController) {
    String text = phoneController.text.replaceAll('-', '');

    if(text.length <= 3 && !text.startsWith('010')) {
      text = '010';
    } else if (!text.startsWith('010')) {
      text = '010$text';
    }
    if (text.length > 11) {
       text = text.substring(0,11);
    }

    String formattedText = _formatPhoneNumber(text);
    int cursorPosition = phoneController.selection.baseOffset + (formattedText.length - phoneController.text.length);

    phoneController.value = TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: cursorPosition.clamp(0, formattedText.length)),
    );

    isButtonEnabled.value = text.length == 11;
  }

  String _formatPhoneNumber(String text){
    if(text.length > 7){
      return '${text.substring(0,3)}-${text.substring(3, 7)} - ${text.substring(7)}';
    } else if (text.length > 3){
      return '${text.substring(0, 3)} - ${text.substring(3)}';
    }
    return text;
  }

  login(String phone, String password) async {
    /*Map body = await authProvider.login(phone, password);
    if(body['result'] == 'ok') {
      return true;
    }
    Get.snackbar('로그인 에러', body['message'],
      snackPosition: SnackPosition.BOTTOM);*/
    return false;
  }
}