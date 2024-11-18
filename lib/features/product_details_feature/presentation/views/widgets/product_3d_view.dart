import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/utils/app_colors/app_colors.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Product3DView extends StatelessWidget {
  const Product3DView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 3,
          width: double.infinity,
          child: const Expanded(
            child: ModelViewer(
              backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
              src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
              alt: 'A 3D model of an astronaut',
              ar: true,
              autoRotate: true,
              iosSrc:
                  'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
              disableZoom: true,
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
