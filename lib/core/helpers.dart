import 'dart:js';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

QueryBuilder withGenericHandling(QueryBuilder builder) {
  return (result, {fetchMore, refetch}) {
    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return builder(result, fetchMore: fetchMore, refetch: refetch);
  };
}