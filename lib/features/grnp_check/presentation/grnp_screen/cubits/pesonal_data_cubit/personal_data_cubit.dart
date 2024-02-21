import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:path_provider/path_provider.dart';

part 'personal_data_cubit.freezed.dart';
part 'personal_data_state.dart';

class PersonalDataCubit extends Cubit<PersonalDataState> {
  PersonalDataCubit() : super(const PersonalDataState.initial()) {
    personalData();
  }

  void personalData() async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/personal-data.pdf');

      await Dio().download(
        AppTextConstants.personalData,
        file.path,
        options: AppDioHeader.dioHeader(),
      );

      emit(PersonalDataState.success(file.path));
    } catch (e) {
      emit(PersonalDataState.error(e.toString()));
    }
  }
}
