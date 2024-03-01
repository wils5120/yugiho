import '../models/cards.dart';

abstract class ControllerDataRepository {
  Future<List<DataCard>> getCards([String? getArchetype]);
}
