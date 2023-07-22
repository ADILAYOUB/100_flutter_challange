// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../service/api_service.dart';

// class QuestionScreen extends StatefulWidget {
//   const QuestionScreen({super.key});

//   @override
//   QuestionScreenState createState() => QuestionScreenState();
// }

// class QuestionScreenState extends State<QuestionScreen> {
//   final TextEditingController _questionController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Ask a Question')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//               controller: _questionController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter your question',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 final question = _questionController.text;
//                 if (question.isNotEmpty) {
//                   BlocProvider.of<QuestionBloc>(context).add(question);
//                 }
//               },
//               child: const Text('Get Answer'),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/question_bloc.dart';

class InputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final aiProvider = Provider.of<AiProvider>(context);
    final loadingProvider = Provider.of<LoadingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask a Question'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration:
                    const InputDecoration(labelText: 'Enter your question'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: loadingProvider.isLoading
                    ? null
                    : () async {
                        final question = _controller.text.trim();
                        if (question.isNotEmpty) {
                          loadingProvider.isLoading = true;
                          await aiProvider.getAnswer(question);
                          loadingProvider.isLoading = false;
                          Navigator.pushNamed(context, '/answer_screen');
                        }
                      },
                child: loadingProvider.isLoading
                    ? const CircularProgressIndicator(
                        strokeWidth: 3,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.red,
                        ))
                    : const Text('Get Answer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
