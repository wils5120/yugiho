import 'package:flutter/material.dart';

import '../../../domain/models/cards.dart';
import '../../routes/routes.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.dataCard});

  final DataCard dataCard;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {

  @override
  Widget build(BuildContext context) {
    return 
     widget.dataCard.banlistInfo?.banOcg != "Banned" ?
    InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.details,
            arguments: widget.dataCard);
      },
      child: Container(
        decoration: BoxDecoration(
          color:const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color:const Color.fromARGB(255, 184, 184, 184).withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 1,
              offset: const Offset(1, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.dataCard.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 400,
                  height: 500,
                  child: Image.network(
                    widget.dataCard.cardImages[0].imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Arqueotipo ${widget.dataCard.archetype}",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Tipo ${widget.dataCard.type}",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.dataCard.attribute != ""
                          ? "Atributo ${widget.dataCard.attribute}"
                          : "Atributo NA",
                      style: const TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Ataque ${widget.dataCard.atk.toString()}",
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Defensa ${widget.dataCard.def.toString()}",
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ): Container();
  }
}
