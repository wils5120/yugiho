import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'app/data/repositories_implementation/controller_data_repo_imple.dart';
import 'app/data/services/remote/controller_api.dart';
import 'app/domain/repositories/controller_data_repository.dart';
import 'app/my_app.dart';

void main() {
  runApp(Injector(
    controllerDataRepository: ControllerDataRepositoryImple(
      ControllerAPI(
        http.Client(),
      ),
    ),
    child: const MyApp(),
  ));
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.controllerDataRepository,
  });

  final ControllerDataRepository controllerDataRepository;

  static Injector? of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be fount');
    return injector!;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  bool updateShouldNotify(_) => false;
}
