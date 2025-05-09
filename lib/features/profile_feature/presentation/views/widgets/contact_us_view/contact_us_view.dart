import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/contact_us_view/widgets/contact_us_view_body.dart';

import '../../../../../../core/widgets/custom_appbar.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: "Contact Us",
        canGoBack: true,
      ),
      body: const ContactUsViewBody(),
    );
  }
}
