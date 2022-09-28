import 'dart:convert';
import 'dart:io';

import '../../model/detail_model.dart';
import '../viewmodel/compound_viewmodel.dart';
import 'compound_service_interface.dart';

class CompoundService extends ICompoundService {
  CompoundService(super.dio);

  @override
  Future<List<DetailModel>?> fetchCompoundData() async {
    final response = await dio
        .get('${CompoundServiceEnum.gts.withSlash + CompoundServiceEnum.ara.questionMark}=${CompoundViewModel.word}');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = jsonDecode(response.data);
      if (jsonBody is List) {
        return jsonBody.map((e) => DetailModel.fromJson(e)).toList();
      }
    }
    return null;
  }
}

enum CompoundServiceEnum {
  gts,
  ara;

  String get withSlash => '/$name';
  String get questionMark => '?$name';
}
