import 'package:ishker_24/features/bank/data/models/register_client_post_model.dart';

abstract class RegisterClientRepo {
  Future<void> registerClient(RegisterClientPostModel model);
}
