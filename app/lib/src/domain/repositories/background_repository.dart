abstract class IBackgroundRepository {
  const IBackgroundRepository({required this.startCallback});

  final Function? startCallback;

  Future<void> start();

  Future<bool> isEnabled();

  Future<void> initService();

  Future<void> requestPermissions();

  Future<bool> isBackgroundProcessRunning();
}
