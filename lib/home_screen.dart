import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Model/ProductsModel.dart';

class ProductsMOdels extends StatefulWidget {
  const ProductsMOdels({super.key});

  @override
  State<ProductsMOdels> createState() => _ProductsMOdelsState();
}

class _ProductsMOdelsState extends State<ProductsMOdels> {
  Future<ProductsModel> getproducapi() async {
    final response = await http.get(
        Uri.parse('https://webhook.site/1689be0b-fb73-4ab3-b172-ca99e7be6955'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('High Complex Api'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: getproducapi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(snapshot
                                .data!.data![index].shop!.image
                                .toString()),
                          ),
                          title: Text(snapshot.data!.data![index].shop!.name
                              .toString()),
                          subtitle: Text(snapshot
                              .data!.data![index].shop!.shopaddress
                              .toString()),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * .3,
                          width: MediaQuery.of(context).size.width * 1,
                          child: ListView.builder(
                            itemCount:
                                snapshot.data!.data![index].images!.length,
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .5,
                                  width:
                                      MediaQuery.of(context).size.width * .25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(11),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(snapshot
                                              .data!
                                              .data![index]
                                              .images![position]
                                              .url
                                              .toString()))),
                                ),
                              );
                            },
                          ),
                        ),
                        Icon(snapshot.data!.data![index].inWishlist == true
                            ? Icons.favorite
                            : Icons.favorite_outline)
                      ],
                    );
                  },
                );
              } else {
                return Text('loading');
              }
            },
          ))
        ],
      ),
    );
  }
}

// Future<ProductsModel> getProductApi() async {
//     final response = await http.get(
//         Uri.parse('https://webhook.site/1689be0b-fb73-4ab3-b172-ca99e7be6955'));
//     var data = jsonDecode(response.body.toString());

//     if (response.statusCode == 200) {
//       return ProductsModel.fromJson(data);
//     } else {
//       return ProductsModel.fromJson(data);
//     }
//   }
// ============================

//  Expanded(
//               child: FutureBuilder(
//             future: getProductApi(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemCount: snapshot.data!.data!.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           title: Text(snapshot.data!.data![index].shop!.name
//                               .toString()),
//                           subtitle: Text(snapshot
//                               .data!.data![index].shop!.shopemail
//                               .toString()),
//                           leading: CircleAvatar(
//                               backgroundImage: NetworkImage(snapshot
//                                   .data!.data![index].shop!.image
//                                   .toString())),
//                         ),
//                         Container(
//                             height: MediaQuery.of(context).size.height * .3,
//                             width: MediaQuery.of(context).size.width * 1,
//                             child: ListView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount:
//                                   snapshot.data!.data![index].images!.length,
//                               itemBuilder: (context, position) {
//                                 return Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Container(
//                                     height: MediaQuery.of(context).size.height *
//                                         .25,
//                                     width:
//                                         MediaQuery.of(context).size.width * .5,
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(11),
//                                         image: DecorationImage(
//                                             fit: BoxFit.cover,
//                                             image: NetworkImage(snapshot
//                                                 .data!
//                                                 .data![index]
//                                                 .images![position]
//                                                 .url
//                                                 .toString()))),
//                                   ),
//                                 );
//                               },
//                             )),
//                         Icon(snapshot.data!.data![index].inWishlist == false
//                             ? Icons.favorite
//                             : Icons.favorite_outline)
//                       ],
//                     );
//                   },
//                 );
//               } else {
//                 return Text('Loading');
//               }
//             },
//           ))
