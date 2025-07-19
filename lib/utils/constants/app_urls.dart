enum NetworkingMethods {
  POST,
  GET,
  PUT,
  DELETE,
}

class AppUrls {
  static const String BASE_URL = "https://293d-77-246-50-124.ngrok-free.app";
  static const Auth auth = Auth();
  static const Tasks tasks = Tasks();
}

class Auth {
  const Auth();
  final String signIn = "/auth/sign-in";
  final String signUp = "/auth/sign-up";
  final String me = "/users/profile";
}

class Tasks {
  const Tasks();
  final String tasks = "/tasks";
}
