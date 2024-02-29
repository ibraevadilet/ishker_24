import 'package:dio/dio.dart';
import 'package:ishker_24/features/nalog_decloration/data/models/nalog_names_model.dart';
import 'package:ishker_24/features/nalog_decloration/domain/repositories/get_nalog_names_repository.dart';
import 'package:ishker_24/server/catch_exception.dart';

class GetNalogNamesRepoImpl implements GetNalogNamesRepo {
  final Dio dio;
  GetNalogNamesRepoImpl({required this.dio});

  @override
  Future<List<NalogNameModel>> getNalogNames() async {
    try {
      final response = await dio.get(
        'declaration/report/list',
      );
      return response.data['data']
          .map<NalogNameModel>((e) => NalogNameModel.fromJson(e))
          .toList();
    } catch (e) {
      throw CatchException.convertException(e).message;
    }
  }
}
