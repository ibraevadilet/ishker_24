import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';

abstract class GetNalogNamesRepo {
  Future<List<NalogNameModel>> getNalogNames();
}
