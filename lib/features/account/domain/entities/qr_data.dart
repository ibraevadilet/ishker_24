import 'package:equatable/equatable.dart';

class QrData extends Equatable {
  const QrData({
    required this.link,
    required this.sum,
    required this.currency,
    required this.account,
    required this.name,
  });

  final String link;
  final num sum;
  final String currency;
  final String account;
  final String name;

  factory QrData.fromQr(String qr) {
    final decoded = Uri.decodeFull(qr);

    var map = <String, String>{};
    var map32 = <String, String>{};
    var map33 = <String, String>{};

    final last = decoded.split('#').last.split('');
    map = parse(last);
    map32 = parse(map['32']?.split(''));
    map33 = parse(map['33']?.split(''));

    final url = map32['00'] as String;
    final sum = map['54'];
    final account = map32['10'] as String;
    final currency = map['53'] as String;
    final name = map33['00'] as String;

    return QrData(
      link: url,
      sum: int.tryParse(sum ?? '0') ?? 0,
      currency: currency,
      account: account,
      name: name.replaceAll('+', ' '),
    );
  }

  @override
  List<Object?> get props => [link, sum, currency, account, name];
}

Map<String, String> parse(List<String>? list) {
  final map = <String, String>{};

  if (list == null || list.isEmpty) return map;

  do {
    final part = getPart(list);
    map.addAll(part);
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
