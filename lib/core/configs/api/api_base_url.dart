import 'package:jc_module/core/env/env.dart';

enum EnvironmentApp {
  dev,
  prod,
  ppr,
}

abstract class EnvironmentConfig {
  String get baseUrl;
  String get baseUrlCashless;
  String get baseUrlCheckOut;
  String get baseUrlS3;
}

class DevEnvironmentConfig implements EnvironmentConfig {
  @override
  String get baseUrl => Env.baseUrlDev;

  @override
  String get baseUrlCashless => Env.baseUrlCashlessDev;

  @override
  String get baseUrlCheckOut => Env.baseUrlCheckOutDev;

  @override
  String get baseUrlS3 => Env.baseUrlS3Dev;
}

class ProdEnvironmentConfig implements EnvironmentConfig {
  @override
  String get baseUrl => Env.baseUrlProd;

  @override
  String get baseUrlCashless => Env.baseUrlCashlessProd;

  @override
  String get baseUrlCheckOut => Env.baseUrlCheckOutProd;

  @override
  String get baseUrlS3 => Env.baseUrlS3Prod;
}

class PprEnvironmentConfig implements EnvironmentConfig {
  @override
  String get baseUrl => Env.baseUrlPpr;

  @override
  String get baseUrlCashless => Env.baseUrlCashlessPpr;

  @override
  String get baseUrlCheckOut => Env.baseUrlCheckOutPpr;

  @override
  String get baseUrlS3 => Env.baseUrlS3Ppr;
}

class EnvironmentConfigFactory {
  static EnvironmentConfig getConfig(EnvironmentApp environment) {
    switch (environment) {
      case EnvironmentApp.dev:
        return DevEnvironmentConfig();
      case EnvironmentApp.prod:
        return ProdEnvironmentConfig();
      case EnvironmentApp.ppr:
        return PprEnvironmentConfig();
      default:
        throw UnsupportedError('Unsupported environment: $environment');
    }
  }
}

class EnvironmentManager {
  static EnvironmentApp _currentEnvironment = EnvironmentApp.prod;

  static void setEnvironment(EnvironmentApp environment) {
    _currentEnvironment = environment;
  }

  static EnvironmentConfig get currentConfig {
    return EnvironmentConfigFactory.getConfig(_currentEnvironment);
  }

  static String get baseUrl => currentConfig.baseUrl;
  static String get baseUrlCashless => currentConfig.baseUrlCashless;
  static String get baseUrlCheckOut => currentConfig.baseUrlCheckOut;
  static String get baseUrlS3 => currentConfig.baseUrlS3;

  static Map<EnvironmentApp, Map<String, String>> get apiBaseUrlMap {
    return {
      EnvironmentApp.dev: {
        'baseUrl': DevEnvironmentConfig().baseUrl,
        'baseUrlCashless': DevEnvironmentConfig().baseUrlCashless,
        'baseUrlCheckOut': DevEnvironmentConfig().baseUrlCheckOut,
        'baseUrlS3': DevEnvironmentConfig().baseUrlS3,
      },
      EnvironmentApp.prod: {
        'baseUrl': ProdEnvironmentConfig().baseUrl,
        'baseUrlCashless': ProdEnvironmentConfig().baseUrlCashless,
        'baseUrlCheckOut': ProdEnvironmentConfig().baseUrlCheckOut,
        'baseUrlS3': ProdEnvironmentConfig().baseUrlS3,
      },
      EnvironmentApp.ppr: {
        'baseUrl': PprEnvironmentConfig().baseUrl,
        'baseUrlCashless': PprEnvironmentConfig().baseUrlCashless,
        'baseUrlCheckOut': PprEnvironmentConfig().baseUrlCheckOut,
        'baseUrlS3': PprEnvironmentConfig().baseUrlS3,
      },
    };
  }
}
