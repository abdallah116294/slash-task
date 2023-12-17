abstract class ApiConsumer{
  Future<Map<String,dynamic>>get(String path,{Map<String,dynamic>?queryParametes});
}