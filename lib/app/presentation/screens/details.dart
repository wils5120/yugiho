import 'package:flutter/material.dart';

import '../../domain/models/cards.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  DataCard dataCardDetail = DataCard(
    id: 0,
    name: "",
    type: "type",
    frameType: "frameType",
    desc: "desc",
    def: 0,
    atk: 0,
    race: "race",
    attribute: "attribute",
    archetype: "archetype",
    linkval: 0,
    linkmarkers: [],
    ygoprodeckUrl: "ygoprodeckUrl",
    cardSets: [],
    cardImages: [],
    cardPrices: [],
  );
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dataCardDetail = ModalRoute.of(context)?.settings.arguments as DataCard;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor:const Color.fromARGB(255, 0, 0, 0),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: [
              Center(
                child: Text(
                  dataCardDetail.name,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Image.network(
                  dataCardDetail.cardImages[0].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Description: ${dataCardDetail.desc}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 145, 10, 10),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color:const Color.fromARGB(255, 123, 3, 3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 171, 171, 171)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(1, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "ATK ${dataCardDetail.atk.toString()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 0, 151, 13),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:const Color.fromARGB(255, 16, 134, 16)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 1,
                            offset: const Offset(1, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "DEF ${dataCardDetail.def.toString()}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30,  bottom: 8),
                child: Text(
                  "Type ${dataCardDetail.type}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Type game ${dataCardDetail.race}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Element ${dataCardDetail.attribute}",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
