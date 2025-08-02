class ApiEndpoints {
  ApiEndpoints._();

  // Timeouts
  static const connectionTimeout = Duration(seconds: 1000);
  static const receiveTimeout = Duration(seconds: 1000);

  // Base URLs
  static const String serverAddress = "http://10.0.2.2:5050";
  static const String baseUrl = "$serverAddress/api/";
  static const String imageUrl = "$serverAddress/uploads/";


  // User endpoints
  static const String registerUser = "auth/register";
  static const String loginUser = "auth/login";
  static const String getAllUsers = "user/";
  static const String uploadImg = "user/uploadImg";
  static String getUserById(String id) => "user/$id";
  static String updateUserById(String id) => "user/$id";
  static String deleteUserById(String id) => "user/$id";
  static const String adminbrand = "admin/brand";
  static const String adminproduct = "admin/product";
  static const String order = "order";
}