import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/const.dart';
import 'package:flutter_application_9/models/countrycode.dart' as country;
import 'package:flutter_application_9/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class CountrySelect extends StatefulWidget {
  final Function setCountryData;
  CountrySelect({super.key, required this.setCountryData});

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  final countryPicker = const FlCountryCodePicker();
  // Future<List<Country>>? future;
  // List<Country> countries = [];

  // Future<List<Country>> getdata() async {
  //   var response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final list = jsonDecode(response.body);
  //     //print(response.body);
  //     return (list as List).map((e) => Country.fromJson(e)).toList();
  //   } else {
  //     throw Exception('Failed to load');
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //future = getdata();
  }

  // List<Country> countries = [
  //   Country(name: "India", dialCode: "+91", flag: "🇮🇳"),
  //   Country(name: "Pakistan", dialCode: "+92", flag: "🇵🇰"),
  //   Country(name: "United States", dialCode: "+1", flag: "🇺🇸"),
  //   Country(name: "South Africa", dialCode: "+27", flag: "🇿🇦"),
  //   Country(name: "Afghanistan", dialCode: "+93", flag: "🇦🇫"),
  //   Country(name: "United Kingdom", dialCode: "+44", flag: "🇬🇧"),
  //   Country(name: "Italy", dialCode: "+39", flag: "🇮🇹"),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Choose Country Code",
            style: kHeading1,
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: (() {}),
                icon: const Icon(
                  Icons.search_sharp,
                  color: Colors.white,
                ))
          ],
        ),
        // body: FutureBuilder(
        //     future: future,
        //     builder: ((context, snapshot) {
        //       if (snapshot.hasData) {
        //         return ListView.builder(
        //             itemCount: snapshot.data!.length,
        //             itemBuilder: ((context, index) {
        //               return card(snapshot.data![index]);
        //             }));
        //       } else if (snapshot.hasError) {
        //         return Text("${snapshot.error}");
        //       }
        //       return const Center(child: CircularProgressIndicator());
        //     })),

        body: GestureDetector(
          onTap: () async {
            final code = await countryPicker.showPicker(context: context);
            if (code != null) print(code);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Text('Show Picker',
                style: const TextStyle(color: Colors.white)),
          ),
        ));
  }

  Widget card(CountryCode country) {
    //print(country);
    return InkWell(
      onTap: () {
        widget.setCountryData(country, context);
      },
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: SvgPicture.network(
            "${country.flagImage}",
          ),
          title: Text("${country.name}"),
          subtitle: Text('${country.code}'),
          trailing: Text("${country.dialCode}"),
        ),
      ),
    );
  }
}
