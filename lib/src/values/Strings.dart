class Strings {
  //Login Screen Strings
  static const loginTitle = "Login";
  static const loginButton = "Login";

  //Signup Screen Strings
  static const sighupTitle = "Signup";
  static const sighupButton = "Signup";

  //Forgot Password Screen Strings
  static const forgotPasswordTitle = "Forgot Password";
  static const forgotPasswordButton = "Send Email";

  //Home Screen Strings
  static const appName = "Movie Night";
  static const upcoming = "Upcoming";
  static const topRated = "Top Rated";
  static const trending = "Trending";
  static const popular = "Popular";

  //Movie Details Screen Strings
  static const movieRate = "Rate : ";
  static const movieLanguage = "Language : ";
  static const movieReleaseDate = "Release Date : ";
  static const movieOverview = "Overview";
  static const showMore = "Show more";
  static const showLess = "   Show less";

  //Abut Us Screen Strings
  static const myImage = "images/Image.jpg";
  static const myName = "Rado Dayef";
  static const myEmail = "rado.dayef@gmail.com";

  //Shared Between Strings
  static const success = "success";
  static const error = "error";
  static const userName = "User Name";
  static const emailAddress = "Email Address";
  static const password = "Password";
  static const logout = "Logout";
  static const resetPassword = "Reset Password";
  static const profile = "Profile";
  static const aboutUs = "About Us";

  //Validation Strings
  static const atSign = "@";
  static const emailEmpty = "Email Address Can't be empty";
  static const emailMessingAtSign = "This email is missing '@'";
  static const passwordEmpty = "Password Can't be empty";
  static const passwordLessThen8 = "Password can't be less then 8 letters";
  static const passwordLargerThen24 = "Password can't be larger then 24 letters";
  static const userNameEmpty = "User Name Can't be empty";
  static const userNameLessThen4 = "User Name can't be less then 4 letters";
  static const userNameLargerThen24 = "User Name can't be larger then 24 letters";

  //Text Buttons Strings
  static const loginForgotPasswordTextButton = "Forgot Password?";
  static const loginTextButton1 = "I don't have an account";
  static const loginTextButton2 = "SignUp ?";
  static const signupTextButton1 = "Already have an account";
  static const signupTextButton2 = "Login ?";
  static const forgotPasswordTextButton1 = "Remembered my old password";
  static const forgotPasswordTextButton2 = "Login ?";

  //Error Cods Strings
  static const userNotFoundErrorCode = "user-not-found";
  static const emailAlreadyInUseErrorCode = "email-already-in-use";
  static const wrongPasswordErrorCode = "wrong-password";

  //Assets Strings
  static const timesFont = "Times";
  static const splashAnimation = "images/Splash2.json";

  //Avatars Strings
  static const defaultAvatar = "https://cdn-icons-png.flaticon.com/128/552/552909.png";
  static const avatar1 = "https://cdn-icons-png.flaticon.com/128/924/924874.png";
  static const avatar2 = "https://cdn-icons-png.flaticon.com/128/506/506185.png";
  static const avatar3 = "https://cdn-icons-png.flaticon.com/128/2922/2922561.png";

  //Dialogs Strings
  static const checkYourInternetConnection = "Failed to connect our data base please check your internet connection.";
  static const emailSendSuccessfullyToChangePassword = "Email send successfully, now you can change your password from that email.";
  static const emailNotFound = "The email address is not in our database try to signup with that email.";
  static const emailInUse = "The email address is already in use by another account..";
  static const wrongPassword = "Wrong Password.";

  //Firebase Strings
  static const usersCollection = "users";
  static const nameDocument = "Name";
  static const emailDocument = "Email";
  static const imageDocument = "Image";

  //API Strings
  static const results = "results";
  static const cast = "cast";
  static const baseURL = "https://api.themoviedb.org/3";
  static const apiKey = "api_key=********************************";
  static const imagesBaseUrl = "https://image.tmdb.org/t/p/original";
  static const youtubeBaseUrl = "https://www.youtube.com/embed/";
  static const defaultCastImage = "https://cdn-icons-png.flaticon.com/128/2922/2922472.png";
  static const upcomingMoviesURL = "$baseURL/movie/upcoming?$apiKey";
  static const topRatedMoviesURL = "$baseURL/movie/top_rated?$apiKey";
  static const trendingMoviesURL = "$baseURL/trending/movie/day?$apiKey";
  static const popularMoviesURL = "$baseURL/movie/popular?$apiKey";
}
