import 'package:flutter/material.dart';
import 'package:shs108private/app/global/models/getdatamode.dart';
import 'package:shs108private/app/routes/app_pages.dart';

Color generalColor = Color(0xFF0000FE);
const url = 'https://shs-iq.com/api/api';
const updateUurl = 'https://shs-iq.com/api/api/update_profile';
const updateChildUurl = 'https://shs-iq.com/api/api/update_related_profile';
const imageUrl = 'https://shs-iq.com/shs108-api/public/storage';
// const url = 'http://127.0.0.1:8000/api';
// const imageUrl = 'http://127.0.0.1:8000/storage';
// const url = 'http://10.0.2.2:8000/api';
// const imageUrl = 'http://10.0.2.2:8000/storage';

//مؤقت
// String? savedToken;

const genderList = ['ذكر', 'انثى'];

List<String> listOfNationalities1 = [''];
List<String> listOfNationalities2 = [''];
List<String> listOfCountries1 = [''];
List<String> listOfCountries2 = [''];
List<String> listOfCities2 = [''];
List<String> listOfCities1 = [''];
List<String> listOfDestricts2 = [''];
List<String> listOfDestricts1 = [''];
List<String> listOfChronicDiseases = [''];
List<String> listOfHandicaps = [''];
String nationalitiesUrl = '$url/nationalities';
String countriesUrl = '$url/countries';
String governoratesUrl = '$url/governorates_by_country_id';
String citiesUrl = '$url/cities_by_gov_id';
String destrictsUrl = '$url/region_by_city_id';
String chronicDiseasesUrl = '$url/chronic_diseases';
String handicapsUrl = '$url/handicaps';
String medicalSpecialtiesUrl = '$url/medical_specialties';

String dropdownErrorText = 'يرجى إختيار من ضمن الخيارات';
String textfieldErrorText = 'يرجى ملئ الحقل';

Color generalColor1 = Color(0xFF96281b);
Color generalColor2 = Color(0xFF23cba7);
Color generalColor3 = Color(0xFF1e824c);
Color generalColor4 = Color(0xFF674172);
Color generalColor5 = Color(0xFFf2d984);
Color generalColor6 = Color(0xffaf85ce);

const loremIpsum =
    "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا . يوت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن يللأمكو لابورأس نيسي يت أليكيوب أكس أيا كوممودو كونسيكيوات.";

List<String> servicesItems = [
  "العيادات و المراكز و المجمعات الطبية الخاصة",
  "الصيدليات",
  "المختبرات",
  "المستشفيات الخاصة",
  "المستشفيات و المراكز الطبية الحكومية",
  "المستشفيات والخدمات العلاجية خارج العراق",
  "شركات التأمين الصحي",
  "مؤسسات التدريب الصحي",
  "المذاخر و المكاتب العلمية",
  "الأدوية",
  "المستلزمات الطبية",
  "المواد الصيدلانية",
  "الكوادر الصحية",
  "الجمعيات الطبية والإنسانية",
  "خدمة الحالات الإنسانية",
  "خدمة الرعاية الخاصة",
];
List<String> categoryImages = [
  clinicsIMG,
  pharmaciesIMG,
  labs3IMG,
  centersIMG,
  hospitalGovIMG,
  iraqIMG,
  companiesIMG,
  servicesIMG,
  offices15IMG,
  pharmaceuticalIMG,
  suppliesIMG,
  productsIMG,
  staffIMG,
  associationsIMG,
  casesIMG,
  i16IMG,
];

List<String> servicesRoutes = [
  Routes.PRIVATE_CLINICS,
  Routes.PHARMACIES,
  Routes.LABORATORIES,
  Routes.HOSPITALS,
  Routes.HOSPITALS,
  Routes.MEDICAL_SERVICES_OUTSIDE_IRAQ,
  Routes.HEALTH_INSURANCE_CO,
  Routes.THERAPEUTIC_TRAINING_SERVICES,
  Routes.SCIENTIFIC_BUREAU,
  Routes.DRUGS,
  Routes.DRUGS,
  Routes.DRUGS,
  Routes.STAFF,
  Routes.MEDICAL_AND_HUMANITARIAN_SOCIETIES,
  Routes.HUMANITIRIAN_CASES,
  Routes.DRUGS,
];

