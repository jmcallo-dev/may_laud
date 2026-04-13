import 'package:flutter/material.dart';
import 'success_screen.dart'; // make sure this exists

/// ---------------- NEW PASSWORD CREATION----------------
class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController pass1 = TextEditingController();
  final TextEditingController pass2 = TextEditingController();

  bool obscure1 = true;
  bool obscure2 = true;

  String strength = "Weak";
  Color strengthColor = Colors.red;

  String errorText = "";

  void checkStrength(String value) {
    if (value.length < 6) {
      strength = "Weak";
      strengthColor = Colors.red;
    } else if (value.length < 10) {
      strength = "Medium";
      strengthColor = Colors.orange;
    } else {
      strength = "Strong";
      strengthColor = Colors.green;
    }
    setState(() {});
  }

  void validatePasswords() {
    if (pass1.text != pass2.text) {
      errorText = "Passwords do not match";
    } else {
      errorText = "";
    }
    setState(() {});
  }

  void handleSubmit() {
    validatePasswords();

    if (errorText.isEmpty && pass1.text.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEF8),
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Color(0xFF5E35B1)),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Color(0xFF5E35B1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    /// ICON
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Color(0xFFDCD2F5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.lock_reset,
                          color: Color(0xFF5E35B1), size: 40),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      "Create New Password",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Your new password must be different from previous.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// CARD
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE7F6),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// PASSWORD
                          const Text("NEW PASSWORD"),
                          const SizedBox(height: 10),

                          TextField(
                            controller: pass1,
                            obscureText: obscure1,
                            onChanged: (val) {
                              checkStrength(val);
                              validatePasswords();
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(obscure1
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() => obscure1 = !obscure1);
                                },
                              ),
                              hintText: "Enter new password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          /// STRENGTH
                          Row(
                            children: [
                              const Text("Strength: "),
                              Text(
                                strength,
                                style: TextStyle(
                                  color: strengthColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          /// CONFIRM
                          const Text("CONFIRM PASSWORD"),
                          const SizedBox(height: 10),

                          TextField(
                            controller: pass2,
                            obscureText: obscure2,
                            onChanged: (val) => validatePasswords(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(obscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() => obscure2 = !obscure2);
                                },
                              ),
                              hintText: "Confirm password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),

                          /// ERROR
                          if (errorText.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                errorText,
                                style: const TextStyle(
                                    color: Colors.red, fontSize: 12),
                              ),
                            ),

                          const SizedBox(height: 30),

                          /// BUTTON
                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5E35B1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: handleSubmit,
                              child: const Text("Reset Password",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
