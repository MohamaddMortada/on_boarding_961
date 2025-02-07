import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/country_controller.dart';
import '../models/country_model.dart';

class CountryDropdown extends StatelessWidget {
  final CountryController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton<Country>(
        value: _controller.selectedCountry.value,
        onChanged: (Country? newValue) {
          if (newValue != null) {
            _controller.setSelectedCountry(newValue);
          }
        },
        items: _controller.countries.map<DropdownMenuItem<Country>>((Country country) {
          return DropdownMenuItem<Country>(
            value: country,
            child: Row(
              children: [
                Text(
                  country.code,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                Text(country.dialCode),
              ],
            ),
          );
        }).toList(),
      );
    });
  }
}