import 'package:flutter/material.dart';

import '../../../domain/models/cards.dart';

class MyCard extends StatefulWidget {
  const MyCard({super.key, required this.dataCard});

  final DataCard dataCard;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(255, 255, 255, 255),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 171, 171, 171).withOpacity(0.5),
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
              child: Text(widget.dataCard.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 400,
                height: 400,
                /*   child: Image.network(
                    "https://images.ygoprodeck.com/images/cards/64163367.jpg", scale: 1,), */
                child: Image.network(
                  widget.dataCard.cardImages[0].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.dataCard.desc),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "ATK ${widget.dataCard.atk.toString()}",
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
                    "tipo de marco ${widget.dataCard.frameType}",
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Race ${widget.dataCard.race}",
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
            )
          ],
        ),
      ),
    );
  }
}
