import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final Function(String) onChanged;

  const PasswordField({super.key, required this.onChanged});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;
  String strength = "Weak";

  void validate(String value) {
    int score = 0;

    if (value.length >= 8) score++;
    if (RegExp(r'[0-9]').hasMatch(value)) score++;
    if (RegExp(r'[A-Za-z]').hasMatch(value)) score++;

    if (score == 1) strength = "Weak";
    if (score == 2) strength = "Medium";
    if (score == 3) strength = "Strong";

    widget.onChanged(value);
    setState(() {});
  }

  Color getColor() {
    if (strength == "Strong") return Colors.green;
    if (strength == "Medium") return Colors.orange;
    return Colors.red;
  }

  double getValue() {
    if (strength == "Strong") return 1;
    if (strength == "Medium") return 0.6;
    return 0.3;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            obscureText: obscure,
            onChanged: validate,
            decoration: InputDecoration(
              hintText: "Enter your password",
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => obscure = !obscure),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        LinearProgressIndicator(
          value: getValue(),
          minHeight: 6,
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(getColor()),
        ),
        const SizedBox(height: 5),
        Text(
          "Strength: $strength",
          style: TextStyle(
            color: getColor(),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ConfirmPasswordField extends StatefulWidget {
  final String password;

  const ConfirmPasswordField({super.key, required this.password});

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool obscure = true;
  bool match = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFEDE7F6),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            obscureText: obscure,
            onChanged: (val) {
              setState(() {
                match = val == widget.password;
              });
            },
            decoration: InputDecoration(
              hintText: "Re-enter your password",
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => obscure = !obscure),
              ),
            ),
          ),
        ),
        if (!match)
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "Passwords do not match",
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }
}
