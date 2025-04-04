// Default Dimens
import 'dart:io';

// Keys
const String kAppleStoreId = "6741391369";

const double kPaddingHorizontal = 20;
const double kPaddingHorizontalDrawer = 12;
const double kHeightTabsButtons = 34;

// Border Radius
const double kDefaultBorderRadius = 4;
const double kFlagsBorderRadius = 4;
const double kCircleBorderRadius = 16;
const double kRoundedBorderRadius = 50;

// Icons
const double kDefaultIconsSize = 24;
const double kSmallIconsSize = 21;
const double kMiniSmallIconsSize = 18;
const bool kDefaultFlagRounded = false;

// index home page
const int kIndexHomeView = 0;

List<String> category = [
  'All',
  'Indeas',
  'Evnets',
  'Article',
];

// Default params
const double kDefaultBaseAmount = 1.00;
const String kDefaultBaseCurrencyCode = 'AED';
const String kDefaultBaseCurrencyCountryCode = 'AE';
const String kDefaultCurrenciesListCode = 'USD,EUR,LTC';

const int kMaxItemsInCurrenciesList = 4;
const int kVibrationDurastionOfToast = 100;
const int kToastDurastion = 4;

// Decimals & more
const int kDecimalsCurrency = 2;
const String kDecimalsCurrencyKey = "decimalsCurrencKey2";
const int kDecimalsCrypro = 4;
const String kDecimalsCryproKey = "decimalsCryproKey2";
const int kDecimalsMax = 10;
const String kConversionFeeKey = "conversionFee";
const int kSelectedIndexCurrenciesList = 2; // All
const String kSelectedIndexCurrenciesListKey = "selectedIndexCurrenciesListKey";
const bool kStayAwake = true;
const String kStayAwakeKey = "stayAwakeKey";

// Hive Boxes
const String kSettingsBox = "settings";
const String kPostsBox = "posts";
const String kUsersBox = "users";
const String kFavoriteCurrencyBox = "favoriteCurrency";
const String kHistoryBox = "history";
const String kCurrenciesListBox = "currenciesList";
const String kApiCache = "apicache";
const String kAlertComponent = "alertComponent";

// Hive objects keys
const String kCurrenciesCacheKey = 'currencies_cache_2';
const String kAmountKey = 'amount';
const String kBaseCurrencyKey = 'baseCurrency';
const String kParallelMode = 'parallelMode';
const String kConversionFeeMode = 'conversionFeeMode';
const String kSortingCurrencyList = 'sortingCurrencyList';
const String kLocalizationKey = 'localization';
const String kBrightnessKey = 'brightness';
const String kChartCacheWeeklyKey = 'chartCacheWeekly';
const String kChartCacheBiWeeklyKey = 'chartCacheBiWeekly';
const String kChartCacheMonthlyKey = 'chartCacheMonthly';
const String kChartCacheThreeMounthsKey = 'chartCacheThreeMounths';
const String kChartCacheSixMounthsKey = 'chartCacheSixMounths';
const String kSettingFlagStyle = 'settingFlagStyle';

const String kAddCurrencyToListAlertKey = 'addCurrencyToListAlert';
const String kChangeBaseCurrencyAlertKey = 'changeBaseCurrencyAlert';
const String kManageCurrencinesAlertKey = 'manageCurrecicesAlert';
const String kOver400CurrencinesAlertKey = 'over400CurrencinesAlertKey';
const String kChartsAlertKey = 'chartsAlertKey';
const String kBankNotesAlert = 'bankNotesAlert';
const String kXauAlert = 'xauAlert';

const String kLatestKey = 'latest';
const String kHistoricalKey = 'historical';
const String kChartsLastDateStart = 'chartsLastDateStart';
const String kChartsLastDateEnd = 'chartsLastDateEnd';

// Cache time
const int kApiCacheCurrenciesList = 18; // in hours
const int kApiCacheLatest = 10; // in minutes

// Ads
const String kInterstitialAdsMixinCache = 'interstitialAdsMixinCache';
const String kAppOpenAdsMixinCache = 'appOpenAdsMixinCache';
int kInterstitialAdsMixinFreq = (Platform.isIOS ? 2 : 4) * 60 * 1000;
int kAppOpenAdsMixinFreq = (Platform.isIOS ? 1 : 4) * 60 * 60 * 1000;
const int kInterstitialAdsAfterAppOpenMixinFreq = 30 * 1000;
const int kAdsTimeOut = 7; // in seconds

// Firebase
const int kRemoteConfigCacheTime = 6; // in hours
const String kOneSignalKey = "onesignal_api_key";
const String kApiUrl = "api_url";
const String kDomainUrl = "domain_url";
const String kAesKey = "aes_key";
const String kBankNotesApiKey = "banknotes_api";
const String kCoaApiKey = "coat_of_arms_api";
