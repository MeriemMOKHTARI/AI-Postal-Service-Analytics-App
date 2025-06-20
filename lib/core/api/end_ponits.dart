class EndPoint {
  static String baseUrl = "http://192.168.1.79:8000/";
  static String signIn = "users/login/";
  static String signUp = "users/createuser/";
  static String posts = "feedback/employeeqr/";
  static String getUser(dynamic id) {
    return "users/list/$id/";
  }
}

class ApiKey {
  static String status = "status";
  static String errorMessage = "errorMessage";
  static String email = "email";
  static String password = "password";
  static String token = "token";
  static String id = "id";
  static String message = "message";
  static String name = "username";
  static String firstname = "first_name";
  static String lastname = "last_name";
  static String is_active = "is_active";

  static var postTitle;

  static var postId;

  static var postContent;

  static var postCreatedAt;

  static var postFirstName;

  static var postLastName;
}
//