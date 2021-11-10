class AppUrl {

  static const String baseUrl = 'http://192.168.16.106:8083/api/v1';

  static const String login = baseUrl + '/auth/login';
 // static const String forgotPassword = baseUrl + '/forgot_password';
  static const String dailySurvey = baseUrl + '/auth/esurveyController/getDailySurvey?userId=';
  static const String surveyCount = baseUrl + '/auth/esurveyController/getSurveyCount?userId=';
  static const String companiesList = baseUrl + '/auth/constant/companiesList';
  static const String eSurveySearch = baseUrl + '/auth/esurveyController/eSurveySearch?';
  static const String claimsDetails = baseUrl + '/auth/esurveyController/getClaimDetails?';
  static const String deleteCarsSurvey = baseUrl + '/auth/esurveyController/deleteCarsSurvey?carId=';
  static const String insertLossCar = baseUrl + '/auth/esurveyController/insertLossCar';
  static const String insertCarsSurvey = baseUrl + '/auth/esurveyController/insertCarsSurvey';
  static const String getCarDetails = baseUrl + '/auth/esurveyController/getCarDetails?';
  static const String gendersList = baseUrl + '/auth/constant/genderList';
  static const String updateLossCarPersonalInformation = baseUrl + '/auth/esurveyController/updateLossCarPersonalInformation';
  static const String updateLossCar = baseUrl + '/auth/esurveyController/updateLossCar';
  static const String doors = baseUrl + '/auth/constant/getDoors';
  static const String bodyType = baseUrl + '/auth/constant/getBodyType';
  static const String vehicleSize = baseUrl + '/auth/constant/getVehicleSize';
  static const String description = baseUrl + '/auth/constant/getDescriptions';
  static const String directions = baseUrl + '/auth/constant/getDirections';
  static const String partGroup = baseUrl + '/auth/constant/getPartGroup';
  static const String carBrand = baseUrl + '/auth/constant/carBrandList';

  static const String carTrademarkList = baseUrl + '/auth/constant/carTrademarkList';
  static const String getAllDamagedParts = baseUrl + '/auth/esurveyController/getAllDamagedParts?';
  static const String getCarParts = baseUrl + '/auth/esurveyController/getCarParts?';


}