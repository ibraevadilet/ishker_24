import 'package:ishker_24/features/register_ip/data/models/get_gns_pdf_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_gns_pdf_repository.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_user_info_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';

class GetGnsPdfUseCase {
  final GetGnsPdfRepo repo;
  GetGnsPdfUseCase({
    required this.repo,
  });

  Future<String> getGnsPdf() async {
    try {
      final userInfoUseCase = sl<GetUserInfoUseCase>();
      final GetGnsPdfModel model = GetGnsPdfModel(
        inn: userInfoUseCase.innController.text,
        phone: userInfoUseCase.numberController.text,
        email: userInfoUseCase.emailController.text,
        realLocationObl: userInfoUseCase.regionController.text,
        realLocationAddress: userInfoUseCase.adressController.text,
      );
      return await repo.getGnsPdf(model);
    } catch (e) {
      rethrow;
    }
  }
}
