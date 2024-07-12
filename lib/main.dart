import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_mobile_app/pages/home.dart';
import 'package:my_mobile_app/pages/signIn.dart';
import 'package:my_mobile_app/pages/signUp.dart';
import 'package:my_mobile_app/pages/calculator.dart';
import 'package:battery/battery.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatefulWidget {
  final bool isDarkMode;
  MyApp({required this.isDarkMode});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isDarkMode;

  final Battery _battery = Battery();
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    initBattery();
    isDarkMode = widget.isDarkMode;
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
    });
    prefs.setBool('isDarkMode', isDarkMode);
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.mobile || result == ConnectivityResult.wifi) {
      Fluttertoast.showToast(msg: 'Internet Connected!');
    } else {
      Fluttertoast.showToast(msg: 'No Internet Connection!');
    }
  }

  Future<void> initBattery() async {
    _battery.onBatteryStateChanged.listen((BatteryState state) {
      if (state == BatteryState.charging) {
        _battery.batteryLevel.then((level) {
          if (level >= 50) {
            Fluttertoast.showToast(msg: 'Battery level is now $level%');
            // Add your ringtone code here
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
        '/signIn': (context) => SignInScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/calculator': (context) => Calculator(),
      },
    );
  }
}
