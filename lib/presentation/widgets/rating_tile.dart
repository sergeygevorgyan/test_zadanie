import 'package:flutter/material.dart';

class RatingTile extends StatelessWidget {
  const RatingTile({
    required this.rating,
    required this.ratingName,
    super.key,
  });

  final String ratingName;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(255, 199, 0, 0.20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star, color: Color(0xFFFFA800)),
          const SizedBox(width: 2),
          Text(
            '$rating $ratingName',
            style: const TextStyle(color: Color(0xFFFFA800)),
          ),
        ],
      ),
    );
  }
}
