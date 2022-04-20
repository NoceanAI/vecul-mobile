abstract class API{
  Future<dynamic> get(String url, {Map<String, String> headers =const {}}) async{}

  Future<dynamic> post(String url, {Map<String, String> headers = const{}, body}) async{}

  Future<dynamic> put(String url, {Map<String, String> headers = const{}, body}) async{}

  Future<dynamic> patch(String url, {Map<String, String> headers = const{}, body}) async{}

  Future<dynamic> delete(String url, {Map<String, String> headers = const{}}) async{}
}