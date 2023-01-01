import 'package:flutter/material.dart';

import 'create_password.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          elevation: 0,
          titleSpacing: 0.0,
          leading: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ],
          ),
          title: Transform(
            transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(
                Icons.help_center_sharp,
                color: Colors.black,
                size: 20,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Reset password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter the email associated with your account we will send you and email with instruction to reset your password",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Email Address",
                  style: TextStyle(fontSize: 12),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12,
                      ),
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'someone@example.com',
                        contentPadding: EdgeInsets.all(10)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  minWidth: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Theme.of(context).primaryColor)),
                  child: const Text(
                    "Send Instruction",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const CreatePassword()));
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
