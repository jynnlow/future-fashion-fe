import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final tagsList = ['Woman', 'T-shirt', 'Dress'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Column(children: [
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
        // Row(
        //   children: tagsList
        //       .map((e) => Container(
        //             padding: const EdgeInsets.all(10),
        //             margin: const EdgeInsets.only(top: 10, right: 10),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10),
        //               color: Colors.pink.withOpacity(0.8),
        //             ),
        //             child: Text(
        //               e,
        //               style: const TextStyle(color: Colors.white),
        //             ),
        //           ))
        //       .toList(),
        // ),
      ]),
    );
  }
}
