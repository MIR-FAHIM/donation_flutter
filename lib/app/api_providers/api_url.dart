//155 api

class ApiClient {
  String api_token = '';
  static const String baseUrl =
      'https://donation.biswasandbrothers.com/public/';
  static const String login = '${baseUrl}api/login';
  static const String changeDonateAmountForUser =
      '${baseUrl}api/updateUserAmount';
  static const String getDonationProjectList =
      '${baseUrl}api/getDonationProject';
  static const String getProBank = '${baseUrl}api/getBanks';
  static const String getActivity = '${baseUrl}api/getActivityByProId';
  static const String getUserDonation = '${baseUrl}api/getDonationProject';
  static const String getAllUser = '${baseUrl}api/getUsers';
  static const String getProjectImages = '${baseUrl}api/getProjectImages';
  static const String getAllDonation = '${baseUrl}api/allTransactions';
  static const String getAllDonationByUserId = '${baseUrl}api/getTransactions';
  static const String register = '${baseUrl}api/register';
  static const String getReview = '${baseUrl}api/getReviewByProject';
  static const String addImages = '${baseUrl}api/addProjectImages';
  static const String addTransactionByUser =
      '${baseUrl}api/addTransactionByUser';
  static const String addReview = '${baseUrl}api/addReview';
  static const String updateAmountAndTrsStatus =
      '${baseUrl}api/updateUserAmountAndTransStatus';
  static const String getProjectAmount = '${baseUrl}api/getProjectAmount';
  static const String addActivity = '${baseUrl}api/addActtivity';
  static const String addBank = '${baseUrl}api/addBank';
  static const String getDonationListByProject =
      '${baseUrl}api/getDonationListByProject';
}
