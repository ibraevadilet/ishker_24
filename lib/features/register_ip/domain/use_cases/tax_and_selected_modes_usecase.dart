import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/tax_and_selected_modes_repository.dart';

class TaxAndSelectedModesUseCase {
  final TaxAndSelectedModesRepo repo;
  TaxAndSelectedModesUseCase({
    required this.repo,
  });

  Future<TaxAndSelectedModesModels> taxAndSelectedModes(bool isPatent) async {
    try {
      return await repo.taxAndSelectedModes(isPatent);
    } catch (e) {
      rethrow;
    }
  }
}
