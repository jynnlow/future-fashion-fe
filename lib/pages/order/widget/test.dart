// return GetBuilder<OrderController>(builder: (orderController) {
//       var orderList = orderController.orderList;
//       return Scaffold(
//         body: orderList.isNotEmpty
//             ? Stack(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     height: 1000,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       itemCount: orderList.length,
//                       itemBuilder: (context, index) => Card(
//                         margin: const EdgeInsets.symmetric(
//                             horizontal: 10, vertical: 2),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: GestureDetector(
//                           onTap: (() {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => OrderDetailsPage(
//                                     orderList: orderList[index].snapshots!)));
//                           }),
//                           child: Stack(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: Row(
//                                   children: [
//                                     const SizedBox(width: 10),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "ID: #000000" +
//                                               orderList[index].id.toString(),
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.5,
//                                               fontSize: 15),
//                                         ),
//                                         Text(
//                                           "Status: " +
//                                               orderList[index]
//                                                   .status
//                                                   .toString(),
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.5,
//                                               color: Colors.pink),
//                                         ),
//                                         Text(
//                                           "Total Amount: RM" +
//                                               orderList[index].total.toString(),
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.5,
//                                               color: Colors.grey),
//                                         ),
//                                         Text(
//                                           "Total Item: " +
//                                               orderList[index]
//                                                   .snapshots!
//                                                   .length
//                                                   .toString(),
//                                           style: const TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               height: 1.5,
//                                               color: Colors.grey),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               )
//             : Container(),
//       );
//     });