import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/functions/push_router_func.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/use_cases/create_account_usecase.dart';
import 'package:ishker_24/features/bank/domain/use_cases/register_client_usecase.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';
import 'package:ishker_24/routes/mobile_auto_router.gr.dart';

part 'regitser_client_cubit.freezed.dart';
part 'regitser_client_state.dart';

class RegitserClientCubit extends Cubit<RegitserClientState> {
  RegitserClientCubit({
    required this.useCase,
    required this.accountUseCase,
  }) : super(const RegitserClientState.initial());
  final RegisterClientUseCase useCase;
  final CreateAccountUseCase accountUseCase;
  TaxModel? selectedVidDeatelnost;

  selectVidDeatelnost(TaxModel selectedVidDeatelnostFrom) {
    selectedVidDeatelnost = selectedVidDeatelnostFrom;
  }

  Future<void> registerClient() async {
    emit(const RegitserClientState.loading());
    try {
      final number = useCase.numberController.text
          .replaceAll('(', '')
          .replaceAll(')', '')
          .replaceAll(' ', '')
          .replaceAll('-', '');
      final postModel = RegisterClientPostModel(
        pasportTypeAnId: 'pasportTypeAnId',
        pasportNumber: 'pasportNumber',
        phoneNumber: '+996$number',
        emailAdress: useCase.emailController.text,
        vidDeatelnosty: 'vidDeatelnosty',
        okpo: useCase.okpoController.text,
        ogrn: useCase.regNumberController.text,
        seriesDocNumber: 'seriesDocNumber',
        docNumber: 'docNumber',
        docPlace: 'docPlace',
        docDate: 'docDate',
        comment: useCase.commentController.text,
        note226: useCase.selectedVidDeatelnost!.text,
      );
      final result = await useCase.registerClient(postModel);
      final account = await accountUseCase.createAccount(result);
      emit(const RegitserClientState.success());
      AppRouting.pushAndPopUntilFunction(
        CreateAccountFinishRoute(accountNumber: account),
      );
    } catch (e) {
      emit(RegitserClientState.error(e.toString()));
    }
  }
}
