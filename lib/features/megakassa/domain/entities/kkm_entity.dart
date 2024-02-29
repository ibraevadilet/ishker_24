import 'dart:convert';

import 'package:ishker_24/features/megakassa/domain/enums/kkm_status.dart';

class MegaKassaKkmEntity {
  final String name;
  final KkmStatus status;
  final String rnm;
  final bool isMegaKassa;

  MegaKassaKkmEntity({
    required this.name,
    required this.status,
    required this.rnm,
    required this.isMegaKassa,
  });

  MegaKassaKkmEntity copyWith({
    String? name,
    KkmStatus? status,
    String? rnm,
    bool? isMegaKassa,
  }) {
    return MegaKassaKkmEntity(
      name: name ?? this.name,
      status: status ?? this.status,
      rnm: rnm ?? this.rnm,
      isMegaKassa: isMegaKassa ?? this.isMegaKassa,
    );
  }

  @override
  String toString() {
    return 'MegaKassaKkmEntity(name: $name, status: $status, rnm: $rnm, isMegaKassa: $isMegaKassa)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaKkmEntity &&
        other.name == name &&
        other.status == status &&
        other.rnm == rnm &&
        other.isMegaKassa == isMegaKassa;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        status.hashCode ^
        rnm.hashCode ^
        isMegaKassa.hashCode;
  }

  factory MegaKassaKkmEntity.fromMap(Map<String, dynamic> map) {
    return MegaKassaKkmEntity(
      name: map['name'] ?? '',
      status: getTitle(map['status'] ?? ''),
      rnm: map['rnm'] ?? '',
      isMegaKassa: map['isMegaKassa'] ?? false,
    );
  }

  factory MegaKassaKkmEntity.fromJson(String source) =>
      MegaKassaKkmEntity.fromMap(json.decode(source));

  static KkmStatus getTitle(String status) {
    switch (status) {
      case 'Готов':
        return KkmStatus.ready;
      case 'Заблокирован':
        return KkmStatus.blocked;
      case 'Остановлен':
        return KkmStatus.stopped;
      case 'Отклонен':
        return KkmStatus.rejected;
      default:
        return KkmStatus.registration;
    }
  }
}
