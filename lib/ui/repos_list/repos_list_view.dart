import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/list_view_with_search.dart';
import 'package:github_repos_multithread/ui/repos_list/widgets/search_form.dart';

import 'bloc/repos_cubit.dart';
import 'bloc/repos_state.dart';

class ReposListView extends StatelessWidget {
  const ReposListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GitHub repos list')),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: BlocConsumer<ReposCubit, ReposState>(
              listener: (context, state) {
                if (state is ReposErrorState) {
                  Fluttertoast.showToast(msg: state.errorMessage, toastLength: Toast.LENGTH_LONG, fontSize: 16.0);
                }
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ReposLoadingState:
                    return _buildLoadingState(searchQuery: state.searchQuery);
                  case ReposSuccessState:
                    return ListViewWithSearch(
                      repos: state.repos,
                      searchQuery: state.searchQuery,
                      hasMoreData: state.totalCount > state.repos.length,
                    );
                  default:
                    return SearchForm();
                }
              },
            ),
          )),
    );
  }

  Widget _buildLoadingState({required String searchQuery}) {
    return Column(
      children: [
        SearchForm(
          searchQuery: searchQuery,
        ),
        const CircularProgressIndicator()
      ],
    );
  }
}
