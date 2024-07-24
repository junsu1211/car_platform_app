import 'package:get/get.dart';
import 'package:car_platform_app/src/shared/global.dart';

class Provider extends GetConnect {

    @override
    void onInit() {
      allowAutoSignedCert = true;
      httpClient.baseUrl = 'http://10.0.2.2:3000';
      httpClient.addRequestModifier<void>((request) {
        request.headers['Accept'] = 'application/json';
        if(request.url.toString().contains('/api/')){
          request.headers['Authorization'] = 'Bearer ${Global.accessToken}';
        }
        return request;
      });
      super.onInit();
  }
}