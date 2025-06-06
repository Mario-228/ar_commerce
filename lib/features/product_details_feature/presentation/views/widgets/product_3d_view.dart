import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project_new_version/core/utils/ar_service/ar_device_compatibility_checker.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../../../core/utils/app_colors/app_colors.dart';
import '../../../../../core/utils/models/custom_product_item_model/custom_product_item_model.dart';

class Product3DView extends StatelessWidget {
  const Product3DView({
    super.key,
    required this.model,
  });
  final CustomProductItemModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 3,
          width: double.infinity,
          child: Expanded(
            child: ModelViewer(
              backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
              src: model.image3DUrl,
              alt: 'A 3D model of an astronaut',
              ar: ARDeviceCompatibilityChecker.isARSupported,
              autoRotate: false,
              iosSrc: model.image3DUrl,
              disableZoom: false,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: MaterialButton(
            minWidth: 40,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: AppColors.blackShade800,
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
