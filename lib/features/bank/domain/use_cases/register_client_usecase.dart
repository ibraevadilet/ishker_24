import 'package:flutter/material.dart';
import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';
import 'package:ishker_24/features/bank/domain/repositories/register_client_repository.dart';

class RegisterClientUseCase {
  final RegisterClientRepo repo;
  RegisterClientUseCase({
    required this.repo,
  });

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final commentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<String> registerClient(RegisterClientPostModel model) async {
    try {
      return await repo.registerClient(model);
    } catch (e) {
      rethrow;
    }
  }
}
