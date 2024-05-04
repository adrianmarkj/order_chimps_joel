import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/failures/failures.dart';

abstract class FileDataSource {
  Future<Either<CacheFailure, File>> downloadFile(String url, String fileName);

  Future<bool> isCacheFileExists(File cacheFile);

  Future<File> getCacheFileByName(String fileName);
}

class FileDataSourceImpl implements FileDataSource {
  @override
  Future<Either<CacheFailure, File>> downloadFile(
      String url, String fileName) async {
    try {
      final cachedFile = await getCacheFileByName(fileName);
      final fileExists = await isCacheFileExists(cachedFile);
      if (!fileExists) {
        final httpClientRequest = await HttpClient().getUrl(Uri.parse(url));
        final httpClientResponse = await httpClientRequest.close();
        await httpClientResponse.pipe(cachedFile.openWrite());
      }
      return right(cachedFile);
    } catch (e) {
      return left(CacheFailure());
    }
  }

  @override
  Future<bool> isCacheFileExists(File cacheFile) async {
    return await cacheFile.exists();
  }

  @override
  Future<File> getCacheFileByName(String fileName) async {
    final cacheDirectory = await getApplicationDocumentsDirectory();
    return File('${cacheDirectory.path}/$fileName');
  }
}
