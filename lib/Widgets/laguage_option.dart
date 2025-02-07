import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class LanguageOption extends StatelessWidget {
  final String languageName;
  final String languageCode;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageOption({
    Key? key,
    required this.languageName,
    required this.languageCode,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipOval(
                  child: CountryFlag.fromCountryCode(
                    languageCode,
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  languageName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                border: isSelected
                    ? Border.all(color: Theme.of(context).primaryColor)
                    : Border.all(
                        color: const Color.fromARGB(255, 56, 56, 56),
                        width: 0.5),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
