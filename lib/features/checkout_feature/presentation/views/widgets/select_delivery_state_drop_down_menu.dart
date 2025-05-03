import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/checkout_feature/data/models/address_model.dart';
import 'package:graduation_project_new_version/features/checkout_feature/presentation/views_models/checkout_cubit/checkout_cubit.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class SelectDeliveryStateDropDownMenu extends StatefulWidget {
  const SelectDeliveryStateDropDownMenu({super.key, required this.items});
  final List<AddressModel> items;

  @override
  State<SelectDeliveryStateDropDownMenu> createState() =>
      _SelectDeliveryStateDropDownMenuState();
}

class _SelectDeliveryStateDropDownMenuState
    extends State<SelectDeliveryStateDropDownMenu> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return DropdownButton2<int>(
      underline: const SizedBox(),
      isExpanded: true,
      hint: const Text(
        'Select delivery state',
        style: TextStyle(fontSize: 14),
      ),
      items: widget.items.asMap().entries.map((entry) {
        return DropdownMenuItem<int>(
          value: entry.key,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              entry.value.address,
              overflow: TextOverflow.ellipsis,
              style: FontStyles.textStyleSemiBold14,
            ),
          ),
        );
      }).toList(),
      value: selectedIndex,
      onChanged: (int? value) {
        setState(() {
          selectedIndex = value;

          final selected = widget.items[value ?? 0];
          CheckoutCubit.get(context).nameController.text =
              selected.receiverName;
          CheckoutCubit.get(context).emailController.text =
              selected.receiverEmail;
          CheckoutCubit.get(context).phoneController.text = selected.phone;
          CheckoutCubit.get(context).addressController.text = selected.address;
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
