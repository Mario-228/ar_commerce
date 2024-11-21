import 'package:flutter/material.dart';
import 'package:graduation_project/core/utils/font_styles/font_styles.dart';

class UserPofileHeader extends StatelessWidget {
  const UserPofileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 37.5,
          backgroundImage: NetworkImage(
            "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
          ),
        ),
        SizedBox(width: 25.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: FontStyles.textStyleRegular16,
            ),
            SizedBox(height: 10.0),
            Text(
              "hirata@gmail.com",
              style: FontStyles.textStyleRegularGrey14,
            ),
            SizedBox(height: 10.0),
          ],
        )
      ],
    );
  }
}
