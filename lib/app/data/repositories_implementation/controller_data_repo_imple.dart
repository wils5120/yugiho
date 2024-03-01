import '../../domain/models/cards.dart';
import '../../domain/repositories/controller_data_repository.dart';

import '../services/remote/controller_api.dart';

class ControllerDataRepositoryImple implements ControllerDataRepository {
  ControllerDataRepositoryImple(this._api);

  final ControllerAPI _api;

  @override
  Future<List<DataCard>> getCards([String? getArchetype]) async {
    List<DataCard>? cards;
    cards = await _api.getCards(getArchetype);
    if (cards == null) {
      return cards = [];
    }
    return cards;
  }
  

}
