import 'package:app/admin/Admin/dash.dart';
import 'package:app/admin/Admin/profit.dart';

import 'package:app/demo/getapi/provider.dart';
import 'package:app/demo/logs.dart';
import 'package:app/publisher/publish.dart';
import 'package:app/publisher/pubdash.dart';
import 'package:app/user/Views/bookdetails.dart';
import 'package:app/user/Views/page5.dart';
import 'package:app/user/api_all/Auth/constants.dart';
import 'package:app/main.dart';
import 'package:app/user/pages/loginpage.dart';
import 'package:app/user/pages/signup.dart';
import 'package:app/user/pages/updateIp/update_ip_page.dart';
import 'package:app/user/widgets/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

List<GetPage> pages = [
  GetPage(
    name: '/home',
    page: () => const MyHomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/welcome',
    page: () => const WelcomePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/bookdetails',
    page: () => BookDetails(id: "1"),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/try',
    page: () => const TryPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
   GetPage(
    name: '/dash',
    page: () => const DashboardPage (),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: '/signup',
    page: () => const Signup (),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
    GetPage(
    name: '/profit',
    page: () => const ProfitPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
   GetPage(
    name: '/publish',
    page: () => const PublishPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
   GetPage(
    name: '/pubprofile',
    page: () => const PubProfilePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
     GetPage(
    name: '/pubdash',
    page: () => const PubProfilePage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
      GetPage(
    name: '/log',
    page: () => const LogsPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
    GetPage(
    name: '/acc',
    page: () => const AccountPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  
       GetPage(
    name: '/upip',
    page: () => const UpdateIpPage(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 500),
  ),


];

class RouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = getStringAsync(accessToken);
    if (token.isEmptyOrNull) {
      return const RouteSettings(name: '/login');
    } else {
      return null;
    }
  }
}
