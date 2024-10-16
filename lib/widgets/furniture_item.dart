import 'package:flutter/material.dart';
import 'package:boxigo_assignment/models/furniture.dart';

class FurnitureItem extends StatelessWidget {
  const FurnitureItem({super.key, required this.furniture});

  final Furniture furniture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Icon(categoryIcon[furniture.category]),
          const SizedBox(
            width: 20,
          ),
          furniture.size == '' && furniture.type == ''
              ? Text(furniture.displayName)
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(furniture.displayName),
                    furniture.size != '' && furniture.type != ''
                        ? Text(
                            '${furniture.size} | ${furniture.type.trim()}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )
                        : furniture.size != ''
                            ? Text(
                                furniture.size,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                furniture.type.trim(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                  ],
                ),
          const Spacer(),
          Text(
            furniture.qty.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
