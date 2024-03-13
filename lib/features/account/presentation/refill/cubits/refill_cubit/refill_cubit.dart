import 'dart:developer' as dev;

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ishker_24/core/errors/exceptions.dart';

part 'refill_state.dart';

class RefillCubit extends Cubit<RefillState> {
  RefillCubit(this._qr) : super(RefillInitial()) {
    init();
  }

  final String _qr;
  var _map = <String, String>{};
  var _map32 = <String, String>{};
  var _map33 = <String, String>{};

  void init() async {
    final qr = Uri.decodeFull(_qr);
    // dev.log('qr: $qr');

    final last = qr.split('#').last.split('');
    _map = parse(last);
    _map32 = parse(_map['32']?.split(''));
    _map33 = parse(_map['33']?.split(''));

    final url = _map32['00'];
    final sum = _map['54'];
    final account = _map32['10'];
    final currency = _map['53'];

    final name = _map33['00'];

    if (sum != null && account != null && currency != null && name != null) {
      emit(RefillQrParsed(
        sum: num.tryParse(sum) ?? 0.0,
        currency: currency,
        account: account,
        name: name.replaceAll('+', ' '),
      ));
    } else {
      emit(RefillFailure(MessageException('QR parsing failure')));
    }
  }

  Map<String, String> parse(List<String>? list) {
    final map = <String, String>{};

    if (list == null || list.isEmpty) return map;

    do {
      final part = getPart(list);
      map.addAll(part);
      dev.log(part.toString());
    } while (list.isNotEmpty);

    return map;
  }

  Map<String, String> getPart(List<String> list) {
    final code = getCode(list);
    final size = getCode(list);
    final value = getValue(list, int.parse(size));

    return {code: value};
  }

  String getCode(List<String> list) {
    final code = list.take(2).join();
    list.removeRange(0, 2);

    return code;
  }

  String getValue(List<String> list, int size) {
    final value = list.take(size).join();
    list.removeRange(0, size);

    return value;
  }
}