List<GetDataModel> servicesItemsMap = [
  GetDataModel(
    id: 1,
    name: 'الاطباء',
  ),
  GetDataModel(
    id: 2,
    name: 'الصيدليات',
  ),
  GetDataModel(
    id: 3,
    name: 'المختبرات',
  ),
  GetDataModel(
    id: 4,
    name: 'المستشفيات والمراكز الصحية الحكومية',
  ),
  GetDataModel(
    id: 5,
    name: 'المعالجين',
  ),
  // GetDataModel(
  //   id: 6,
  //   name: 'الخدمات الطبية خارج العراق',
  // ),
  GetDataModel(
    id: 7,
    name: 'عيادات و مراكز و مجمعات طبية',
  ),
];

List<String> expandableImages = [
  doctorIMG,
  "assets/general_for_two_apps/categoriesIcons/hospital.jpg",
  "assets/general_for_two_apps/categoriesIcons/labs.jpg",
  "assets/general_for_two_apps/categoriesIcons/medicalSupplies.jpg",
  "assets/general_for_two_apps/categoriesIcons/medicative.jpg",
  "assets/general_for_two_apps/categoriesIcons/pharmacy.jpg",
  "assets/general_for_two_apps/categoriesIcons/servicesOutside.jpg",
  "assets/general_for_two_apps/categoriesIcons/suppliesOrganizations.jpg",
  doctorIMG,
  "assets/general_for_two_apps/categoriesIcons/hospital.jpg",
  "assets/general_for_two_apps/categoriesIcons/labs.jpg",
  "assets/general_for_two_apps/categoriesIcons/medicalSupplies.jpg",
  "assets/general_for_two_apps/categoriesIcons/medicative.jpg",
];

List<String> expandableServicesItems = [
  'البحث عن مقدمي رعاية صحية',
  'حجز مواعيد لدى الاطباء والمستشفيات',
  'إدارة وجدولة مواعيد الحجوزات لدى العيادات والمستشفيات',
  'تتبع سيارات الاسعاف',
  'رقمنة نتائج الفحوصات والتحاليل',
  'البحث عن الصيدليات والادوية والمستلزمات الطبية',
  'توفير ارشفة التاريخ المرضي',
  'طلب التوصيل الموقعي للخدمات والعلاجات',
  'ربط شبكة التأمين الصحي',
  'طلب التجهيزات الدوائية والمستلزمات الطبية',
  'طلب الاسعاف الفوري',
  'ادارة الصيدليات',
  'برنامج الامتيازات',
  'البحث عن الرعاية الصحية خارج العراق',
  'الترويج لخدمات ومنتجات الرعاية الصحية',
];

List<String> newsTitles = [
  'تعرف على كيفية رعاية المبحوث بقانون التجارب السريرية الجديد بعد انتهاء '
      'البحث',
  'تعرف على اختصاصات مجلس مراجعة أخلاقيات البحوث الطبية وضوابط تشكيله وفقا '
      'للقانون',
  'تتوفير التمويل أبرزها.. 11 التزاما حددها القانون الجديد لراعى البحث الطبى',
  'متى يتم انهاء او تعليق البحث الطبي؟ قانون التجارب السريرية يجيب',
];

List<String> newsContent = [
  'ألزم القانون رقم 214 لسنة 2020 بإصدار قانون تنظيم البحوث الطبية '
      'الإكلينيكية، توفير الرعاية الطبية للمبحوثين ،وذلك بعد انتهاء البحث الطبي ولكن كل شخص على حسب حالته، وفيما يلى نستعرض هذه الضوابط.',
  'تضمن القانون رقم 214 لسنة 2020 بإصدار قانون تنظيم البحوث الطبية '
      'الإكلينيكية، تشكيل مجلس أعلى لمراجعة أخلاقيات البحوث الطبية، من مجموعة من الأشخاص بتخصصات طبية وغير طبية، منوط بهم وضع السياسات العامة لإجراء البحوث الطبية ومتابعة تنفيذها، ويشار إليه فى القانون بالمجلس الأعلى، وفيما يلى نستعرض أعضاء المجلس',
  'تضمن القانون رقم 214 لسنة 2020 بإصدار قانون تنظيم البحوث الطبية '
      'الإكلينيكية، عدد من الالتزامات بشأن راعى البحث الطبي، وفى مقدمتها الحصول على الموافقات المطلوبة وتمويل البحث ومتابعة سيره، وفيما يلى نستعرض هذه الالتزامات بالتفصيل',
  'يهدف القانون رقم 214 لسنة 2020 بإصدار قانون تنظيم البحوث الطبية الإكلينيكية، لوضع الأسس والمعايير والضوابط اللازمة لإجراء البحوث الطبية الإكلينيكية، وحماية المبحوثين، وفيما يلى نستعرض الحالات التي يجب فيها انهاء او تعليق البحث الطبي.',
];

