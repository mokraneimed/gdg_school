/*
{
  "weather": [
    {
      "main": "Clear",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  
  }
*/


class WeatherInfo {
  final String mainCondition; // Renamed for clarity
  final String icon;

  WeatherInfo({required this.mainCondition, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final mainCondition = json['main']; // Extract "main" (e.g., "Rain")
    final icon = json['icon'];          // Extract "icon" (e.g., "01d")
    return WeatherInfo(mainCondition: mainCondition, icon: icon);
  }
}


class TempuratureInfo {
  final double tempInfo;
  final double maxInfo;
  final double minInfo;
  final int humidityInfo;
  TempuratureInfo(
      {required this.tempInfo,
      required this.maxInfo,
      required this.minInfo,
      required this.humidityInfo});
  factory TempuratureInfo.fromJson(Map<String, dynamic> json) {
    final tempInfo = json['temp'];
    final maxInfo = json['temp_max'];
    final minInfo = json['temp_min'];
    final humidityInfo = json['humidity'];
    return TempuratureInfo(
        tempInfo: tempInfo,
        maxInfo: maxInfo,
        minInfo: minInfo,
        humidityInfo: humidityInfo);
  }
}

class WeatherResponse {
  final String cityName;
  final TempuratureInfo tempInfo;
  final WeatherInfo weatherInfo;

  WeatherResponse({
    required this.cityName,
    required this.tempInfo,
    required this.weatherInfo,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempInfoJson = json['main'];
    final tempInfo = TempuratureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0]; // Extract the first element of the "weather" array
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);

    return WeatherResponse(
      cityName: cityName,
      tempInfo: tempInfo,
      weatherInfo: weatherInfo,
    );
  }
}
