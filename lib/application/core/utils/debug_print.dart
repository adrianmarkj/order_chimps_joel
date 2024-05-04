import 'app_enums.dart';

abstract class DebugPrint {
  String? type;
  Object object;
  Logger logger;

  DebugPrint(this.object, this.logger, {this.type}) {
    print("\x1B[${logger.code}m ${type != null ? '[${type!.toUpperCase()}] ' : ""}$object \x1B[0m");
  }
}

class PrintError extends DebugPrint {
  @override
  String? type;
  @override
  Object object;

  PrintError(this.object, {this.type}) : super(object, Logger.red, type: type);
}

class PrintWarning extends DebugPrint {
  @override
  String? type;
  @override
  Object object;

  PrintWarning(this.object, {this.type}) : super(object, Logger.yellow, type: type);
}

class PrintInfo extends DebugPrint {
  @override
  String? type;
  @override
  Object object;

  PrintInfo(this.object, {this.type}) : super(object, Logger.green, type: type);
}

// create for display the API response request
class PrintResponse extends DebugPrint {
  @override
  String? type;
  @override
  Object object;

  PrintResponse(this.object, {this.type}) : super(object, Logger.cyan, type: type);
}

class PrintAction extends DebugPrint {
  String? type;
  Object object;

  PrintAction(this.object, {this.type}) : super(object, Logger.blue, type: type);
}