List<String> newsImages = [
  'assets/general_for_two_apps/news/news-1.jpg',
  'assets/general_for_two_apps/news/news-2.jpg',
  'assets/general_for_two_apps/news/news-3.jpg',
  'assets/general_for_two_apps/news/news-4.jpg',
];

List<String> articalsImages = [
  'assets/general_for_two_apps/articals/article-1.jpg',
  'assets/general_for_two_apps/articals/article-2.jpg',
  'assets/general_for_two_apps/articals/article-3.jpg',
  'assets/general_for_two_apps/articals/article-4.jpg',
];

List<String> articalsTitle = [
  'التمارين الرياضية.. الحل الأمثل لتخفيف ألم المفاصل وتيبُّسها',
  '3 قواعد ذهبية لقلب صحي',
  'تعرف إلى أسباب قصور الغدة الدرقية وأعراضها',
  'تعرف إلى متلازمة الإرهاق المزمن'
];

List<String> articalsContent = [
  'تُعد ممارسة التمارين الرياضية مهمة للأشخاص الذين يعانون من التهاب المفاصل.'
      ' فالرياضة تزيد من القوة والمرونة، وتُقلل من ألم المفاصل، وتفيد في التغلب على التعب. وبالتأكيد إذا كانت المفاصل المتيبسة والمؤلمة تزعجك أصلاً، فتبدو فكرة التمشي حول البيت أو السباحة لبضعة دورات منهكة. لكنك لست بحاجة إلى أن تركض كعداء المارثون أو تسبح بسرعة المتنافس الأولمبي لتقليل أعراض التهاب المفاصل، إذ يمكن أن يُخفف الألم ممارسة تمارين معتدلة، وتفيدك أيضاً في المحافظة على وزن صحي',
  'يتمثل أحد أكبر عوامل خفض مخاطر الإصابة بالأمراض القلبية في الانتقال من '
      'اتباع نمط حياة ينطوي على كثرة الجلوس إلى ممارسة النشاط لمدة قصيرة مثل ساعة واحدة فحسب في الأسبوع. من المؤكد أنه كلما زاد النشاط، عظمت الفائدة، ولكن ممارسة النشاط لمدة ساعة واحدة أسبوعياً فحسب تشكل فارقاً. وطور اختصاصيون صحيون في مؤسسة مايو كلينيك (Mayo Clinic)، خطة من أجل الحفاظ على القلب الصحي". وتم تضمين الخطة بأكملها في الكتاب "مايو كلينيك: قلب صحي مدى الحياة"، ولكن إحدى الرسائل الأساسية بهذا الكتاب تفيد بأنه حتى الخطوات الصغيرة قد تشكل فارقاً كبيراً.',
  'قصور الغدة الدرقية هي حالة لا تنتج فيها الغدة ما يكفي من بعض الهرمونات '
      'المهمة. ولا يسبب قصور الدرقية أعراضاً ملحوظة في المراحل المبكرة. لكن بمرور الوقت، يمكن أن يسبب ذلك عدداً من المشكلات الصحية، مثل السمنة وآلام المفاصل والعقم وأمراض القلب.',
  'تُعد متلازِمة التعب المزمن اضطراباً معقداً ينشأ عنه إرهاق شديد يستمر لمدة 6 أشهر على الأقل، ولا يتحسن مع الراحة، كما أن الأمر قد يزداد سوءاً عند ممارسة نشاط بدني أو ذهني'
];

List<String> parteners = [
  'assets/general_for_two_apps/partners/partner-1.jpg',
  'assets/general_for_two_apps/partners/partner-2.jpeg',
  'assets/general_for_two_apps/partners/partner-3.png',
  'assets/general_for_two_apps/partners/partner-4.png',
];

List<String> newsBarImages = [
  "assets/general_for_two_apps/news-bar/news-5.jpg",
  "assets/general_for_two_apps/news-bar/news-6.jpg",
  "assets/general_for_two_apps/news-bar/news-7.jpg",
  "assets/general_for_two_apps/news-bar/enjoy doing news bar.png"
];
double statusBarHeight(context) => MediaQuery.of(context).padding.top;

