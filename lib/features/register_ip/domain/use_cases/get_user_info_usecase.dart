import 'package:flutter/material.dart';
import 'package:ishker_24/features/register_ip/domain/repositories/get_user_info_repository.dart';

class GetUserInfoUseCase {
  final GetUserInfoRepo repo;
  GetUserInfoUseCase({
    required this.repo,
  });

  final innController = TextEditingController();
  final regionController = TextEditingController();
  final adressController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();

  String activityCode = '';
  bool isHaveWageEarners = false;
  int taxMode = 0;
  int entrepreneurType = 0;
  List<int> selectedModes = [];

  Future<void> getUserInfo() async {
    try {
      final userInfo = await repo.getUserInfo();
      innController.text = userInfo.inn;
      regionController.text = userInfo.addressObl;
      adressController.text = userInfo.addressStreet;
    } catch (e) {
      rethrow;
    }
  }
}
