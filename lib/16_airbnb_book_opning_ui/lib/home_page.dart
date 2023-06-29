import 'package:flutter/material.dart';
import 'package:flutte_challange/16_airbnb_book_opning_ui/lib/items.dart';
import 'package:flutte_challange/16_airbnb_book_opning_ui/lib/widgets/listing_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.only(left: 20, right: 20),
            //   child: SearchField(),
            // ),
            Expanded(
              child: ListView.builder(
                itemCount: listings.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) => ListingItem(
                  listing: listings[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
