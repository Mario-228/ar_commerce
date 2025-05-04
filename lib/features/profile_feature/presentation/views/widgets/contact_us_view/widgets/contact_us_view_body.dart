import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/contact_us_view/widgets/contact_container.dart';

import '../../../../../../../core/utils/font_styles/font_styles.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "We'd love to hear from you!",
          style: FontStyles.textStyleBold28,
        ),
        SizedBox(height: 15),
        Text(
          "Reach out to us with questions, feedback ",
          style: FontStyles.textStyleRegular14,
        ),
        SizedBox(height: 15),
        Text(
          "or any support needs",
          style: FontStyles.textStyleRegular14,
        ),
        SizedBox(height: 40),
        ContactContainer(icon: Icons.phone, title: "+20 123 456 7890"),
        SizedBox(height: 40),
        ContactContainer(icon: Icons.email, title: "3MKMart@gmail.com"),
        SizedBox(height: 40),
        ContactContainer(
            icon: Icons.location_on,
            title: "El-Khalyfa El-Mamoun Street, \n Abbasya, Cairo , Egypt"),
      ],
    ));
  }
}
