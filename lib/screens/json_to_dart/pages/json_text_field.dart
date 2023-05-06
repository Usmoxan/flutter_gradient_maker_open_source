import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_controller.dart';
import '../style/color.dart';
import '../utils/extension.dart';

class JsonTextField extends StatelessWidget {
  const JsonTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.find();
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: ColorPlate.lightGray,
      ),
      child: TextField(
        controller: controller.textEditingController,
        maxLines: null,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: appLocalizations.inputHelp,
          hintStyle: const TextStyle(
            color: ColorPlate.gray,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        ),
      ),
    );
  }
}
