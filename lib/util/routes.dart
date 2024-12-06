import 'package:get/get.dart';
import 'package:global_health_opinion_sample/views/article/article_detail.dart';
import 'package:global_health_opinion_sample/views/new_reviews/new_review_fields_view/case_successpage.dart';
import 'package:global_health_opinion_sample/views/notification/notification_page.dart';
import 'package:global_health_opinion_sample/views/profile_view/edit_profile.dart';
import 'package:global_health_opinion_sample/views/profile_view/profile_view.dart';

import '../views/article/article.dart';
import '../views/auth_view/forgetpassword.dart/forget_password.dart';
import '../views/auth_view/forgetpassword.dart/forgetpasswordemail.dart';
import '../views/auth_view/forgetpassword.dart/forgetpasswordotp.dart';
import '../views/auth_view/login_page.dart';
import '../views/auth_view/otp_confirmation.dart';
import '../views/auth_view/register_page.dart';
import '../views/home_page/homepage.dart';
import '../views/inpatient/inpatient.dart';
import '../views/mainpage.dart';
import '../views/new_reviews/case_detail.dart';
import '../views/new_reviews/create_new_review.dart';
import '../views/new_reviews/new_review_fields_view/medical_details.dart';
import '../views/new_reviews/new_review_fields_view/medicalreports.dart';
import '../views/new_reviews/new_review_fields_view/patientinfo.dart';
import '../views/new_reviews/new_review_fields_view/payments.dart';
import '../views/new_reviews/new_review_fields_view/preview.dart';
import '../views/peer_review/peer_review.dart';
import '../views/splash_view/splash_diologue.dart';
import '../views/splash_view/splash_screen.dart';
import '../views/telemedicine/appointment/add_appointmentmember.dart';
import '../views/telemedicine/appointment/appointmentforpatient.dart';
import '../views/telemedicine/appointment/book_appointment.dart';
import '../views/telemedicine/appointment/doctor_detail.dart';
import '../views/telemedicine/appointment/patients_list.dart';
import '../views/telemedicine/doctors/doctorlist.dart';
import '../views/telemedicine/schedule_calender/calender.dart';
import '../views/telemedicine/specialities/specialities.dart';
import '../views/telemedicine/specialities/specialitity_detail.dart';
import '../views/telemedicine/telemedicine.dart';
import '../views/telemedicine/your_prescription/your_prescription.dart';

List<GetPage<dynamic>>? getPagesroutes = [
  GetPage(
    name: PageRouteName.splashDiologue,
    page: () => SplashDiologue(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 400),
  ),
  GetPage(
    name: PageRouteName.splash,
    page: () => SplashScreen(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.login,
    page: () => LoginPage(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.register,
    page: () => RegisterPage(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.homepage,
    page: () => HomePage(
      onNavigate: (p0) {},
    ),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.newreviews,
    page: () => CreateNewReview(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.profile,
    page: () => ProfileView(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.forgetPassword,
    page: () => ForgetPassword(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.medicaldetails,
    page: () => MedicalDetails(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.payments,
    page: () => Payments(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.otpConfirmation,
    page: () => OtpConfirmation(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.preview,
    page: () => Preview(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
      name: PageRouteName.mainpage,
      page: () => MainPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.patientinfo,
      page: () => PatientInfo(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.telemedicine,
      page: () => Telemedicine(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
    name: PageRouteName.medicalreports,
    page: () => MedicalReports(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
      name: PageRouteName.specialities,
      page: () => Specialities(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.peerreview,
      page: () => PeerReview(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.article,
      page: () => Article(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.inpatient,
      page: () => Inpatient(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.calender,
      page: () => Calender(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.yourprescription,
      page: () => YourPrescription(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
    name: PageRouteName.specialititydetails,
    page: () => SpecialitityDetail(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
    name: PageRouteName.doctordetail,
    page: () => DoctorDetail(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
      name: PageRouteName.bookappoinment,
      page: () => BookAppointment(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.patientlistforappointment,
      page: () => PatientsListForAppointment(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
    name: PageRouteName.appointmentforpatient,
    page: () => Appointmentforpatient(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
      name: PageRouteName.addappointmentmember,
      page: () => AddAppointmentmember(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.doctorslist,
      page: () => Doctorlist(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.forgetemail,
      page: () => Forgetpasswordemail(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
    name: PageRouteName.forgetotp,
    page: () => Forgetpasswordotp(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
      name: PageRouteName.casedetail,
      page: () => CaseDetail(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.notificationPage,
      page: () => NotificationPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
    name: PageRouteName.articleDetail,
    page: () => ArticleDetail(),
    transition: Transition.cupertino,
    transitionDuration: Duration(milliseconds: 200),
  ),
  GetPage(
      name: PageRouteName.editprofile,
      page: () => EditProfile(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200)),
  GetPage(
      name: PageRouteName.caseSuccess,
      page: () => CaseSuccesspage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 200))
];

class PageRouteName {
  static const splash = '/';
  static const login = '/login';
  static const homepage = '/homepage';
  static const newreviews = '/newreview';
  static const profile = '/profile';
  static const register = '/register';
  static const forgetPassword = '/forgetPassword';
  static const splashDiologue = '/splashscreendialogue';
  static const medicaldetails = '/medicaldetails';
  static const payments = '/payments';
  static const otpConfirmation = '/otpConfirmation';
  static const preview = '/preview';
  static const mainpage = '/mainpage';
  static const patientinfo = '/patientinfo';
  static const telemedicine = '/telemedicine';
  static const medicalreports = '/medicalreports';
  static const specialities = '/specialities';
  static const peerreview = '/peerreview';
  static const article = '/article';
  static const inpatient = '/inpatient';
  static const calender = '/calender';
  static const yourprescription = '/yourprescription';
  static const specialititydetails = '/specialitiydetails';
  static const doctordetail = '/doctordetail';
  static const bookappoinment = '/bookappointment';
  static const patientlistforappointment = '/patientlistforappointment';
  static const appointmentforpatient = '/appointmentforpatient';
  static const addappointmentmember = '/addappointmentmember';
  static const doctorslist = '/doctorslist';
  static const forgetemail = '/forgetemail';
  static const forgetotp = '/forgetotp';
  static const casedetail = '/casedetail';
  static const notificationPage = '/notification';
  static const articleDetail = '/articledetail';
  static const editprofile = '/editprofile';
  static const caseSuccess = '/caseSuccess';
}
