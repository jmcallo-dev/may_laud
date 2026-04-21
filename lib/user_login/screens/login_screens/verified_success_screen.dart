import 'package:flutter/material.dart';
import 'package:may_laud/user_login/home.dart';

class VerifiedSuccessScreen extends StatelessWidget {
  const VerifiedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check, size: 80, color: Colors.green),
            const SizedBox(height: 20),
            const Text("Phone Verified!"),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeDashboard()),
                );
              },
              child: const Text("Get Started"),
            )
          ],
        ),
      ),
    );
  }
}
