import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_zadanie/main.dart';
import 'package:test_zadanie/presentation/second_screen/widgets/menu_item.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeprovider = ref.watch(placeProvider);
    return FutureBuilder(
      future: placeprovider.fetchRoomsData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final rooms = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.chevron_left_outlined,
                  color: Colors.black,
                ),
              ),
              elevation: 0,
            ),
            body: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemCount: rooms!.length,
              itemBuilder: (context, index) => MenuItem(
                room: rooms[index],
              ),
            ),
          );
        }
      },
    );
  }
}
