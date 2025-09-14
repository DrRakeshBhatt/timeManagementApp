import 'package:flutter/material.dart';
import 'package:time_manager/country_list.dart';

class ProfileScreen extends StatefulWidget {
  final String username;
  const ProfileScreen({super.key, required this.username});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String selectedCountry = "India";
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hello Rocky,",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "\nTime is a very scarce resource. Use it wisely!",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: "Rocky",
                  decoration: InputDecoration(labelText: "First Name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: "Balboa",
                  decoration: InputDecoration(labelText: "Last Name"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: 'RockyB',
                  decoration: InputDecoration(labelText: "Username"),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: 'test@email.com',
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 10),
                FutureBuilder(
                  future: fetchCountries(),

                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text("No countries available");
                    } else {
                      final countryList = snapshot.data!;

                      return DropdownButtonFormField(
                        menuMaxHeight: 600,
                        borderRadius: BorderRadius.circular(25.0),

                        value: selectedCountry,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          labelText: "Select Country",
                        ),
                        items: countryList.map((String name) {
                          return DropdownMenuItem<String>(
                            value: name,
                            child: Text(name),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedCountry = newValue ?? "India";
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return 'Please select an option';
                          }
                          return null;
                        },
                      );
                    }
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Update Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
