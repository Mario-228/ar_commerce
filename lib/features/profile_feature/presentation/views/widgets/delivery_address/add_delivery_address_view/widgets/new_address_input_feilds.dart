import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project_new_version/core/utils/location_service/location_service.dart';
import 'package:graduation_project_new_version/core/widgets/custom_text_form_field.dart';
import 'package:graduation_project_new_version/features/google_map_feature/presentation/views/google_maps_view.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views_models/add_new_address_cubit/add_new_address_cubit.dart';

class NewAddressInputFeilds extends StatelessWidget {
  const NewAddressInputFeilds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: AddNewAddressCubit.get(context).formKey,
      child: Column(
        children: [
          CustomTextFormField(
            type: TextInputType.name,
            labelText: "Full Name",
            controller: AddNewAddressCubit.get(context).name,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert name";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.emailAddress,
            labelText: "Email",
            controller: AddNewAddressCubit.get(context).email,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert email";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.text,
            labelText: "Phone Number",
            controller: AddNewAddressCubit.get(context).phone,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert phone number";
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            type: TextInputType.streetAddress,
            labelText: "Address",
            controller: AddNewAddressCubit.get(context).address,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return "Insert address";
              } else {
                return null;
              }
            },
            icon: Icons.location_on_outlined,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GoogleMapsView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
