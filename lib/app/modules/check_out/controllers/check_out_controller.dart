import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CheckOutController extends GetxController {
  RxInt currentStep = 0.obs;

  RxBool shippingAndBillingSame = true.obs;

  GlobalKey shippingAddressKey=GlobalKey(debugLabel: "s");
  GlobalKey billingAddressKey=GlobalKey(debugLabel: "b");

  RxInt setShipingMethod=0.obs;

  void changePage() {
    if (currentStep.value == 0) {
      if (shippingAndBillingSame.value) {
        currentStep.value = 2;
      } else {
        currentStep.value = 1;
      }
    }else{

      currentStep.value =currentStep.value + 1;
    }
  }
}
