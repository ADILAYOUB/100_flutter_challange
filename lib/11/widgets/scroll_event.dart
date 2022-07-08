import 'package:flutter/material.dart';

class MySingleChildScrollView extends StatelessWidget {
  final int isSelected;
  final List<String> serviceType;
  final Function(int) onItemSelected;

  const MySingleChildScrollView({
    super.key,
    required this.isSelected,
    required this.serviceType,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 98.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(serviceType.length, (index) {
            return GestureDetector(
              onTap: () {
                onItemSelected(index);
              },
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  color: isSelected == index
                      ? const Color(0xFF1EFFAE)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Text(
                    serviceType[index],
                    style: TextStyle(
                        color:
                            isSelected == index ? Colors.black : Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
