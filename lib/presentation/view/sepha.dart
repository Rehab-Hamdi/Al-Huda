import 'package:flutter/material.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  _TasbeehScreenState createState() => _TasbeehScreenState();
}

class _TasbeehScreenState extends State<TasbeehScreen> {
  int tasbeehCount = 0;
  String selectedTasbeeh = 'سبحان الله';
  final List<String> tasbeehOptions = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
    'لا إله إلا الله'
  ];

  void incrementTasbeeh() {
    setState(() {
      tasbeehCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            GestureDetector(
              onTap: incrementTasbeeh,
              child: Image.asset('assets/images/tasbeeh.png', height: 250),
            ),
            const SizedBox(height: 20),
            const Text('Number of tasbeh', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '$tasbeehCount',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedTasbeeh,
                  dropdownColor: Colors.brown,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  items: tasbeehOptions.map((tasbeeh) {
                    return DropdownMenuItem<String>(
                      value: tasbeeh,
                      child: Text(tasbeeh),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedTasbeeh = value!;
                      tasbeehCount = 0; // Reset count when changing tasbeeh
                    });
                  },
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
