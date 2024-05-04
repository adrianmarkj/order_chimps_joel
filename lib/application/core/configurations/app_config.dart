

import '../utils/app_enums.dart';

class AppConfig {
  //TODO Releases - HUAWEI : {sourceVerification = false}
  //TODO Disable Screenshot take
  //TODO Change Session Time out 2 * 60
  //TODO Change Release Version
  static DeviceOS deviceOS = DeviceOS.android;

  ///Security Config
  static bool isRootCheckAvailable = false;
  static bool isCheckJailBroken = false;
  static bool isEmulatorCheckAvailable = false;
  static bool isSimulatorCheckAvailable = false;
  static bool isADBCheckAvailable = false;
  static bool isSSLAvailable = false;

  static bool isSourceVerificationAvailable = false;
}