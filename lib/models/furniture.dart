import 'package:flutter/material.dart';

enum Category { sofa, table, chair, cot, mattress, cupboard, misc }

const categoryIcon = {
  Category.sofa: Icons.chair_outlined,
  Category.table: Icons.table_bar_outlined,
  Category.chair: Icons.chair_alt_outlined,
  Category.cot: Icons.bed_outlined,
  Category.mattress: Icons.bed,
  Category.cupboard: Icons.kitchen_outlined,
  Category.misc: Icons.table_restaurant_outlined,
};

class Furniture {
  const Furniture(
      {required this.category,
      required this.displayName,
      required this.size,
      required this.type,
      required this.qty});

  final Category category;
  final String displayName;
  final String size;
  final String type;
  final int qty;
}
