import '../api/api_base_helper.dart';
import '../config/server_addresses.dart';
import '../models/SignInResponse.dart';



class AllRepository {
  static ApiBaseHelper _helper = ApiBaseHelper();

//admin log in api:
  static Future<SignInResponse> adminLogin(String email,String password) async{
    Map<String, dynamic> req = {"email": email,"password":password};
    final response = await _helper.post(ServerAddresses.userLogin,req);
    return SignInResponse.fromJson(response);
  }


}



