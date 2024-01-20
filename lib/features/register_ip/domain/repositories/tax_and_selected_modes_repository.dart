import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';

abstract class TaxAndSelectedModesRepo {
  Future<TaxAndSelectedModesModels> taxAndSelectedModes(bool isPatent);
}
