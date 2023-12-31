// ignore_for_file: unused_local_variable, non_constant_identifier_names

// import 'package:app/api/api_provider.dart';
import 'package:app/user/api_all/api_user/api_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../api_book/api_service.dart';
import 'api_user_service.dart';

final userFutureProvider = FutureProvider<User>((ref) async {
  final ApiService = ref.watch(userServiceProvider);
  return ApiService.getUsers();
});

// final FutureProviderr = FutureProvider.autoDispose<dynamic>((data) async {
//   final ApiService = ref.watch(mailServiceProvider);
//   return ApiService.sendMail(data);
// });

class UserProviderPage extends ConsumerWidget {
  const UserProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(userFutureProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Provider'),
        ),
        body: Center(
          child: userProvider.when(data: (data) {
            return Column(
              children: [
                Text(data.id.toString()),
                Text(data.email),
                Text(data.name),
                Text(data.password),
                Text(data.phone),
                Text(data.address),
                Text(data.image),
                Text(data.bio),
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
