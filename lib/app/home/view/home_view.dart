import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uztelecom/app/auth/view/auth_view.dart';
import 'package:uztelecom/app/home/model/user_model.dart';
import 'package:uztelecom/app/home/repositories/user_repositories.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User uztelecom'),
      ),
      body: Center(
        child: Query(
            options: QueryOptions(
                document: gql(userRepositories),
                pollInterval: const Duration(seconds: 10)),
            builder: (result, {fetchMore, refetch}) {
              if (result.hasException) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const AuthView()),
                      (route) => false);
                });
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              debugPrint('User info ------------------ ${result.data}');

              final user = UserModel.fromJson(result.data!).getUserProfile[0];

              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      child: Text('${user.id}'),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.phoneNumber),
                  ),
                  const SizedBox(height: 20),
                  ColoredBox(
                    color: Colors.blue,
                    child: RichText(
                      text: TextSpan(
                          text: 'Father name : ',
                          children: [TextSpan(text: user.fatherName)]),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ColoredBox(
                    color: Colors.black,
                    child: RichText(
                      text: TextSpan(
                          text: 'Created time : ',
                          children: [TextSpan(text: '${user.createdAt}')]),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
