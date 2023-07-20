import 'package:flutter/foundation.dart';

import '../models/question_model.dart';
import '../service/api_service.dart';

class AiProvider extends ChangeNotifier {
  final OpenAiService _openAiService;

  AiProvider(this._openAiService);

  Answer? _answer;
  Answer? get answer => _answer;

  Future<void> getAnswer(String question) async {
    try {
      _answer = await _openAiService.getAnswer(question);
    } catch (e) {
      print('Error fetching answer: $e');
    }
    notifyListeners();
  }
}

class LoadingProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
