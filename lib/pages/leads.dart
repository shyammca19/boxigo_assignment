import 'package:boxigo_assignment/models/floor_info.dart';
import 'package:flutter/material.dart';
import 'package:boxigo_assignment/widgets/new_lead.dart';
import 'package:boxigo_assignment/models/estimate_flow.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Leads extends StatefulWidget {
  const Leads({super.key});

  @override
  State<Leads> createState() {
    return _LeadsState();
  }
}

class _LeadsState extends State<Leads> {
  List<EstimateFlow> estimateflow = [];
  var isloading = true;

  Widget _buildPage(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  void _loadLeads() async {
    final url = Uri.parse("http://test.api.boxigo.in/sample-data/");

    try {
      final response = await http.get(url);
      //print(response.statusCode);
      final Map<String, dynamic> listData = json.decode(response.body);
      List entries = listData['Customer_Estimate_Flow'];
      final List<EstimateFlow> loadedItems = [];
      for (int i = 0; i < entries.length; i++) {
        loadedItems.add(
          EstimateFlow(
            id: entries[i]['estimate_id'],
            fromCity: entries[i]['from_address']['fromCity'],
            toCity: entries[i]['to_address']['toCity'],
            fromAddress: entries[i]['moving_from'],
            toAddress: entries[i]['moving_to'],
            movingOn: entries[i]['moving_on'],
            propertySize: entries[i]['property_size'],
            totalItems: entries[i]['total_items'],
            distance: entries[i]['distance'],
            floorInfo: FloorInfo(
              oldFloorNo: entries[i]['old_floor_no'],
              newFloorNo: entries[i]['new_floor_no'],
              oldElevator: entries[i]['old_elevator_availability'],
              newElevator: entries[i]['new_elevator_availability'],
              oldParking: entries[i]['old_parking_distance'],
              newParking: entries[i]['new_parking_distance'],
              packing: entries[i]['packing_service'],
              unpacking: entries[i]['unpacking_service'],
            ),
            items: entries[i]['items'],
          ),
        );
      }
      //print(loadedItems[0].items);
      setState(() {
        estimateflow = loadedItems;
        isloading = false;
      });
    } catch (error) {
      print(error);
    }
  }

  Widget _showLeads() {
    return ListView.builder(
      itemCount: estimateflow.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(18),
          child: NewLead(
            newlead: estimateflow[index],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadLeads();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: const Icon(Icons.account_circle_outlined),
          title: const Text('Leads'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Stack(
                children: [
                  const Icon(Icons.notifications_none_outlined),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 13,
                      height: 13,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        '99',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  )
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            indicatorColor: Colors.orange[900],
            labelColor: Colors.orange[900],
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'New',
              ),
              Tab(
                text: 'Follow Up',
              ),
              Tab(
                text: 'Booked',
              ),
              Tab(
                text: 'In Transit',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            isloading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange[900],
                    ),
                  )
                : _showLeads(),
            isloading
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange[900],
                    ),
                  )
                : _showLeads(),
            _buildPage('Follow Up'),
            _buildPage('Booked'),
            _buildPage('In Transit'),
          ],
        ),
      ),
    );
  }
}
