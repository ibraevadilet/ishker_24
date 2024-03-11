abstract class SendNalogDataRepo {
  Future<void> sendNalogData(
    Map<String, dynamic> sendModel,
    String type,
    String pinCode,
  );
}
