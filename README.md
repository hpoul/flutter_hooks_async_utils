
Replaced with https://pub.dev/packages/hooks_async_utils

https://github.com/hpoul/flutter_async_utils/tree/master/packages/hooks_async_utils

# flutter_hooks_async_utils

flutter_hooks version of https://pub.dev/packages/flutter_async_utils

Simplifies creation of callback methods which are disabled while an asynchronous task is running.

# Example

```dart
class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = useState(0);
    final incrTask = useAsyncTask();
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(incrTask.task?.progressLabel ?? ''),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counter.value.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrTask.asyncTaskCallback((progress) async {
          progress.progressLabel = 'Preparing incrementing..';
          await Future.delayed(const Duration(seconds: 1));
          progress.progressLabel = 'Starting increment...';
          await Future.delayed(const Duration(seconds: 1));
          counter.value += 1;
          progress.progressLabel = 'Finishing up...';
          await Future.delayed(const Duration(seconds: 1));
        }),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }
}
```
