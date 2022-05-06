class AppUrl {

  static const String baseUrl = 'http://192.168.16.106:8083/api/v1';

  static const String login = baseUrl + '/auth/login';
 // static const String forgotPassword = baseUrl + '/forgot_password';
  static const String dailySurvey = baseUrl + '/esurveyController/getDailySurvey?userId=';
  static const String surveyCount = baseUrl + '/esurveyController/getSurveyCount?userId=';
  static const String companiesList = baseUrl + '/constant/companiesList';
  static const String eSurveySearch = baseUrl + '/esurveyController/eSurveySearch?';
  static const String searchSurvey = baseUrl + '/esurveyController/searchSurvey?';


  static const String claimsDetails = baseUrl + '/esurveyController/getClaimDetails?';
  static const String deleteCarsSurvey = baseUrl + '/esurveyController/deleteCarsSurvey?carId=';
  static const String insertLossCar = baseUrl + '/esurveyController/insertLossCar';
  static const String insertCarsSurvey = baseUrl + '/esurveyController/insertCarsSurvey';
  static const String getCarDetails = baseUrl + '/esurveyController/getCarDetails?';
  static const String gendersList = baseUrl + '/constant/genderList';
  static const String updateLossCarPersonalInformation = baseUrl + '/esurveyController/updateLossCarPersonalInformation';
  static const String updateLossCar = baseUrl + '/esurveyController/updateLossCar';
  static const String doors = baseUrl + '/constant/getDoors';
  static const String bodyType = baseUrl + '/constant/getBodyType';
  static const String vehicleSize = baseUrl + '/constant/getVehicleSize';
  static const String description = baseUrl + '/constant/getDescriptions';
  static const String directions = baseUrl + '/constant/getDirections';
  static const String partGroup = baseUrl + '/constant/getPartGroup';
  static const String carBrand = baseUrl + '/constant/carBrandList';

  static const String carTrademarkList = baseUrl + '/constant/carTrademarkList';
  static const String getAllDamagedParts = baseUrl + '/esurveyController/getAllDamagedParts?';
  static const String getCarParts = baseUrl + '/esurveyController/getCarParts?';
  static const String addDamagePart = baseUrl + '/esurveyController/insertDamagedParts';
  static const String getPartMet = baseUrl + '/esurveyController/getPartMet?';
  static const String sendImage = baseUrl + '/esurveyController/sendImage';

  static const String finishSurvey = baseUrl + '/esurveyController/finishSurvey';
  static const String insertRequestStatus = baseUrl + '/esurveyController/insertRequestStatus';

  static const String policyTypes = baseUrl + '/constant/getPolicyType';
  static const String insuranceCompanies = baseUrl + '/constant/getInsuranceCompany';
  static const String missions = baseUrl + '/temaController/missions';


}