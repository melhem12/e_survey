class AppUrl {

  static const String baseUrl = 'http://192.168.16.102:8083/api/v1';

  static const String login = baseUrl + '/auth/login';
 // static const String forgotPassword = baseUrl + '/forgot_password';
  static const String dailySurvey = baseUrl + '/auth/esurveyController/getDailySurvey?userId=';
  static const String surveyCount = baseUrl + '/auth/esurveyController/getSurveyCount?userId=';
  static const String companiesList = baseUrl + '/auth/constant/companiesList';


}