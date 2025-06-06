import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app/common/widgets/toast.dart';

/// SHA256
String duSHA256(String input) {
  String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO'; // 加盐
  var bytes = utf8.encode(input + salt);
  var digest = sha256.convert(bytes);

  return digest.toString();
}

String getRandomString(int length){
  const chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rnd = Random();
  return String.fromCharCodes(Iterable.generate(length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

Future<bool> request_permission(Permission permission) async{
  var permissionStatus = await permission.status;
  print("permission_status------$permissionStatus");
  if(permissionStatus != PermissionStatus.granted) { //here
    var status = await permission.request();

    if(status != PermissionStatus.granted) {  //here
      print("denied");
      toastInfo(msg:"Please open the setting page to set permissions");
      await openAppSettings();
      return false;
    }
  }

  return true;
}
