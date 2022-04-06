import 'package:get/get.dart';
import 'package:shs108private/app/modules/Institutions_signup/bindings/institutions_signup_binding.dart';
import 'package:shs108private/app/modules/Institutions_signup/views/institutions_signup_view.dart';
import 'package:shs108private/app/modules/Medical-services-outside-Iraq/bindings/medical_services_outside_iraq_binding.dart';
import 'package:shs108private/app/modules/Medical-services-outside-Iraq/views/medical_services_outside_iraq_view.dart';
import 'package:shs108private/app/modules/Pharmacies/bindings/pharmacies_binding.dart';
import 'package:shs108private/app/modules/Pharmacies/views/pharmacies_view.dart';
import 'package:shs108private/app/modules/Pharmacists/bindings/pharmacists_binding.dart';
import 'package:shs108private/app/modules/Pharmacists/views/pharmacists_view.dart';
import 'package:shs108private/app/modules/about/bindings/about_binding.dart';
import 'package:shs108private/app/modules/about/views/about_view.dart';
import 'package:shs108private/app/modules/about_app/bindings/about_app_binding.dart';
import 'package:shs108private/app/modules/about_app/views/about_app_view.dart';
import 'package:shs108private/app/modules/add_drug/bindings/add_drug_binding.dart';
import 'package:shs108private/app/modules/add_drug/views/add_drug_view.dart';
import 'package:shs108private/app/modules/biomedical_engineers/bindings/biomedical_engineers_binding.dart';
import 'package:shs108private/app/modules/biomedical_engineers/views/biomedical_engineers_view.dart';
import 'package:shs108private/app/modules/charity_directories/bindings/charity_directories_binding.dart';
import 'package:shs108private/app/modules/charity_directories/views/charity_directories_view.dart';
import 'package:shs108private/app/modules/child_personal_section/bindings/child_personal_section_binding.dart';
import 'package:shs108private/app/modules/child_personal_section/views/child_personal_section_view.dart';
import 'package:shs108private/app/modules/clinics_reservation/bindings/clinics_reservation_binding.dart';
import 'package:shs108private/app/modules/clinics_reservation/views/clinics_reservation.dart';
import 'package:shs108private/app/modules/doctor_dashboard/bindings/doctor_dashboard_binding.dart';
import 'package:shs108private/app/modules/doctor_dashboard/views/doctor_dashboard_view.dart';
import 'package:shs108private/app/modules/doctor_profile/bindings/doctor_profile_binding.dart';
import 'package:shs108private/app/modules/doctor_profile/views/doctor_profile_view.dart';
import 'package:shs108private/app/modules/doctors/bindings/doctors_binding.dart';
import 'package:shs108private/app/modules/doctors/views/doctors_view.dart';
import 'package:shs108private/app/modules/doctors/views/profile/public_doctor_profile_view.dart';
import 'package:shs108private/app/modules/drug_and_materials_directories/bindings/drug_and_materials_directories_binding.dart';
import 'package:shs108private/app/modules/drug_and_materials_directories/views/drug_and_materials_directories_view.dart';
import 'package:shs108private/app/modules/drug_profile/bindings/drug_profile_binding.dart';
import 'package:shs108private/app/modules/drug_profile/views/drug_profile_view.dart';
import 'package:shs108private/app/modules/drugs/bindings/drugs_binding.dart';
import 'package:shs108private/app/modules/drugs/views/drugs_view.dart';
import 'package:shs108private/app/modules/edit_child_information/bindings/edit_child_information_binding.dart';
import 'package:shs108private/app/modules/edit_child_information/views/edit_child_information_view.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/bindings/edit_doctor_screen_binding.dart';
import 'package:shs108private/app/modules/edit_doctor_screen/views/edit_doctor_screen_view.dart';
import 'package:shs108private/app/modules/edit_personal_information/bindings/edit_personal_information_binding.dart';
import 'package:shs108private/app/modules/edit_personal_information/views/edit_personal_information_view.dart';
import 'package:shs108private/app/modules/explore/bindings/explore_binding.dart';
import 'package:shs108private/app/modules/explore/views/explore_view.dart';
import 'package:shs108private/app/modules/family_info_preview/bindings/family_info_preview_binding.dart';
import 'package:shs108private/app/modules/family_info_preview/views/family_info_preview_view.dart';
import 'package:shs108private/app/modules/family_information/bindings/family_information_binding.dart';
import 'package:shs108private/app/modules/family_information/views/family_information_view.dart';
import 'package:shs108private/app/modules/family_signup/bindings/family_signup_binding.dart';
import 'package:shs108private/app/modules/family_signup/views/family_signup_view.dart';
import 'package:shs108private/app/modules/health_insurance/bindings/health_insurance_binding.dart';
import 'package:shs108private/app/modules/health_insurance/views/health_insurance_view.dart';
import 'package:shs108private/app/modules/health_insurance_co/bindings/health_insurance_co_binding.dart';
import 'package:shs108private/app/modules/health_insurance_co/views/health_insurance_co_view.dart';
import 'package:shs108private/app/modules/home/bindings/home_binding.dart';
import 'package:shs108private/app/modules/home/views/home_view.dart';
import 'package:shs108private/app/modules/hospitals/bindings/hospitals_binding.dart';
import 'package:shs108private/app/modules/hospitals/views/hospitals_view.dart';
import 'package:shs108private/app/modules/humanitirian_cases/bindings/humanitirian_cases_binding.dart';
import 'package:shs108private/app/modules/humanitirian_cases/views/humanitirian_cases_view.dart';
import 'package:shs108private/app/modules/inbox/bindings/inbox_binding.dart';
import 'package:shs108private/app/modules/inbox/views/inbox_view.dart';
import 'package:shs108private/app/modules/institution_dashboard/bindings/institution_dashboard_binding.dart';
import 'package:shs108private/app/modules/institution_dashboard/views/institution_dashboard_view.dart';
import 'package:shs108private/app/modules/institution_profile/bindings/institution_profile_binding.dart';
import 'package:shs108private/app/modules/institution_profile/views/institution_profile_view.dart';
import 'package:shs108private/app/modules/institutions_directories/bindings/institutions_directories_binding.dart';
import 'package:shs108private/app/modules/institutions_directories/views/institutions_directories_view.dart';
import 'package:shs108private/app/modules/laboratories/bindings/laboratories_binding.dart';
import 'package:shs108private/app/modules/laboratories/views/laboratories_view.dart';
import 'package:shs108private/app/modules/map/bindings/map_binding.dart';
import 'package:shs108private/app/modules/map/views/map_view.dart';
import 'package:shs108private/app/modules/medical_and_humanitarian_societies/bindings/medical_and_humanitarian_societies_binding.dart';
import 'package:shs108private/app/modules/medical_and_humanitarian_societies/views/medical_and_humanitarian_societies_view.dart';
import 'package:shs108private/app/modules/otp/bindings/otp_binding.dart';
import 'package:shs108private/app/modules/otp/views/otp_view.dart';
import 'package:shs108private/app/modules/our_services/bindings/our_services_binding.dart';
import 'package:shs108private/app/modules/our_services/views/our_services_view.dart';
import 'package:shs108private/app/modules/personalAccountSignIn/bindings/personal_account_sign_in_binding.dart';
import 'package:shs108private/app/modules/personalAccountSignIn/views/personal_account_sign_in_view.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/bindings/personal_account_sign_up_binding.dart';
import 'package:shs108private/app/modules/personalAccountSignUp/views/personal_account_sign_up_view.dart';
import 'package:shs108private/app/modules/pharmasist_profile/bindings/pharmasist_profile_binding.dart';
import 'package:shs108private/app/modules/pharmasist_profile/views/pharmasist_profile_view.dart';
import 'package:shs108private/app/modules/private-clinics/bindings/private_clinics_binding.dart';
import 'package:shs108private/app/modules/private-clinics/views/private_clinics_view.dart';
import 'package:shs108private/app/modules/privicySettings/bindings/privicy_binding.dart';
import 'package:shs108private/app/modules/privicySettings/views/privicy_view.dart';
import 'package:shs108private/app/modules/profile/bindings/profile_binding.dart';
import 'package:shs108private/app/modules/profile/views/profile_view.dart';
import 'package:shs108private/app/modules/public_institution_profile/bindings/public_institution_profile_binding.dart';
import 'package:shs108private/app/modules/public_institution_profile/views/public_institution_profile_view.dart';
import 'package:shs108private/app/modules/results/explore_categories/bindings/explore_categories_binding.dart';
import 'package:shs108private/app/modules/results/explore_categories/views/explore_categories_view.dart';
import 'package:shs108private/app/modules/results/filters_results/bindings/filters_results_binding.dart';
import 'package:shs108private/app/modules/results/filters_results/views/filters_results_view.dart';
import 'package:shs108private/app/modules/results/search_results/bindings/search_results_binding.dart';
import 'package:shs108private/app/modules/results/search_results/views/search_results_view.dart';
import 'package:shs108private/app/modules/scientific_bureau/bindings/scientific_bureau_binding.dart';
import 'package:shs108private/app/modules/scientific_bureau/views/scientific_bureau_view.dart';
import 'package:shs108private/app/modules/select_profession_screen/bindings/select_profession_screen_binding.dart';
import 'package:shs108private/app/modules/select_profession_screen/views/select_profession_screen_view.dart';
import 'package:shs108private/app/modules/signin/bindings/signin_binding.dart';
import 'package:shs108private/app/modules/signin/views/signin_view.dart';
import 'package:shs108private/app/modules/signup/bindings/signup_binding.dart';
import 'package:shs108private/app/modules/signup/views/signup_view.dart';
import 'package:shs108private/app/modules/splash/bindings/splash_binding.dart';
import 'package:shs108private/app/modules/splash/views/splash_view.dart';
import 'package:shs108private/app/modules/staff/bindings/staff_binding.dart';
import 'package:shs108private/app/modules/staff/views/staff_view.dart';
import 'package:shs108private/app/modules/termsAndConditions/bindings/terms_and_conditions_binding.dart';
import 'package:shs108private/app/modules/termsAndConditions/views/terms_and_conditions_view.dart';
import 'package:shs108private/app/modules/therapeutic-training-services/bindings/therapeutic_training_services_binding.dart';
import 'package:shs108private/app/modules/therapeutic-training-services/views/therapeutic_training_services_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.EDIT_DOCTOR_SCREEN;
  static final routes = [
    GetPage(
      name: _Paths.DRUGS,
      page: () => DrugsView(),
      binding: DrugsBinding(),
    ),
    GetPage(
      name: _Paths.DRUG_PROFILE,
      page: () => DrugProfileView(),
      binding: DrugProfileBinding(),
    ),
    GetPage(
      name: _Paths.SCIENTIFIC_BUREAU,
      page: () => ScientificBureauView(),
      binding: ScientificBureauBinding(),
    ),
    GetPage(
      name: _Paths.THERAPEUTIC_TRAINING_SERVICES,
      page: () => TherapeuticTrainingServicesView(),
      binding: TherapeuticTrainingServicesBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_INSURANCE_CO,
      page: () => HealthInsuranceCoView(),
      binding: HealthInsuranceCoBinding(),
    ),
    GetPage(
      name: _Paths.MEDICAL_SERVICES_OUTSIDE_IRAQ,
      page: () => MedicalServicesOutsideIraqView(),
      binding: MedicalServicesOutsideIraqBinding(),
    ),
    GetPage(
      name: _Paths.HOSPITALS,
      page: () => HospitalsView(),
      binding: HospitalsBinding(),
    ),
    GetPage(
      name: _Paths.LABORATORIES,
      page: () => LaboratoriesView(),
      binding: LaboratoriesBinding(),
    ),
    GetPage(
      name: _Paths.PHARMACIES,
      page: () => PharmaciesView(),
      binding: PharmaciesBinding(),
    ),
    GetPage(
      name: _Paths.PRIVATE_CLINICS,
      page: () => PrivateClinicsView(),
      binding: PrivateClinicsBinding(),
    ),
    GetPage(
      name: _Paths.MEDICAL_AND_HUMANITARIAN_SOCIETIES,
      page: () => MedicalAndHumanitarianSocietiesView(),
      binding: MedicalAndHumanitarianSocietiesBinding(),
    ),
    GetPage(
      name: _Paths.HUMANITIRIAN_CASES,
      page: () => HumanitirianCasesView(),
      binding: HumanitirianCasesBinding(),
    ),
    GetPage(
      name: _Paths.PHARMACISTS,
      page: () => PharmacistsView(),
      binding: PharmacistsBinding(),
    ),
    GetPage(
      name: _Paths.BIOMEDICAL_ENGINEERS,
      page: () => BiomedicalEngineersView(),
      binding: BiomedicalEngineersBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORS,
      page: () => DoctorsView(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE_CATEGORIES,
      page: () => ExploreCategoriesView(),
      binding: ExploreCategoriesBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_RESULTS,
      page: () => SearchResultsView(),
      binding: SearchResultsBinding(),
    ),
    GetPage(
      name: _Paths.FILTERS_RESULTS,
      page: () => FiltersResultsView(),
      binding: FiltersResultsBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.CHARITY_DIRECTORIES,
      page: () => CharityDirectoriesView(),
      binding: CharityDirectoriesBinding(),
    ),
    GetPage(
      name: _Paths.INSTITUTIONS_DIRECTORIES,
      page: () => InstitutionsDirectoriesView(),
      binding: InstitutionsDirectoriesBinding(),
    ),
    GetPage(
      name: _Paths.DRUG_AND_MATERIALS_DIRECTORIES,
      page: () => DrugAndMaterialsDirectoriesView(),
      binding: DrugAndMaterialsDirectoriesBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.STAFF,
      page: () => StaffView(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_APP,
      page: () => AboutAppView(),
      binding: AboutAppBinding(),
    ),
    GetPage(
      name: _Paths.OUR_SERVICES,
      page: () => OurServicesView(),
      binding: OurServicesBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_INSURANCE,
      page: () => HealthInsuranceView(),
      binding: HealthInsuranceBinding(),
    ),
    GetPage(
      name: _Paths.PRIVICY_SETTINGS,
      page: () => PrivicyView(),
      binding: PrivicySettingsBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.PUBLIC_DOCTOR_PROFILE,
      page: () => PublicDoctorProfileView(),
      // binding: DoctorProfileBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_PROFILE,
      page: () => DoctorProfileView(),
      binding: DoctorProfileBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_ACCOUNT_SIGN_UP,
      page: () => PersonalAccountSignUpView(),
      binding: PersonalAccountSignUpBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.INBOX,
      page: () => InboxView(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_PROFESSION_SCREEN,
      page: () => SelectProfessionScreenView(),
      binding: SelectProfessionScreenBinding(),
    ),
    GetPage(
      name: _Paths.PHARMASIST_PROFILE,
      page: () => PharmasistProfileView(),
      binding: PharmasistProfileBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_DASHBOARD,
      page: () => DoctorDashboardView(),
      binding: DoctorDashboardBinding(),
    ),
    GetPage(
      name: _Paths.INSTITUTIONS_SIGNUP,
      page: () => InstitutionsSignupView(),
      binding: InstitutionsSignupBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_ACCOUNT_SIGN_IN,
      page: () => PersonalAccountSignInView(),
      binding: PersonalAccountSignInBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_AND_CONDITIONS,
      page: () => TermsAndConditionsView(),
      binding: TermsAndConditionsBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PERSONAL_INFORMATION,
      page: () => EditPersonalInformationView(),
      binding: EditPersonalInformationBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_INFORMATION,
      page: () => FamilyInformationView(),
      binding: FamilyInformationBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_SIGNUP,
      page: () => FamilySignupView(),
      binding: FamilySignupBinding(),
    ),
    GetPage(
      name: _Paths.FAMILY_INFO_PREVIEW,
      page: () => FamilyInfoPreviewView(),
      binding: FamilyInfoPreviewBinding(),
    ),
    GetPage(
      name: _Paths.CHILD_PERSONAL_SECTION,
      page: () => ChildPersonalSectionView(),
      binding: ChildPersonalSectionBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CHILD_INFORMATION,
      page: () => EditChildInformationView(),
      binding: EditChildInformationBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DRUG,
      page: () => AddDrugView(),
      binding: AddDrugBinding(),
    ),
    GetPage(
      name: _Paths.INSTITUTION_PROFILE,
      page: () => InstitutionProfileView(),
      binding: InstitutionProfileBinding(),
    ),
    GetPage(
      name: _Paths.PUBLIC_INSTITUTION_PROFILE,
      page: () => PublicInstitutionProfileView(),
      binding: PublicInstitutionProfileBinding(),
    ),
    GetPage(
      name: _Paths.MAP,
      page: () => MapView(),
      binding: MapBinding(),
    ),
    GetPage(
      name: _Paths.CLINICS_RESERVATION,
      page: () => ClinicsReservationView(),
      binding: ClinicsReservationBinding(),
    ),
    GetPage(
      name: _Paths.INSTITUTION_DASHBOARD,
      page: () => InstitutionDashboardView(),
      binding: InstitutionDashboardBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DOCTOR_SCREEN,
      page: () => EditDoctorScreenView(),
      binding: EditDoctorScreenBinding(),
    ),
  ];
}
