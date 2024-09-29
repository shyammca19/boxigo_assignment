import 'package:boxigo_assignment/models/floor_info.dart';

class EstimateFlow {
  const EstimateFlow(
      {required this.id,
      required this.fromCity,
      required this.toCity,
      required this.fromAddress,
      required this.toAddress,
      required this.movingOn,
      required this.propertySize,
      required this.totalItems,
      required this.distance,
      required this.floorInfo,
      required this.items});

  final String id;
  final String fromCity;
  final String toCity;
  final String fromAddress;
  final String toAddress;
  final String movingOn;
  final String propertySize;
  final String totalItems;
  final String distance;
  final FloorInfo floorInfo;
  final Map<String, dynamic> items;
}
