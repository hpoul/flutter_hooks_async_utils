import 'package:flutter/foundation.dart';
import 'package:flutter_async_utils/flutter_async_utils.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

AsyncTaskHook useAsyncTask() {
  final asyncTaskHook = useMemoized(() => AsyncTaskHook());
  return useListenable(asyncTaskHook);
}

class AsyncTaskHook with ChangeNotifier {
  late final _manager = FutureTaskManager(
      showErrorDialog: (ErrorDetails error) {},
      onChanged: (FutureTask? task) {
        notifyListeners();
      });

  FutureTask? get task => _manager.task;

  VoidCallback? asyncTaskCallback<U>(
      Future<U> Function(TaskProgress progress) progress) {
    return _manager.asyncTaskCallback(progress);
  }
}
