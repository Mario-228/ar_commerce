import 'package:flutter/material.dart';
import '../../../../../../core/utils/font_styles/font_styles.dart';
import '../../../../../../core/widgets/custom_back_ground_container.dart';
import 'widgets/my_details_view_body.dart';

class MyDetailsView extends StatelessWidget {
  const MyDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Details", style: FontStyles.textStyleBold22),
        centerTitle: true,
      ),
      body: const CustomBackGroundContainer(
        child: MyDetailsViewBody(),
      ),
    );
  }
}
