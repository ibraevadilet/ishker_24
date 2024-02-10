import 'package:flutter/material.dart';
import 'package:ishker_24/features/grnp_check/data/models/send_grnp_model.dart';
import 'package:ishker_24/features/grnp_check/domain/repositories/grnp_repository.dart';

class GRNPUseCase {
  GRNPUseCase({required this.repo});
  final GRNPRepo repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passNumberController = TextEditingController();
  final TextEditingController innController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  String photo = '';

  Future<String> sendGRNP(SendGRNPModel sendGRNPModel,
      {required String phone}) async {
    try {
      return await repo.sendGRNP(sendGRNPModel, phone: phone);
    } catch (e) {
      rethrow;
    }
  }
}
