import 'package:bring_me_bd/app/core/constents/colors.dart';
import 'package:bring_me_bd/app/modules/check_out/widget/address_form.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/check_out_controller.dart';

class CheckOutView extends GetView<CheckOutController> {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Out'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Obx(
              () => EasyStepper(
                disableScroll: true,
                finishedStepBackgroundColor: Colors.transparent,
                direction: Axis.horizontal,
                activeStep: controller.currentStep.value,
                activeStepTextColor: Colors.black87,
                finishedStepTextColor: Colors.black87,
                internalPadding: 0,
                showLoadingAnimation: false,
                stepRadius: 20,
                showStepBorder: false,
                titlesAreLargerThanSteps: true,
                fitWidth: true,
                steps: [
                  EasyStep(
                      title: 'Billing\nAddress',
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: _getColor(0),
                      )),
                  EasyStep(
                      title: 'Shipping\nAddress',
                      enabled: controller.shippingAndBillingSame.value == false,
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: _getColor(1),
                      )),
                  EasyStep(
                      title: 'Shipping\nMethod',
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: _getColor(2),
                      )),
                  EasyStep(
                      title: 'Payment\nMethod',
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: _getColor(3),
                      )),
                  EasyStep(
                      title: 'Review',
                      customStep: CircleAvatar(
                        radius: 10,
                        backgroundColor: _getColor(4),
                      )),
                ],
                onStepReached: controller.currentStep.call,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.currentStep.value == 0
                    ? Column(
                        children: [
                          Expanded(
                              child: AddressForm(
                            key: controller.billingAddressKey,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(
                              () => Row(
                                children: [
                                  Checkbox(
                                    value:
                                        controller.shippingAndBillingSame.value,
                                    onChanged:
                                        controller.shippingAndBillingSame.call,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text("Use it as shipping address"),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    : controller.currentStep.value == 1
                        ? AddressForm(
                            key: controller.shippingAddressKey,
                          )
                        : controller.currentStep.value == 2
                            ? _deliveryMethod()
                            : controller.currentStep.value == 3
                                ? _paymentMethod()
                                : const Center(
                                    child: Text("Need to complete"),
                                  ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2,
                ),
              ],
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: controller.changePage,
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color? _getColor(i) {
    return controller.currentStep.value > i
        ? Colors.green
        : controller.currentStep.value == i
            ? Colors.blue
            : Colors.grey[300];
  }

  _addressPage() {
    return const AddressForm();
  }

  _deliveryMethod() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () => Column(
          children: [
            RadioButton(
              onTap: () => controller.setShipingMethod.call(0),
              isSelected: controller.setShipingMethod.value == 0,
              title: "Flat Rate",
              subTitle: "BDT 10.0",
            ),
            const SizedBox(height: 20),
            RadioButton(
              onTap: () => controller.setShipingMethod.call(1),
              isSelected: controller.setShipingMethod.value == 1,
              title: "Free Shipping",
              subTitle: "BDT 0.0",
            ),
          ],
        ),
      ),
    );
  }

  _paymentMethod() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(
        () => Column(
          children: [
            RadioButton(
              onTap: () => controller.setShipingMethod.call(0),
              isSelected: controller.setShipingMethod.value == 0,
              title: "Cash On Delivery",
            ),
            const SizedBox(height: 20),
            RadioButton(
              onTap: () => controller.setShipingMethod.call(1),
              isSelected: controller.setShipingMethod.value == 1,
              title: "Money Transfer",
            ),
            const SizedBox(height: 20),
            RadioButton(
              onTap: () => controller.setShipingMethod.call(1),
              isSelected: controller.setShipingMethod.value == 1,
              title: "Paypal Standard",
            ),
          ],
        ),
      ),
    );
  }
}

class RadioButton extends StatelessWidget {
  final Function() onTap;
  final bool isSelected;
  final String title;
  final String? subTitle;

  const RadioButton({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isSelected
                ? const Icon(
                    Icons.radio_button_checked,
                    color: AppColors.primary,
                  )
                : const Icon(
                    Icons.radio_button_off,
                    color: AppColors.primary,
                  ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: const TextStyle(fontSize: 10),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
