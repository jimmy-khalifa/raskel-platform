
import 'package:graphql_flutter/graphql_flutter.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthGraphQLClient {
  static late GraphQLClient _client = GraphQLClient(
      link: HttpLink("http://172.17.32.3:8000/graphql/"),
      cache: GraphQLCache());

  static GraphQLClient getClient(HiveStore? store) {
    final HttpLink httpLink = HttpLink(//"http://172.17.32.2:8000/graphql/");
        "http://172.17.32.3:8000/graphql/");
    final AuthLink authLink = AuthLink(getToken: () async {
      late final Box box = Hive.box('auth');
     
      return box.get('token') != null ? 'JWT ' + box.get('token') : '';
    });

    final link = authLink.concat(httpLink);

    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: store),
    );

    return _client;
  }
}
