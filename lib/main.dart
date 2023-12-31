import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_zadanie/presentation/first_screen/first_screen.dart';
import 'package:test_zadanie/presentation/providers/place_provider.dart';

void main() {
  runApp(const MyApp());
}

ChangeNotifierProvider<PlaceProvider> placeProvider =
    ChangeNotifierProvider<PlaceProvider>((ref) {
  return PlaceProvider();
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: FirstScreen(),
      ),
    );
  }
}
