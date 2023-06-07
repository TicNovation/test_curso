import '../models/user_model.dart';
import '../providers/request_provider.dart';

class LoginController {

  final user = User.fromtest();
  final RequestProvider _requestProvider =  RequestProvider();

  LoginController();

  Future<bool> login() async {
    final bool resp = await _requestProvider.makeRequest(user.toMap());

    return resp;
  }


}