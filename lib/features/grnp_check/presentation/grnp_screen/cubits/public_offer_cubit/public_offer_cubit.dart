import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/core/app_helpers/dio_header.dart';
import 'package:ishker_24/core/constants/app_text_constants.dart';
import 'package:path_provider/path_provider.dart';

part 'public_offer_cubit.freezed.dart';
part 'public_offer_state.dart';

class PublicOfferCubit extends Cubit<PublicOfferState> {
  PublicOfferCubit() : super(const PublicOfferState.initial()) {
    publicOffer();
  }

  void publicOffer() async {
    try {
      final temp = Platform.isIOS
          ? await getTemporaryDirectory()
          : await getExternalStorageDirectory();
      final file = File('${temp?.path}/public-offer.pdf');

      await Dio().download(
        AppTextConstants.publicOffer,
        file.path,
        options: AppDioHeader.dioHeader(),
      );

      emit(PublicOfferState.success(file.path));
    } catch (e) {
      emit(PublicOfferState.error(e.toString()));
    }
  }
}
