import 'package:boxigo_assignment/models/floor_info.dart';
import 'package:flutter/material.dart';

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
    return Padding(
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
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Furniture',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.chair_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Single Seated Sofa'),
                          Text(
                            'Large | Leather',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.chair_alt_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Wooden Chairs'),
                          Text(
                            'small',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.tv_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Entertainment Unit'),
                          Text(
                            'Medium | Wooden',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.table_bar_sharp),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tea Table'),
                          Text(
                            'Medium | Wooden',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '2',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
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
            children: const [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Furniture',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(Icons.bed_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Cot'),
                          Text(
                            'Large | Wooden',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Spacer(),
                      Text(
                        '1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          title: const Text('New Leads'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
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
