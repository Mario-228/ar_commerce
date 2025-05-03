import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class SelectDeliveryStateDropDownMenu extends StatefulWidget {
  const SelectDeliveryStateDropDownMenu({super.key, required this.items});
  final List<String> items;
  @override
  State<SelectDeliveryStateDropDownMenu> createState() =>
      _SelectDeliveryStateDropDownMenuState();
}

class _SelectDeliveryStateDropDownMenuState
    extends State<SelectDeliveryStateDropDownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      underline: SizedBox(),
      isExpanded: true,
      hint: const Text(
        'Select delivery state',
        style: TextStyle(fontSize: 14),
      ),
      items: widget.items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              item,
              overflow: TextOverflow.ellipsis,
              style: FontStyles.textStyleSemiBold14,
            ),
          ),
        );
      }).toList(),
      value: selectedValue,
      onChanged: (value) async {
        setState(() {
          selectedValue = value;
        });
      },
      buttonStyleData: ButtonStyleData(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black45),
        ),
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 200,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        offset: const Offset(0, 8),
      ),
    );
  }
}
