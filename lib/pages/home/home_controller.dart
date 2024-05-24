import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentSliderValue = 1.obs;

  var taxAmount = 0.obs;
  void tipIncrease() {
    taxAmount.value++;
  }

  void taxDecrease() {
    if (taxAmount.value == 0) {
    } else {
      taxAmount.value--;
    }
  }

  TextEditingController tipAmountController = TextEditingController();

  var tipAmount = '0'.obs;

  TextEditingController totalAmountController = TextEditingController();

  var totalAmount = '0'.obs;

  String equallyDividedValue() {
    try {
      var preEquallyDivided =
          (double.parse(totalAmount.value) / 100 * taxAmount.value) +
              double.parse(totalAmount.value) +
              double.parse(tipAmount.value);

      var equallyDivided = preEquallyDivided / currentSliderValue.value;

      return equallyDivided.toPrecision(2).toString();
    } catch (e) {
      return e.toString();
    }
  }
}
