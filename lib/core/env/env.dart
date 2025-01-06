import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  // Production
  @EnviedField(varName: 'BASE_URL_PROD')
  static String baseUrlProd = _Env.baseUrlProd;
  @EnviedField(varName: 'BASE_URL_CASHLESS_PROD')
  static String baseUrlCashlessProd = _Env.baseUrlCashlessProd;
  @EnviedField(varName: 'BASE_URL_CHECKOUT_PROD')
  static String baseUrlCheckOutProd = _Env.baseUrlCheckOutProd;
  @EnviedField(varName: 'BASE_URL_S3_PROD')
  static String baseUrlS3Prod = _Env.baseUrlS3Prod;
  @EnviedField(varName: 'SP_API_KEY_PROD')
  static String spApiKeyProd = _Env.spApiKeyProd;
  @EnviedField(varName: 'SP_DATE_KEY_PROD')
  static String spDayKeyProd = _Env.spDayKeyProd;
  @EnviedField(varName: 'KEY_JWT_PROD')
  static String keyJwtProd = _Env.keyJwtProd;
//=====================================================
  // Development
  @EnviedField(varName: 'BASE_URL_DEV')
  static String baseUrlDev = _Env.baseUrlDev;
  @EnviedField(varName: 'BASE_URL_CASHLESS_DEV')
  static String baseUrlCashlessDev = _Env.baseUrlCashlessDev;
  @EnviedField(varName: 'BASE_URL_CHECKOUT_DEV')
  static String baseUrlCheckOutDev = _Env.baseUrlCheckOutDev;
  @EnviedField(varName: 'BASE_URL_S3_DEV')
  static String baseUrlS3Dev = _Env.baseUrlS3Dev;
  @EnviedField(varName: 'SP_API_KEY_DEV')
  static String spApiKeyDev = _Env.spApiKeyDev;
  @EnviedField(varName: 'SP_DATE_KEY_DEV')
  static String spDayKeyDev = _Env.spDayKeyDev;
  @EnviedField(varName: 'KEY_JWT_DEV')
  static String keyJwtDev = _Env.keyJwtDev;
//=====================================================
  // Pre-Producción
  @EnviedField(varName: 'BASE_URL_PPR')
  static String baseUrlPpr = _Env.baseUrlPpr;
  @EnviedField(varName: 'BASE_URL_CASHLESS_PPR')
  static String baseUrlCashlessPpr = _Env.baseUrlCashlessPpr;
  @EnviedField(varName: 'BASE_URL_CHECKOUT_PPR')
  static String baseUrlCheckOutPpr = _Env.baseUrlCheckOutPpr;
  @EnviedField(varName: 'BASE_URL_S3_PPR')
  static String baseUrlS3Ppr = _Env.baseUrlS3Ppr;
  @EnviedField(varName: 'SP_API_KEY_PPR')
  static String spApiKeyPpr = _Env.spApiKeyPpr;
  @EnviedField(varName: 'SP_DATE_KEY_PPR')
  static String spDayKeyPpr = _Env.spDayKeyPpr;
  @EnviedField(varName: 'KEY_JWT_PPR')
  static String keyJwtPpr = _Env.keyJwtPpr;
  // Global
  @EnviedField(varName: 'X_JOINNUS_MOBILE_ENTRY_CONTROL')
  static String xJoinnusMobileEntryCtrl = _Env.xJoinnusMobileEntryCtrl;
  @EnviedField(varName: 'X_JOINNUS_MOBILE_CASHLESS')
  static String xJoinnusMobileCashless = _Env.xJoinnusMobileCashless;
}
