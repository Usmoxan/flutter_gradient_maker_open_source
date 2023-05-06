import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main_controller.dart';
import '../models/config.dart';
import '../style/color.dart';
import '../style/text.dart';
import '../utils/enums.dart';
import '../utils/extension.dart';
import '../widget/checkBox.dart';

class JsonTreeHeader extends StatelessWidget {
  const JsonTreeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: StText.normal(
              'JsonKey',
              style: TextStyle(
                color: ColorPlate.gray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: StText.normal(
              appLocalizations.type,
              style: const TextStyle(
                color: ColorPlate.gray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: StText.normal(
              appLocalizations.name,
              style: const TextStyle(
                color: ColorPlate.gray,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Obx(() {
              return DropdownButton<PropertyAccessorType>(
                value: ConfigSetting().propertyAccessorType.value,
                underline: Container(),
                items: PropertyAccessorType.values
                    .where((PropertyAccessorType element) =>
                        element == PropertyAccessorType.none ||
                        element == PropertyAccessorType.final_)
                    .map<DropdownMenuItem<PropertyAccessorType>>(
                        (PropertyAccessorType f) =>
                            DropdownMenuItem<PropertyAccessorType>(
                              value: f,
                              child: Text(f
                                  .toString()
                                  .replaceAll('PropertyAccessorType.', '')
                                  .replaceAll('_', '')
                                  .toLowerCase()),
                            ))
                    .toList(),
                onChanged: (PropertyAccessorType? value) {
                  //controller.updatePropertyAccessorType();
                  ConfigSetting().propertyAccessorType.value = value!;
                  ConfigSetting().save();
                },
              );
            }),
          ),
        ),
        Obx(() {
          if (ConfigSetting().nullsafety.value) {
            return Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: StCheckBox(
                  title: appLocalizations.nullable,
                  value: ConfigSetting().nullable.value,
                  onChanged: (bool value) {
                    ConfigSetting().nullable.value = value;
                    ConfigSetting().save();
                    Get.find<MainController>().updateNullable(value);
                  },
                ),
              ),
            );
          } else {
            return const SizedBox(
              width: 0,
              height: 0,
            );
          }
        }),
      ],
    );
  }
}
