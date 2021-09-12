import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('ext_storage');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });



  test('getExternalStorageDirectory', () async {
    var actual = await ExtStorage.getExternalStorageDirectory();
    print(actual);
    expect(ExtStorage.getExternalStorageDirectory(), actual);
  });
  test('getExternalStoragePublicDirectory', () async {});
}
