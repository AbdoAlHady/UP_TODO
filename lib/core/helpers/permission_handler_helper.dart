import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerHelper {
  static Future<void> requestPermission() async {
    PermissionStatus notificationStatus =
        await Permission.notification.request();
    if (notificationStatus == PermissionStatus.granted) {
    } else if (notificationStatus == PermissionStatus.denied) {
      await Permission.notification.request();
    } else if (notificationStatus == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }
}
