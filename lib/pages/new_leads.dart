import 'package:boxigo_assignment/models/floor_info.dart';
import 'package:flutter/material.dart';
import 'package:boxigo_assignment/models/furniture.dart';
import 'package:boxigo_assignment/widgets/furniture_item.dart';

class NewLeads extends StatefulWidget {
  const NewLeads({
    super.key,
    required this.floorInfo,
    required this.items,
  });

  final FloorInfo floorInfo;
  final Map<String, dynamic> items;

  @override
  State<NewLeads> createState() {
    return _NewLeadsState();
  }
}

class _NewLeadsState extends State<NewLeads> {
  Widget _floorInfo() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Existing house details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Floor No'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.oldFloorNo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Elevator Available'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.oldElevator,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Packing Required'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.packing,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Distance from door to truck'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.oldParking,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Additional information'),
                const Text(
                  'Dog is available so please call once you reach',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            height: 40,
            width: double.infinity,
            color: Colors.grey[300],
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'New house details',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Floor No'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.newFloorNo,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Elevator Available'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.newElevator,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Packing Required'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.unpacking,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text('Distance from door to truck'),
                    const Spacer(),
                    Text(
                      widget.floorInfo.newParking,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Additional information'),
                const Text(
                  'Dog is available so please call once you reach',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _items() {
    final List customItems = widget.items['customItems']['items'];
    final Map<String, dynamic> furniture = widget.items['inventory'][0];
    final List<Furniture> furnitureItems = [];
    String size = '';
    String type = '';
    for (int i = 0; i < furniture['category'].length; i++) {
      for (int j = 0; j < furniture['category'][i]['items'].length; j++) {
        if (furniture['category'][i]['items'][j]['qty'] > 0) {
          if (furniture['category'][i]['items'][j]['size'] != null) {
            for (int s = 0;
                s < furniture['category'][i]['items'][j]['size'].length;
                s++) {
              if (furniture['category'][i]['items'][j]['size'][s]['selected']) {
                size =
                    furniture['category'][i]['items'][j]['size'][s]['option'];
              }
            }
          }
          if (furniture['category'][i]['items'][j]['type'] != null) {
            for (int t = 0;
                t < furniture['category'][i]['items'][j]['type'].length;
                t++) {
              if (furniture['category'][i]['items'][j]['type'][t]['selected']) {
                type =
                    furniture['category'][i]['items'][j]['type'][t]['option'];
              }
            }
          }
          furnitureItems.add(Furniture(
            category: Category.values.byName(furniture['category'][i]['name']),
            displayName: furniture['category'][i]['items'][j]['displayName'],
            qty: furniture['category'][i]['items'][j]['qty'],
            size: size,
            type: type,
          ));
          size = '';
          type = '';
        }
      }
    }
    // for (int i = 0; i < furnitureItems.length; i++) {
    //   print(furnitureItems[i].displayName);
    //   print(furnitureItems[i].displayName.contains('Bed'));
    //   print(furnitureItems[i].qty);
    //   print(furnitureItems[i].size);
    //   print(furnitureItems[i].type);
    // }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.all(20),
              collapsedBackgroundColor: Colors.grey[300],
              title: Text(
                'Living Room',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900],
                ),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Furniture',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (int i = 0; i < furnitureItems.length; i++)
                      //if (!furnitureItems[i].displayName.contains('Bed'))
                      if (furnitureItems[i].category == Category.sofa ||
                          furnitureItems[i].category == Category.table ||
                          furnitureItems[i].category == Category.chair ||
                          furnitureItems[i].category == Category.misc)
                        FurnitureItem(furniture: furnitureItems[i]),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.all(20),
              collapsedBackgroundColor: Colors.grey[300],
              title: Text(
                'Bed Room',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900],
                ),
              ),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Furniture',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (int i = 0; i < furnitureItems.length; i++)
                      //if (furnitureItems[i].displayName.contains('Bed'))
                      if (furnitureItems[i].category == Category.cot ||
                          furnitureItems[i].category == Category.mattress ||
                          furnitureItems[i].category == Category.cupboard)
                        FurnitureItem(furniture: furnitureItems[i]),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ExpansionTile(
              expandedAlignment: Alignment.centerLeft,
              childrenPadding: const EdgeInsets.all(20),
              collapsedBackgroundColor: Colors.grey[300],
              title: Text(
                'Custom Items',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[900],
                ),
              ),
              children: [
                if (customItems.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customItems[0]['item_name'],
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(customItems[0]['item_description']),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'L: ${customItems[0]['item_length']}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'W: ${customItems[0]['item_width']}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            'H: ${customItems[0]['item_height']}',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('New Leads'),
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
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.orange[900],
            labelColor: Colors.orange[900],
            tabs: const [
              Tab(
                text: 'Items',
              ),
              Tab(
                text: 'Floor Info',
              ),
              Tab(
                text: 'Send Quote',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _items(),
            _floorInfo(),
            const Center(
              child: Text(
                'Send Quote',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
