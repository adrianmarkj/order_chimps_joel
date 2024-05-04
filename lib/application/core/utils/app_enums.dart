enum DeviceOS { android, huawei }

enum Logger {
  black("30"),
  red("31"),
  green("32"),
  yellow("33"),
  blue("34"),
  magenta("35"),
  cyan("36"),
  white("37");

  final String code;

  const Logger(this.code);
}

enum SecurityFailureType { ADB, ROOT, JAILBROKEN, EMU, SECURE, SOURCE, HOOK, DEBUGGER, OBFUSCATION, BINDING }