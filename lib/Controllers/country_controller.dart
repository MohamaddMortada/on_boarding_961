import 'package:get/get.dart';
import '../models/country_model.dart';

class CountryController extends GetxController {
  final List<Country> countries = [
    Country(code: 'LB', name: 'Lebanon', dialCode: '+961'),
    Country(code: 'US', name: 'United States', dialCode: '+1'),
    Country(code: 'FR', name: 'France', dialCode: '+33'),
    Country(code: 'AE', name: 'United Arab Emirates', dialCode: '+971'),
    Country(code: 'SA', name: 'Saudi Arabia', dialCode: '+966'),
  ];

  var selectedCountry = Country(code: 'LB', name: 'Lebanon', dialCode: '+961').obs;

  void setSelectedCountry(Country country) {
    selectedCountry.value = country;
  }
}