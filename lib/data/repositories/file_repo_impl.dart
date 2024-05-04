import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/failures/failures.dart';
import '../../domain/repositories/file_repo.dart';
import '../datasources/file_datasource.dart';

class FileRepoImpl implements FileRepo {
  final FileDataSource fileDataSource;

  FileRepoImpl({required this.fileDataSource});

  @override
  Future<Either<CacheFailure, File>> downloadFile(String url, String fileName) {
    return fileDataSource.downloadFile(url, fileName);
  }

  @override
  Future<File> getCacheFileByName(String fileName) {
    return fileDataSource.getCacheFileByName(fileName);
  }

  @override
  Future<bool> isCacheFileExists(File cacheFile) {
    return fileDataSource.isCacheFileExists(cacheFile);
  }
}
