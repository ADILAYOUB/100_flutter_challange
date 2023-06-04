import 'package:flutte_challange/12/core/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class YearScreen extends StatefulWidget {
  const YearScreen(
      {super.key, required this.nextPage, required this.previousPage});
  final VoidCallback nextPage;
  final VoidCallback previousPage;

  @override
  State<YearScreen> createState() => _YearScreenState();
}

class _YearScreenState extends State<YearScreen> {
  double year = 10;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.previousPage,
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Text(
            'Select How many years should we check for?',
            style: theme.textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${year.ceil()}', style: theme.textTheme.headlineLarge),
              Text('Year Back',
                  style: theme.textTheme.headlineMedium?.copyWith(
                      color: theme.textTheme.headlineMedium?.color
                          ?.withOpacity(0.62))),
            ],
          ),
          const Spacer(),
          Slider(
            value: year,
            onChanged: (value) {
              setState(
                () {
                  year = value;
                },
              );
            },
            min: 0,
            max: 70,
            divisions: 70,
            label: '${year.ceil()}',
          ),
          const Spacer(),
          PrimaryButton(onPressed: () {}, text: 'Find')
        ],
      )),
    );
  }
}
