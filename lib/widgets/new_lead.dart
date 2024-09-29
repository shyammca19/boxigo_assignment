import 'package:boxigo_assignment/models/estimate_flow.dart';
import 'package:flutter/material.dart';
import 'package:boxigo_assignment/pages/new_leads.dart';
import 'package:intl/intl.dart';

class NewLead extends StatelessWidget {
  const NewLead({super.key, required this.newlead});

  final EstimateFlow newlead;

  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.parse(newlead.movingOn);
    final date = DateFormat.d().format(datetime);
    final month = DateFormat.MMM().format(datetime);
    final time = DateFormat.Hm().format(datetime);
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  month,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[900]),
                ),
                Text(time),
              ],
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        newlead.fromCity,
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(
                        newlead.id,
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(newlead.fromAddress),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_downward_sharp,
                        color: Colors.orange[900],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.house,
                              color: Colors.orange[900],
                            ),
                            Text(newlead.propertySize)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.table_chart,
                              color: Colors.orange[900],
                            ),
                            Text(newlead.totalItems)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.category,
                              color: Colors.orange[900],
                            ),
                            const Text('20 boxes'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: Colors.orange[900],
                            ),
                            Text(newlead.distance)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    newlead.toCity,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(newlead.toAddress),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NewLeads(
                                floorInfo: newlead.floorInfo,
                                items: newlead.items,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: Colors.orange[900]!,
                            ),
                          ),
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.orange[900],
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.orange[900],
                          ),
                          child: const Text(
                            'Submit Quoat',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey,
        )
      ],
    );
  }
}
