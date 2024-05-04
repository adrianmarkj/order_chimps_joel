
abstract class LocalRepo {
  void saveFcmToken(String fcmToken);

  Future<String?> getFcmToken();

  void removeFavorite(String id);

  Future<List<String>> getFavoriteList();
}
