import 'package:flutter/material.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';

import 'navigation/navigation_page.dart'; // Import CountryPicker

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Country? selectedCountry = CountryPickerUtils.getCountryByIsoCode('IN'); // Default India
  bool _obscureText = true; // Initially hide the password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.pink],
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3.0),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                            height: 2,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Country Flag Dropdown Box
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    children: [
                      // Flag Box
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 0),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[50], // Change the background color here
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.black45, width: 1.0),
                        ),
                        child: CountryPickerDropdown(
                          initialValue: 'IN',
                          itemBuilder: (Country country) {
                            return Row(
                              children: <Widget>[
                                CountryPickerUtils.getDefaultFlagImage(country),
                              ],
                            );
                          },
                          onValuePicked: (Country country) {
                            setState(() {
                              selectedCountry = country;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Mobile Number with Country Code Box
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'Mobile No.',
                            filled: true, // This is required to apply the fill color
                            fillColor: Colors.lightBlue[50],
                            prefixText: '+${selectedCountry?.phoneCode}', // Dynamically display country code
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    obscureText: _obscureText, // Use the _obscureText variable
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true, // This is required to apply the fill color
                      fillColor: Colors.lightBlue[50],
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      prefixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; // Toggle the visibility
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: SizedBox(
                    // Use the same width as the password field
                    width: MediaQuery.of(context).size.width - 100, // Adjust padding for the edges
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [Colors.lightGreen, Colors.lightGreen.shade900],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BottomNavigationPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.transparent, // Important to set this to transparent
                          shadowColor: Colors.transparent, // Remove shadow if any
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            gradient: LinearGradient(
                              colors: [Colors.lightGreen, Colors.lightGreen.shade900],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // Text color
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'By continuing, you agree to our Terms of Services, Privacy Policy, Content Policy',
                    style: TextStyle(
                      color: Colors.black, // Change text color to black
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 412),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
