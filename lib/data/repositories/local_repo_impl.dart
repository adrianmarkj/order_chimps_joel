import '../../domain/repositories/local_repo.dart';
import '../datasources/local_datasource.dart';

class LocalRepoImpl implements LocalRepo {
  final LocalDatasource localDatasource;

  LocalRepoImpl({required this.localDatasource});

  @override
  Future<String?> getFcmToken() {
    return localDatasource.getFcmToken();
  }

  @override
  void saveFcmToken(String fcmToken) {
    return localDatasource.saveFcmToken(fcmToken);
  }

  @override
  void removeFavorite(String id) {
    return localDatasource.removeFavorite(id);
  }

  @override
  Future<List<String>> getFavoriteList(){
    return localDatasource.getFavoriteList();
  }
}
