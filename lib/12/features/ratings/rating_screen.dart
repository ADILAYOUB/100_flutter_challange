import 'package:flutte_challange/12/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen(
      {super.key, required this.nextPage, required this.previousPage});
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  //kepping track of the state
  double rating = 5;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.previousPage),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Select the Rating',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${rating.ceil()}', style: theme.textTheme.displayMedium),
              const Icon(
                Icons.star_rounded,
                size: 64,
                color: Colors.amber,
              ),
            ],
          ),
          const Spacer(),
          Slider(
            onChanged: (value) {
              setState(() {
                rating = value;
              });
            },
            value: rating,
            min: 1,
            max: 10,
            divisions: 9,
            label: '${rating.ceil()}',
          ),
          const Spacer(),
          PrimaryButton(onPressed: widget.nextPage, text: 'Continue')
        ],
      )),
    );
  }
}
