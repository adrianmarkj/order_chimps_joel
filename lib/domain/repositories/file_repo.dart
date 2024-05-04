import 'dart:io';

import 'package:dartz/dartz.dart';

import '../failures/failures.dart';

abstract class FileRepo {
  Future<Either<CacheFailure, File>> downloadFile(String url, String fileName);

  Future<bool> isCacheFileExists(File cacheFile);

  Future<File> getCacheFileByName(String fileName);
}
