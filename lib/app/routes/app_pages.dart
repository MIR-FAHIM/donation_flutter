import 'package:donation_flutter/app/modules/Auth/login/views/registration_page.dart';
import 'package:donation_flutter/app/modules/admin/bindings/admin_binding.dart';
import 'package:donation_flutter/app/modules/admin/views/all_donation_list.dart';
import 'package:donation_flutter/app/modules/admin/views/all_user/add_donate_tabbar.dart';
import 'package:donation_flutter/app/modules/admin/views/all_user/add_donation_for_user_bank_form.dart';
import 'package:donation_flutter/app/modules/admin/views/all_user/add_user.dart';
import 'package:donation_flutter/app/modules/admin/views/all_user/all_user.dart';
import 'package:donation_flutter/app/modules/admin/views/project/activity/add_activity.dart';
import 'package:donation_flutter/app/modules/admin/views/project/activity/project_activity_list.dart';
import 'package:donation_flutter/app/modules/admin/views/project/bank/add_bank.dart';
import 'package:donation_flutter/app/modules/admin/views/project/bank/bank_list_project.dart';
import 'package:donation_flutter/app/modules/admin/views/project/donation_list_by_pro_id.dart';
import 'package:donation_flutter/app/modules/admin/views/project/project_dashboard.dart';
import 'package:donation_flutter/app/modules/admin/views/project/project_list.dart';
import 'package:donation_flutter/app/modules/home/views/activity/project_activity_list.dart';
import 'package:donation_flutter/app/modules/home/views/gallary/gallary_view.dart';
import 'package:donation_flutter/app/modules/home/views/profile/profile_view.dart';
import 'package:donation_flutter/app/modules/home/views/project_details_for_donation.dart';
import 'package:donation_flutter/app/modules/home/views/review/add_review.dart';
import 'package:donation_flutter/app/modules/home/views/review/get_review_project.dart';
import 'package:donation_flutter/app/modules/home/views/transactions/add_donation_form.dart';
import 'package:donation_flutter/app/modules/home/views/transactions/all_transactions_by_user.dart';
import 'package:donation_flutter/app/modules/home/views/transactions/greeting_page.dart';
import 'package:donation_flutter/app/modules/home/views/transactions/select_payment_way.dart';
import 'package:donation_flutter/app/modules/home/widgets/procedure.dart';
import 'package:donation_flutter/app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'package:donation_flutter/app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:get/get.dart';


import '../modules/Auth/change_password/bindings/change_password_binding.dart';
import '../modules/Auth/change_password/views/change_password_view.dart';


import '../modules/Auth/login/bindings/login_binding.dart';
import '../modules/Auth/login/views/login_view.dart';



import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';



import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;
  // static const INITIAL = Routes.Test;

  static final routes = [

    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.PROFILEVIEW,
      page: () => ProfileView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.ADDDONATIONFORM,
      page: () => AddDonationForm(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.SUCCESS,
      page: () => SuccessPage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.USERDONATIONBYID,
      page: () => AllDonationListByUserId(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.ACTIVITYLIST,
      page: () => ProjectActivityList(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.PAYMENTWAY,
      page: () => PaymentWay(),
      binding: HomeBinding(),
    ),



    GetPage(
      name: _Paths.DETAILS,
      page: () => ProjectDetails(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.ALLUSER,
      page: () => AllUserList(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.ALLDONATIONLISTBYPRO,
      page: () => DonationListByProId(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.ADDUSER,
      page: () => AddUser(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.ADDDONATIONTABBAR_ADMIN,
      page: () => AddDonationTabBar(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.ADDBANK,
      page: () => AddBank(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.BANK_LIST_ADMIN,
      page: () => BankListAdmin(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.DONATION_LIST_PRO_ID,
      page: () => DonationListByProId(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.ADDACTIVITY,
      page: () => AddActivity(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.ACTIVITYLISTADMIN,
      page: () => ProjectActivityListAdmin(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.ADDDONATIONUSER,
      page: () => AddDonationForUser(),
      binding: AdminBinding(),
    ),

    GetPage(
      name: _Paths.ALLDONATIONLIST,
      page: () => AllDonationList(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTLISTADMIN,
      page: () => AdminProjectList(),
      binding: AdminBinding(),
    ),
    GetPage(
      name: _Paths.PROJECTDASHBOARD,
      page: () => ProjectDashboard(),
      binding: AdminBinding(),
    ),




    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: LoginBinding(),
    ),


    //BuyNowPackageView


    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),

    GetPage(
      name: _Paths.PRODECURE,
      page: () => ProcedureView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.GALLARY,
      page: () => ProjectGallary(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.ADDREVIEW,
      page: () => GiveReviewScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWLIST,
      page: () => ReviewListView(),
      binding: HomeBinding(),
    ),

    // Westzone bill
    // bill start







    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),


    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),






    GetPage(
      name: _Paths.WEBVIEW,
      page: () => WebviewView(),
      binding: WebviewBinding(),
    ),


    //daily report


    // GetPage(
    //   name:  _Paths.ACCOUNT_SETTING,
    //   page: ()=>  AccountSettingView(),
    //   binding:  MobileBankingBinding()
    // )
  ];
}
