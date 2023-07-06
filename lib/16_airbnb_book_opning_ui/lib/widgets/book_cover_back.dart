import 'package:flutter/material.dart';
import 'package:flutte_challange/16_airbnb_book_opning_ui/lib/constants.dart';
import 'package:flutte_challange/16_airbnb_book_opning_ui/lib/listing.dart';
import 'package:flutte_challange/16_airbnb_book_opning_ui/lib/widgets/avatar.dart';

class BookCoverBack extends StatelessWidget {
  const BookCoverBack(
    this.listing, {
    super.key,
  });

  final Listing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
        left: 20,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Constants.bookBorderRadius),
          bottomLeft: Radius.circular(Constants.bookBorderRadius),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(-6, 0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            children: [
              Avatar(
                imageUrl: listing.landlordAvatarUrl,
                hasBadge: true,
              ),
              const SizedBox(height: 10),
              Text(
                listing.landlordName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 5),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person, size: 16),
                  SizedBox(width: 2),
                  Text(
                    'Superhost',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
