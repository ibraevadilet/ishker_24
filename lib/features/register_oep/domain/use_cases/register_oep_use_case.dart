import 'package:flutter/material.dart';
import 'package:ishker_24/features/register_oep/data/models/send_register_oep_model.dart';
import 'package:ishker_24/features/register_oep/domain/repositories/register_oep_repo.dart';

class RegisterOEPUseCase {
  RegisterOEPUseCase({required this.repo});
  final RegisterOEPRepo repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passNumberController = TextEditingController();
  final TextEditingController innController = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  String photo = '';
  bool isChecked = false;
  bool get isCheckedGetter => isChecked;

  Future<void> registerOEP(SendRegisterOEPModel registerOEPModel) async {
    try {
      return await repo.registerOEP(registerOEPModel);
    } catch (e) {
      rethrow;
    }
  }
}
