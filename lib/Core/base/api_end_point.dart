class ApiEndPoints {
  static const String baseUrl = 'http://65.0.77.129:3600';
  static const String signUp = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';
  static const String duplicate = '$baseUrl/auth/duplicate';
  static const String updateUser = '$baseUrl/user/';
  static const String updateDog = '$baseUrl/dog/';
  static const String getUser = '$baseUrl/user/';
  static const String addDog = '$baseUrl/dog';
  static const String uploadImage = '$baseUrl/image';
  static const String swipe = '$baseUrl/user/swiper';
  static const String loginWithGoogle = '$baseUrl/auth/login_with_google';
  static const String loginWithFacebook = '$baseUrl/auth/login_with_fb';
}
