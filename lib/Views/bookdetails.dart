// ignore_for_file: must_be_immutable, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, unused_result, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:app/Views/Buynow.dart';
import 'package:app/api_all/api_book/api_provider.dart';
import 'package:app/widgets/best_sellers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import '../api_all/api_book/api_service.dart';
import '../widgets/author.dart';

class BookDetails extends ConsumerStatefulWidget {
  BookDetails({super.key});

  @override
  ConsumerState<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends ConsumerState<BookDetails> {
  @override
  Widget build(BuildContext context) {
    final FutureProvider = ref.watch(bookByIdFutureProvider);
    final listProvider = ref.watch(booksFutureProvider);

    // final List<String> items = List<String>.generate(5, (i) => '$i');
    return Scaffold(
      appBar: AppBar(
        actions: [
          FutureProvider.when(
            data: (data) => Row(
              children: [
                IconButton(onPressed: ()
                {
                  //  ref
                  //       .read(apiServiceProvider)
                  //       .addReadingList(data.id.toString())
                  //       .then((value) {
                  //     ref.refresh(booksFutureProvider);
                  //   });


                }, icon: const Icon(Icons.menu_book_outlined)),
                IconButton(
                  icon: data.isFavorite
                      ? const Icon(Icons.star, color: Colors.yellow)
                      : const Icon(
                          Icons.star_border_outlined,
                        ),
                  onPressed: () {
                    ref
                        .read(apiServiceProvider)
                        .addFavorite(data.id.toString())
                        .then((value) {
                      ref.refresh(booksFutureProvider);
                    });
                  },
                ),
              ],
            ),
            error: (Object error, StackTrace stackTrace) {
              return Text(error.toString());
            },
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
      body: FutureProvider.when(
          data: (data) => SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(children: [
                            data.image == null
                                ? Image.asset(
                                    'view/kitabalaya.png',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 180,
                                  )
                                : Image.memory(base64Decode(data.image),
                                    height: 120, width: 100),
                            const SizedBox(
                              width: 50,
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                              thickness: 5,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(data.price,
                                      style: const TextStyle(fontSize: 15)),
                                  Text(
                                    data.author.name,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ]),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            data.description,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),

                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),

                        // ignore: sized_box_for_whitespace
                        Container(
                          child: author(data),
                        ),
                        const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 50,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(() => BuyNow());
                                },
                                child: const Row(
                                  children: [
                                    Text("Add to Cart"),
                                    Icon(Icons.add_shopping_cart)
                                  ],
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(() => BuyNow());
                                },
                                child: const Row(
                                  children: [
                                    Text("Buy Now"),
                                    Icon(Icons.bookmark)
                                  ],
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "You may also like",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        listProvider.when(
                            data: (data) => SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children:
                                        List.generate(data.length, (index) {
                                  return bestSellers(
                                      data[index], data[index].id, ref);
                                }))),
                            error: (Object error, StackTrace stackTrace) {
                              return Text(error.toString());
                            },
                            loading: () {
                              return const CircularProgressIndicator();
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
          error: (Object error, StackTrace stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const CircularProgressIndicator();
          }),
    );
  }
}
