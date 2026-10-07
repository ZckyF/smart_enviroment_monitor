import 'dart:async';

import 'package:flutter/material.dart';
import 'package:proximity_sensor/proximity_sensor.dart';
import 'package:vibration/vibration.dart';

import 'theme/app_theme.dart';
import 'pages/home_page.dart';
import 'pages/sensor_page.dart';
import 'pages/result_page.dart';
import 'pages/response_page.dart';

void main() => runApp(const MainApp());

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  // Stream Subscription
  StreamSubscription<int>? _proxSub;

  bool _isMonitoring = false;
  bool _isNear = false;

  void _toggleMonitoring() {
    if (_isMonitoring) {
      _stopSensors();
    } else {
      _startSensors();
    }
  }

  void _startSensors() {
    setState(() {
      _isMonitoring = true;
    });

    // Proximity Sensor
    _proxSub = ProximitySensor.events.listen((int event) {
      final bool near = event > 0;

      setState(() {
        _isNear = near;
      });

      // Vibrate when an object/person is detected nearby
      if (near) {
        Vibration.hasVibrator().then((hasVibe) {
          if (hasVibe == true) {
            Vibration.vibrate(duration: 300);
          }
        });
      }
    });
  }

  void _stopSensors() {
    _proxSub?.cancel();
    _proxSub = null;

    setState(() {
      _isMonitoring = false;
      _isNear = false;
    });
  }

  @override
  void dispose() {
    _proxSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final List<Widget> pages = [
    HomePage(
      isMonitoring: _isMonitoring,
      onToggleMonitoring: _toggleMonitoring,
    ),

    SensorPage(
      isMonitoring: _isMonitoring,
      isNear: _isNear,
    ),

    ResultPage(
      isMonitoring: _isMonitoring,
      isNear: _isNear,
    ),

    ResponsePage(
      isNear: _isNear,
    ),
  ];
    return MaterialApp(
      title: 'Smart Environment Monitor',
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Environment Monitor'),
        ),

        body: IndexedStack(
          index: _currentIndex,
          children: pages,
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: const Color(0xFF1B4D3E),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,

          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sensors),
              label: 'Sensor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Status',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bolt),
              label: 'Respons',
            ),
          ],
        ),
      ),
    );
  }
}

