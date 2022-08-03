class ApiEndPoints {
  static const int port = 3600;
  static const String baseUrl = 'http://65.0.77.129:3600';
  static const String signUp = '$baseUrl/auth/register';
  static const String login = '$baseUrl/auth/login';
  static const String duplicate = '$baseUrl/auth/duplicate';
  static const String updateUser = '$baseUrl/user/';
  static const String updateDog = '$baseUrl/dog/';
  static const String getUser = '$baseUrl/user/';
  static const String addDog = '$baseUrl/dog';
  static const String uploadImage = '$baseUrl/image';
  static const String loginWithGoogle = '$baseUrl/auth/login_with_google';
  static const String loginWithFacebook = '$baseUrl/auth/login_with_fb';
  static const String loginWithApple = '$baseUrl/auth/login_with_apple';
  static const String verifyPassword = '$baseUrl/user/password_verification';
  static const String updatePassword = '$baseUrl/user/update_password';
  static const String forgotPassword = '$baseUrl/user/forget_password';
  static const String upComingEvent = '$baseUrl/event/upcoming';
  static const String searchEvent = '$baseUrl/event?query=';
  static const String disLikePerson = '$baseUrl/user/swipeLeft/';
  static const String reportUser = '$baseUrl/report';
  static const String blockUser = '$baseUrl/user/';
  static const String resendEmail = '$baseUrl/user/resent_veri_email';
  static const String likePerson = '$baseUrl/user/swipeRight/';
  static const String disLikeDog = '$baseUrl/dog/swipeRight/';
  static const String likeDog = '$baseUrl/dog/swipeLeft/';

  static const String MQTTClientUrl = 'ws://65.0.77.129';
  static const String message = '$baseUrl/message/';
  static const String chatRoom = '$baseUrl/chat_room/';

  static const String bookTicket = '$baseUrl/ticket/';

  static String swipe(int pageNo, int limitNo) {
    return "$baseUrl/user/swiper?page=$pageNo&limit=$limitNo";
  }

  static String dogSwipe(int pageNo, int limitNo) {
    return "$baseUrl/dog/swiper?page=$pageNo&limit=$limitNo";
  }
}
