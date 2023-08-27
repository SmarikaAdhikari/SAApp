// ignore_for_file: non_constant_identifier_names

import 'package:app/api_all/api_author/api_model.dart';
import 'package:app/api_all/api_author/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../api_book/api_model.dart';
// import '../../api_book/api_service.dart';

final authorFutureProvider = FutureProvider.autoDispose<Authors>((ref) async {
  final ApiService = ref.watch(autServiceProvider);
  return ApiService.getAuthor();
});

class AuthorProviderPage extends ConsumerWidget {
  const AuthorProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authorProvider = ref.watch(authorFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Author Provider'),
        ),
        body: Center(
          child: authorProvider.when(data: (data) {
            return Column(
              children: [
                Text(data.name),
                Text(data.bio),
                Text(data.dob),
                Text(data.address),
                Text(data.description),
              ],
            );
          }, error: (error, _) {
            return Text(error.toString());
          }, loading: () {
            return const SizedBox();
          }),
        ));
  }
}
