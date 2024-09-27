enum Environment { production, staging, dev, dev2 }

class EnvConfig {
  static const Environment _currentEnvironment = Environment.staging;

  static final Map<Environment, Map<EnvVariable, String>>
      _availableEnvironments = {
    Environment.staging: {
      EnvVariable.authUrl: 'https://staging.bringmebd.com/api',
      EnvVariable.baseUrl: 'https://staging.bringmebd.com/api',
    },
    Environment.production: {
      EnvVariable.baseUrl: '',
    },
    Environment.dev: {
      EnvVariable.authUrl:
          'https://demo.bagisto.com/bagisto-api-demo-common/api',
      EnvVariable.baseUrl:
          'https://demo.bagisto.com/bagisto-api-demo-common/api',
    },
    Environment.dev2: {
      EnvVariable.authUrl:
          'https://demo.bagisto.com/bagisto-api-demo-common/api',
      EnvVariable.baseUrl: 'https://demo.bagisto.com/bagisto-common/api',
    },
  };

  static bool get isProduction => _currentEnvironment == Environment.production;

  static Map<EnvVariable, String> getCurrentConfigs() {
    return _availableEnvironments[_currentEnvironment]!;
  }

  static String getVariable(EnvVariable variableName) {
    return getCurrentConfigs()[variableName]!;
  }
}

enum EnvVariable {
  authUrl,
  baseUrl,
}
