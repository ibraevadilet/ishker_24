import 'package:ishker_24/features/register_ip/data/models/user_nalog_types_model.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/send_otp_repository.dart';
import 'package:ishker_24/features/register_ip/domain/use_cases/get_user_info_usecase.dart';
import 'package:ishker_24/server/service_locator.dart';

class SendOtpUseCase {
  final SendOtpRepo repo;
  SendOtpUseCase({
    required this.repo,
  });

  Future<void> sendOtp(String authType) async {
    try {
      await repo.sendOtp(authType);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> confirmOtp(String pinCode) async {
    try {
      final userCase = sl<GetUserInfoUseCase>();
      final UserNalogTypesModel registerModel = UserNalogTypesModel(
        tin: userCase.innController.text,
        phoneNumber: userCase.numberController.text,
        email: userCase.emailController.text,
        activityCode: userCase.activityCode,
        isHaveWageEarners: userCase.isHaveWageEarners,
        taxMode: userCase.taxMode,
        entrepreneurType: userCase.entrepreneurType,
        selectedModes: userCase.selectedModes,
      );
      return await repo.confirmOtp(
        pinCode,
        registerModel,
      );
    } catch (e) {
      rethrow;
    }
  }
}
