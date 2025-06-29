import 'package:flutter/material.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/views/widgets/search_bar_widget.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/views/widgets/search_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/utils/font_styles/font_styles.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SearchBarWidget(),
              SizedBox(height: 20.0),
              Text(
                AppLocalizations.of(context)!.searchResult,
                style: FontStyles.textStyleSemiBold20,
              ),
              SizedBox(height: 10.0),
              SearchGridView()
            ],
          ),
        ),
      ),
    );
  }
}
