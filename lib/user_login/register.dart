import 'package:flutter/material.dart';
import 'package:may_laud/user_login/password_field.dart';
import 'unregistered.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

String? selectedBarangay;
String passwordValue = "";

final List<String> barangays = [
  "San Roque",
  "Del Rosario",
  "San Jose",
  "Amparado",
  "Lipot",
  "Borongborongan",
  "San Antonio",
  "Capucnasan",
];

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    void showBarangayModal() {
      String? tempSelected = selectedBarangay;
      TextEditingController searchController = TextEditingController();
      List<String> filteredBarangays = List.from(barangays);

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        backgroundColor: const Color(0xFFF5F1FA),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setModalState) {
              return Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 12,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// HANDLE
                    Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// HEADER (Title + Close)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 30),
                        const Text(
                          "Select Barangay",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6A1B9A),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child:
                              const Icon(Icons.close, color: Color(0xFF6A1B9A)),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// SEARCH BAR
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDCD2F5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) {
                          setModalState(() {
                            filteredBarangays = barangays
                                .where((b) => b
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                        decoration: const InputDecoration(
                          icon: Icon(Icons.search, color: Colors.deepPurple),
                          hintText: "Search your barangay...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// LOCATION TEXT
                    const Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            size: 18, color: Colors.grey),
                        SizedBox(width: 6),
                        Text(
                          "MILAOR, CAMARINES SUR",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    /// LIST
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                        itemCount: filteredBarangays.length,
                        itemBuilder: (context, index) {
                          final item = filteredBarangays[index];

                          return GestureDetector(
                            onTap: () {
                              setModalState(() {
                                tempSelected = item;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xFFEDE7F6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF2E0C6D),
                                    ),
                                  ),
                                  Icon(
                                    tempSelected == item
                                        ? Icons.radio_button_checked
                                        : Icons.radio_button_off,
                                    color: tempSelected == item
                                        ? Colors.deepPurple
                                        : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// CONFIRM BUTTON
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF4C229C), Color(0xFF643EB5)],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedBarangay = tempSelected;
                          });
                          Navigator.pop(context);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Text(
                            "Confirm Selection",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F1FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              /// TITLE
              const Text(
                "May-Laud,",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E0C6D),
                ),
              ),
              const Text(
                "Registration!",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF5E35B1),
                ),
              ),

              const SizedBox(height: 16),

              /// SUBTEXT
              const Text(
                "Please provide your details below to\ncheck if you have an account or create\nyour account and get started.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6E6A75),
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 30),

              /// FULL NAME
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "FULL NAME",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4C229C),
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _inputField(
                icon: Icons.person_outline,
                hint: "Juan Dela Cruz",
              ),

              const SizedBox(height: 20),

              /// PHONE NUMBER
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PHONE NUMBER",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4C229C),
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Row(
                      children: [
                        Text("🇵🇭"),
                        SizedBox(width: 6),
                        Text(
                          "+63",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Icon(Icons.keyboard_arrow_down, size: 18),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                        width: 1, height: 24, color: Colors.grey.shade400),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Put your phone number",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BARANGAY
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "BARANGAY",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4C229C),
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              GestureDetector(
                onTap: showBarangayModal,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDE7F6),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              color: Colors.grey),
                          const SizedBox(width: 8),
                          Text(
                            selectedBarangay ?? "Select your barangay",
                            style: TextStyle(
                              color: selectedBarangay == null
                                  ? Colors.black54
                                  : const Color(0xFF4C229C),
                              fontWeight: selectedBarangay == null
                                  ? FontWeight.normal
                                  : FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.unfold_more, color: Colors.grey),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "PASSWORD",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4C229C),
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              PasswordField(
                onChanged: (val) {
                  setState(() {
                    passwordValue = val;
                  });
                },
              ),

              const SizedBox(height: 20),

              /// CONFIRM PASSWORD
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CONFIRM PASSWORD",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4C229C),
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              ConfirmPasswordField(password: passwordValue),

              const SizedBox(height: 20),

              /// REGISTER BUTTON
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const VerificationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4C229C), Color(0xFF643EB5)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF643EB5),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      "Register Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// OR
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text("OR", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                ],
              ),

              const SizedBox(height: 30),

              /// terms and conditions
              const Text(
                "By continuing, you agree to our",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      color: Color(0xFF4C229C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("•"),
                  SizedBox(width: 10),
                  Text(
                    "Privacy Policy",
                    style: TextStyle(
                      color: Color(0xFF4C229C),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _inputField({
    required IconData icon,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE7F6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: hint,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
