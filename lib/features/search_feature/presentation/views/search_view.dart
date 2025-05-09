import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_new_version/core/widgets/custom_appbar.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/models_views/get_search_products_cubit/get_search_products_cubit.dart';
import 'package:graduation_project_new_version/features/search_feature/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Search'),
      body: BlocProvider(
        create: (context) => GetSearchProductsCubit(),
        child: SearchViewBody(),
      ),
    );
  }
}
