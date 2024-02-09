///Get
class Get {
  final String path;
  const Get({this.path = '/'});

  static void handleGetRequest(
      {required var decoratorType,
      required String methodName,
      required String path}) {
    print('''
DecoratorType: $decoratorType
methodName: $methodName
path: $path
''');
  }
}
