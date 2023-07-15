import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.amber.shade900,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber.withOpacity(0),
        leading: const Icon(IconlyLight.category),
        title: const Text(appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(IconlyLight.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.notification),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(IconlyLight.setting),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(children: [
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey,
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(IconlyLight.filter)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      fillColor: Colors.blueGrey.shade500,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: const Icon(
                        IconlyLight.search,
                        size: 20,
                      ),
                    ),
                    style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade400),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
