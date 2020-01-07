import 'package:prog_day/prog_day.dart';

Future main() async {
  final app = Application<SrcChannel>()
      ..options.configurationFilePath = "config.yaml";

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}