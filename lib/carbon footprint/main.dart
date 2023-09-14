// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Footprint Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CarbonFootprintPage(),
    );
  }
}

class CarbonFootprintPage extends StatefulWidget {
  const CarbonFootprintPage({super.key});

  @override
  State<CarbonFootprintPage> createState() => _CarbonFootprintPageState();
}

class _CarbonFootprintPageState extends State<CarbonFootprintPage> {
  final _formKey = GlobalKey<FormState>();
  double _milesDriven = 0.0;
  double _electricityUsage = 0.0;
  double _carbonFootprint = 0.0;
  Color _getCarbonFootprintColor() {
    // Define the condition for changing text color
    if (_carbonFootprint > 100) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Carbon Footprint Tracker'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Miles Driven (per day)',
                  hintText: 'Example 30.5',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter miles driven.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _milesDriven = double.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Electricity Usage (kWh per day)',
                  hintText: 'Example 20.5',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter electricity usage.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _electricityUsage = double.parse(value!);
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                    onPressed: _calculateCarbonFootprint,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                    child: const Text('Calculate')),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Carbon Footprint: ',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue), // Change color here
                    ),
                    TextSpan(
                      text: '$_carbonFootprint kg CO2 per day',
                      style: TextStyle(
                        fontSize: 18,
                        color: _getCarbonFootprintColor(),
                      ), // Change color here
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateCarbonFootprint() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Calculate carbon footprint (simplified formula)
      final calculator = CarbonFootprintCalculator();
      _carbonFootprint =
          calculator.calculateCarbonFootprint(_milesDriven, _electricityUsage);

      setState(() {});
    }
  }
}

// domain/carbon_footprint_calculator.dart
class CarbonFootprintCalculator {
  double calculateCarbonFootprint(double milesDriven, double electricityUsage) {
    // Simplified formula to calculate carbon footprint
    double milesCarbon = milesDriven * 0.5; // Example conversion factor
    double electricityCarbon =
        electricityUsage * 0.2; // Example conversion factor
    return milesCarbon + electricityCarbon;
  }
}
