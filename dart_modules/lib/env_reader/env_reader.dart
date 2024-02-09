part of '../common.dart';

Map<String, String> loadEnv() {
  final envFile = File('.env');
  final lines = envFile.readAsLinesSync();
  final env = <String, String>{};

  for (final line in lines) {
    final parts = line.split('=');
    if (parts.length == 2) {
      env[parts[0].trim()] = parts[1].trim();
    }
  }

  return env;
}
