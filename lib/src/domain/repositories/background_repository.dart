abstract class IBackgroundRepository {
  Future<bool> isEnabled();

  Future<void> initService();

  Future<void> requestPermissions();
}
