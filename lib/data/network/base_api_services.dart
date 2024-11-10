abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> patchApi(dynamic data,String url);

  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> put2Api(dynamic data, String url);
  Future<dynamic> putApi(String url);
  Future<dynamic> deleteApi(String url);

  Future<dynamic> postMultipartApi(dynamic data, String image, String url);
  Future<dynamic> postMultipartApi1(dynamic data, List<String> outerimg, List<String> innerimg, String url);

  Future<dynamic> putMultipartApi(dynamic data, String image, String url);

  Future<dynamic> addProductMultipart(dynamic data, List<String> imglist, String url);
}
