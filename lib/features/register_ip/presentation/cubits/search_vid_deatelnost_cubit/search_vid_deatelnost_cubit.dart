import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ishker_24/features/register_ip/data/models/tax_and_selected_modes_model.dart';

part 'search_vid_deatelnost_cubit.freezed.dart';
part 'search_vid_deatelnost_state.dart';

class SearchVidDeatelnostCubit extends Cubit<SearchVidDeatelnostState> {
  SearchVidDeatelnostCubit()
      : super(const SearchVidDeatelnostState.initial([]));

  List<TaxModel> modelList = [];

  void getList(List<TaxModel> modelFrom) {
    modelList = modelFrom;
    emit(SearchVidDeatelnostState.initial(modelList));
  }

  void searchList(String value) {
    final newList = List<TaxModel>.from(modelList);
    newList.removeWhere(
        (e) => !e.text.toLowerCase().contains(value.toLowerCase()));
    emit(SearchVidDeatelnostState.initial(newList));
  }
}
