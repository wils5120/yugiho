import 'package:flutter/material.dart';
import '../screens/archetypes.dart';
import '../screens/details.dart';
import '../screens/home.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.home: (context) => const Home(),
    Routes.details: (context) => const Details(),
    Routes.archetypes: (context) => const Archetypes(),
  };
}
