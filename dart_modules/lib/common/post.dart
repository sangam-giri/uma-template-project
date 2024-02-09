///Post
class Post {
  final String path;
  const Post({this.path = '/'});

  static void handlePostRequest(
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