double widthOfScreen(context) => MediaQuery.of(context).size.width;
double heightOfScreen(context) => MediaQuery.of(context).size.height;

List<String> alphabets = [
  'الكل',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'J',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
// ignore: non_constant_identifier_names
List<String> ARalphabets = [
  'الكل',
  'ا',
  'ب',
  'ت',
  'ث',
  'ج',
  'ح',
  'خ',
  'د',
  'ذ',
  'ر',
  'ز',
  'س',
  'ش',
  'ص',
  'ض',
  'ط',
  'ظ',
  'ع',
  'غ',
  'ف',
  'ق',
  'ك',
  'ل',
  'م',
  'ن',
  'ه',
  'و',
  'ي',
];

String faviconIMG = 'assets/general_for_two_apps/splash_SC/favicon.png';
String logo1IMG = 'assets/general_for_two_apps/splash_SC/logo1.png';
String headerIMG = 'assets/general_for_two_apps/splash_SC/header.png';
String footerIMG = 'assets/general_for_two_apps/splash_SC/footer.png';
String titleIMG = 'assets/general_for_two_apps/splash_SC/title.png';
String subtitleIMG = 'assets/general_for_two_apps/splash_SC/subtitle.png';
String defaultAvatarIMG =
    'assets/general_for_two_apps/shared/defaultAvatar.jpg';
String placeholderImageIMG =
    'assets/general_for_two_apps/shared/placeholder_image.jpg';
String notFoundIMG = 'assets/general_for_two_apps/empty_screens/not_found.svg';
String ad2IMG = 'assets/general_for_two_apps/home_screen/ad2.jpg';
String labPlaceHolderIMG =
    "assets/general_for_two_apps/categories/lab-PlaceHolder.jpg";

String serviceIconIMG =
    "assets/general_for_two_apps/selectsIcons/serviceIcon.svg";
String specializationIconIMG =
    "assets/general_for_two_apps/selectsIcons/specializationIcon.svg";
String buildingIMG = "assets/general_for_two_apps/selectsIcons/building.svg";
String dateIMG = "assets/general_for_two_apps/selectsIcons/date.svg";
String labsIMG = "assets/general_for_two_apps/categoriesIcons/labs.svg";

String doctorIMG = "assets/general_for_two_apps/categoriesIcons/doctor.jpg";

String ambulanceIMG =
    'assets/general_for_two_apps/categoriesIcons/ambulance.jpg';

String clinicsIMG =
    'assets/general_for_two_apps/new_categories_images/1-medical-clinics.jpg';
String pharmaciesIMG =
    'assets/general_for_two_apps/new_categories_images/2-pharmacies.jpg';
String labs3IMG =
    'assets/general_for_two_apps/new_categories_images/3-labs.jpg';
String centersIMG =
    'assets/general_for_two_apps/new_categories_images/4-hospitals-and-health-centers.jpg';
String pharmaceuticalIMG =
    'assets/general_for_two_apps/new_categories_images/5-pharmaceutical.jpg';
String productsIMG =
    'assets/general_for_two_apps/new_categories_images/6-medical-products.jpg';
String suppliesIMG =
    'assets/general_for_two_apps/new_categories_images/7-medical-supplies.jpg';
String associationsIMG =
    'assets/general_for_two_apps/new_categories_images/8-medical-and-humanitarian-associations.jpg';
String servicesIMG =
    'assets/general_for_two_apps/new_categories_images/9-remedial-training-services.jpg';
String officesIMG =
    'assets/general_for_two_apps/new_categories_images/10-supply-companies-and-offices.jpg';
String iraqIMG =
    'assets/general_for_two_apps/new_categories_images/11-medical-services-outside-Iraq.jpg';
String casesIMG =
    'assets/general_for_two_apps/new_categories_images/12-humanitarian-cases.jpg';
String staffIMG =
    'assets/general_for_two_apps/new_categories_images/13-health-staff.jpg';
String companiesIMG =
    'assets/general_for_two_apps/new_categories_images/14-health-insurance-companies.jpg';
String offices15IMG =
    'assets/general_for_two_apps/new_categories_images/15-storehouses-and-scientific-offices.jpg';
String hospitalGovIMG =
    'assets/general_for_two_apps/new_categories_images/hospital_gov.jpg';
String i16IMG = 'assets/general_for_two_apps/new_categories_images/16.jpg';
