import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '12/app/app.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
  //providerScope makes sure that all providers we create are actually store in that container
  // that means that any thing that we store or the providers we create can be access
  // through any where in the app
}
