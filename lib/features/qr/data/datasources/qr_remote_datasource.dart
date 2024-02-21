import 'package:ishker_24/core/network/rsk_service.dart';

import '../models/generate_qr_post_model.dart';

abstract interface class IQrRemoteDataSource {
  Future<String> generateQr(GenerateQrPostModel model);
}

class QrRemoteDataSourceImpl implements IQrRemoteDataSource {
  QrRemoteDataSourceImpl(this._service);

  final RskService _service;

  @override
  Future<String> generateQr(GenerateQrPostModel model) async =>
      _service.generateQR(model);
}
