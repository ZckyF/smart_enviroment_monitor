import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final bool isMonitoring;
  final VoidCallback onToggleMonitoring;

  const HomePage({
    super.key,
    required this.isMonitoring,
    required this.onToggleMonitoring,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.eco, size: 80, color: Color(0xFF1B4D3E)),
          const SizedBox(height: 16),
          const Text(
            'Smart Environment Monitor',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Aplikasi pengukur kondisi lingkungan sekitar berbasis Light Sensor dan Proximity Sensor.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 40),
          Card(
            color: isMonitoring ? Colors.green.shade50 : Colors.red.shade50,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Status System Sensor',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    isMonitoring ? 'AKTIF (MEMBACA DATA)' : 'NON-AKTIF (STANDBY)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isMonitoring ? const Color(0xFF1B4D3E) : Colors.red.shade800,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: onToggleMonitoring,
            icon: Icon(isMonitoring ? Icons.power_settings_new : Icons.play_arrow),
            label: Text(isMonitoring ? 'HENTIKAN SENSOR' : 'MULAI SENSOR'),
            style: ElevatedButton.styleFrom(
              backgroundColor: isMonitoring ? Colors.red.shade700 : const Color(0xFF1B4D3E),
            ),
          ),
        ],
      ),
    );
  }
}