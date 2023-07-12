// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:geocoding/geocoding.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  double? longitude;
  double? latitude;
  double? temperature;
  String? weathercodeDescr;
  String? dateToday;
  int? code;
  String? cityName;
  bool? isDay;

  WeatherModel(
      {this.latitude,
      this.longitude,
      this.temperature,
      this.weathercodeDescr,
      this.dateToday,
      this.code,
      this.cityName,
      this.isDay});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    temperature = json['current_weather']['temperature'];
    //weathercode = json['current_weather']['weathercode'].toString();
    //dateToday = json['current_weather']['time'];

    code = json['current_weather']['weathercode'];
    String date = json['current_weather']['time'];
    DateTime tempDate = DateTime.parse(date);
    print(tempDate);
    // String formattedDate = DateFormat('E, d MMMM yyyy').format(tempDate);
    // dateToday = formattedDate;
    initializeDateFormatting('it-IT', '').then((_) {
      dateToday = DateFormat('E, d MMMM yyyy', 'it-IT').format(tempDate);
    });
    switch (code) {
      case 0:
        weathercodeDescr = 'Sereno'; // cielo sereno
        break;
      case 1:
        weathercodeDescr = 'Prevalentemente sereno';
        break;
      case 2:
        weathercodeDescr = 'Parzialmente nuvoloso';
        break;
      case 3:
        weathercodeDescr = 'Coperto';
        break;
      case 45:
        weathercodeDescr = 'Nebbia';
        break;
      case 48:
        weathercodeDescr = 'Nebbia intensa';
        break;
      case 51:
        weathercodeDescr = 'Pioggerellina leggera';
        break;
      case 53:
        weathercodeDescr = 'Pioggerellina moderata';
        break;
      case 55:
        weathercodeDescr = 'Pioggerellina intensa';
        break;
      case 56:
        weathercodeDescr = 'pioggerellina gelata leggera';
        break;
      case 57:
        weathercodeDescr = 'pioggerellina gelata intensa';
        break;
      case 61:
        weathercodeDescr = 'Pioggia leggera';
        break;
      case 63:
        weathercodeDescr = 'Pioggia moderata';
        break;
      case 65:
        weathercodeDescr = 'Pioggia intensa';
        break;
      case 66:
        weathercodeDescr = 'Pioggia gelata leggera';
        break;
      case 67:
        weathercodeDescr = 'Pioggia gelata intensa';
        break;
      case 71:
        weathercodeDescr = 'Neve leggera';
        break;
      case 73:
        weathercodeDescr = 'Neve moderata';
        break;
      case 75:
        weathercodeDescr = 'Neve intensa';
        break;
      case 77:
        weathercodeDescr = 'Snow grains';
        break;
      case 80:
        weathercodeDescr = 'Acquazzone leggero';
        break;
      case 81:
        weathercodeDescr = 'Acquazzone moderato';
        break;
      case 82:
        weathercodeDescr = 'Acquazzone intenso';
        break;
      case 85:
        weathercodeDescr = 'Neve abbondante';
        break;
      case 86:
        weathercodeDescr = 'Neve molto abbondante';
        break;
      case 95:
        weathercodeDescr = 'Possibile temporale';
        break;
      case 96:
        weathercodeDescr = 'Temporale';
        break;
      case 99:
        weathercodeDescr = 'Temporale abbondante';
        break;
    }
  }
}
