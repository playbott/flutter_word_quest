import '../global.dart';

class HBAuth {
  static const allowInsecureConnections = false;
  static const clientId = 'halkbank-fiz-mob';
  static const clientSecret = 'test-client';
  static const callbackUrlScheme = 'swamob.halkbank.gov.tm';
  static const redirectUrlString = 'swamob.halkbank.gov.tm://oauth_redirect';
  static const issuerUrlString = 'https://swaauth.halkbank.gov.tm';
  static const issuerHostUrlString = 'swaauth.halkbank.gov.tm';
  static const authorizeUrlString =
      'https://swaauth.halkbank.gov.tm/oauth2/authorize';
  static const tokenUrlString = 'https://swaauth.halkbank.gov.tm/oauth2/token';
  static const scopes = [
    'openid',
    'profile',
    'message.read',
    'message.write',
  ];

  static Uri get redirectUri => Uri.parse(redirectUrlString);

  static Uri get issuerUri => Uri.parse(issuerUrlString);

  static Uri get authorizeUri => Uri.parse(authorizeUrlString);

  static Uri get tokenUri => Uri.parse(tokenUrlString);
}

class AppUrls {
  static const mainUrl = 'https://swaapi.halkbank.gov.tm';
  static const webSiteUrl = 'https://swamob.halkbank.gov.tm';
  static const swAuthUrl = 'https://swaauth.halkbank.gov.tm';

  // static const url = 'http://192.168.137.1';
  // static const url = 'http://localhost';
  // static const url = 'http://10.0.2.2';
  static const api = mainUrl;
  static const storage = '$mainUrl/storage';
  static const images = '$storage/image';
  static const appImages = '$storage/app/image';
  static final Uri privacyPolicy = Uri.parse('https://docs.google.com/document/d/1BwxJZ7cIE9dPfkN-A_L3sXeXX2IoPHMC3N4_0gPtzaQ/edit?usp=sharing');
  static const String freeApiUrl = 'https://freeipapi.com/api/json';
}

class PicturesDefault {
  static const genreDefaultPng = '${AppUrls.appImages}/default/genre.png';
  static const genreDefaultSvg = '${AppUrls.appImages}/default/genre.svg';
}

const logScreenEnabledKey = 'logScreenEnabled';
const isDarkModeEnabledKey = 'isDarkModeEnabled';
const userIdKey = 'userId';
const firstLaunchKey = 'firstLaunch';
const accessTokenKey = 'accessToken';
const credentialsKey = 'credentials';
const phoneNumberKey = 'userPhoneNumber';
const nicknameKey = 'nickname';
const locationsAllStorageKey = 'locationsAllParent';
const locationsParentStorageKey = 'locationsParent';
const locationsParentCurrentStorageKey = 'locationsParentCurrent';

const usdIcon = Icons.attach_money;
const eurIcon = Icons.euro_rounded;
const rubIcon = Icons.currency_ruble;

Map<String, String> currencySymbols = {
  'USD': '\$',
  'EUR': '€',
  'RUB': '₽',
};

Map<String, IconData> currencyIcons = {
  'USD': usdIcon,
  'EUR': eurIcon,
  'RUB': rubIcon,
};

Map<String, double> currencyIconSizes = {
  'USD': 1.2,
  'EUR': 1,
  'RUB': 1,
};
