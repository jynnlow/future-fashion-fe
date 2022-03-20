import 'package:flutter/material.dart';
import 'package:future/models/product_model.dart';

class SizeChart extends StatelessWidget {
  final ProductModel clothes;

  const SizeChart({Key? key, required this.clothes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Size Chart',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Table(
              border: TableBorder.all(),
              children: [
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'Size',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'Chest',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'Waist',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'Hip',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'XS',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.xs!.chest}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.xs!.waist}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.xs!.hip}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'S',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.s!.chest}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.s!.waist}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.s!.hip}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'M',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.m!.chest}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.m!.waist}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.m!.hip}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'L',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.l!.chest}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.l!.waist}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.l!.hip}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        'XL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.xl!.chest}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.xl!.waist}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Center(
                          child: Text(
                        '${clothes.xl!.hip}',
                        style: const TextStyle(fontSize: 15),
                      )),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]));
  }
}
