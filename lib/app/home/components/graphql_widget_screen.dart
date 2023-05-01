import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:uztelecom/app/home/view/home_view.dart';
import 'package:uztelecom/core/locator.dart';

import '../../../core/cache_manager.dart';

class GraphqlWidgetScreen extends StatelessWidget {
  const GraphqlWidgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var httpLink = HttpLink('https://dev-graph.telecom-car.uz/v1/graphql');

    final AuthLink authLink = AuthLink(
      getToken: () async =>
          'Bearer ${(await locator.get<CacheManager>().loadAccessToken)!.access}',
    );

    final Link link = authLink.concat(httpLink);

    final client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: GraphQLCache(),
        link: link,
      ),
    );
    return GraphQLProvider(
      client: client,
      child: const CacheProvider(
        child: HomeView(),
      ),
    );
  }
}
