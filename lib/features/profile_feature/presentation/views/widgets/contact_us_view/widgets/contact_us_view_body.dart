import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/profile_feature/presentation/views/widgets/contact_us_view/widgets/contact_container.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../../../core/utils/font_styles/font_styles.dart';

class ContactUsViewBody extends StatelessWidget {
  const ContactUsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.weLoveToHearFromYou,
            style: FontStyles.textStyleBold28,
          ),
          SizedBox(height: 15),
          Text(
            AppLocalizations.of(context)!.reachOutMessage1,
            style: FontStyles.textStyleRegular14,
          ),
          SizedBox(height: 15),
          Text(
            AppLocalizations.of(context)!.reachOutMessage2,
            style: FontStyles.textStyleRegular14,
          ),
          SizedBox(height: 40),
          Directionality(
              textDirection: TextDirection.ltr,
              child: ContactContainer(
                  icon: Icons.phone, title: "+20 123 456 7890")),
          SizedBox(height: 40),
          Directionality(
              textDirection: TextDirection.ltr,
              child: ContactContainer(
                  icon: Icons.email, title: "3MKMart@gmail.com")),
          SizedBox(height: 40),
          ContactContainer(
              icon: Icons.location_on,
              title:
                  "${AppLocalizations.of(context)!.addressLine1}\n${AppLocalizations.of(context)!.addressLine2}"),
        ],
      ),
    ));
  }
}
