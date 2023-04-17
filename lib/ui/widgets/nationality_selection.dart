import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';
import '../../controllers/booking/booking_controller.dart';

class NationalityForm extends GetView<BookingController> {
  const NationalityForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController nationalityController = TextEditingController();
    String countryCode = controller.countryCode;
    nationalityController.text = controller.nationality;
    return Form(
      key: formKey,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          const Text(
            "Choose your Nationality",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10.0),
          TextFormField(
            controller: nationalityController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nationality",
            ),
            readOnly: true,
            showCursor: false,
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              showCountryPicker(
                  context: context,
                  //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                  exclude: <String>['KN', 'MF'],
                  favorite: <String>['AE'],
                  //Optional. Shows phone code before the country name.
                  showPhoneCode: true,
                  onSelect: (Country country) {
                    countryCode = "+${country.phoneCode}";
                    nationalityController.text = country.displayName;
                  },
                  // Optional. Sets the theme for the country list picker.
                  countryListTheme: CountryListThemeData(
                    // Optional. Sets the border radius for the bottomsheet.
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    // Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                    // Optional. Styles the text in the search field
                    searchTextStyle: const TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Select Nationality';
              }
              return null;
            },
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 50.0,
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    controller.setCountryCode(countryCode);
                    controller.setNationality(nationalityController.text);
                    controller.goToForm(1);
                  }
                },
                child: const Text("Continue")),
          )
        ],
      ),
    );
  }
}
