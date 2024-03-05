import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../domain/models/cards.dart';
import '../global/widgets/card.dart';
import '../global/widgets/option_box .dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  List<DataCard>? response = [];
  int _visibleDataCount = 10;
  int selectedOptionIndex = -1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getDataCards();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreData() {
    setState(() {
      _visibleDataCount += 10;
    });
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> getDataCards() async {
    response = await Injector.of(context)?.controllerDataRepository.getCards();
    setState(() {});
  }

  Future<void> getDatabyArchetype(String nameArchetype) async {
    response = await Injector.of(context)
        ?.controllerDataRepository
        .getCards(nameArchetype);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: response!.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                  color: const Color.fromARGB(240, 0, 0, 0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 50, left: 15, right: 15),
                          child: Text(
                            "YU-GI-HO",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Text(
                            "consulta la carta, y confia en el corazon de las cartas",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "filtrar por arquetipos",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Wrap(
                                  spacing: 10, // Espacio entre las opciones
                                  children: [
                                    OptionBox(
                                      text: 'Crystron',
                                      index: 0,
                                      isSelected: selectedOptionIndex == 0,
                                      onPressed: () {
                                        setState(() {
                                          getDatabyArchetype("Crystron");
                                          selectedOptionIndex = 0;
                                        });
                                      },
                                    ),
                                    OptionBox(
                                      text: 'Destiny HERO',
                                      index: 1,
                                      isSelected: selectedOptionIndex == 1,
                                      onPressed: () {
                                        setState(() {
                                          getDatabyArchetype("Destiny%20HERO");
                                          selectedOptionIndex = 1;
                                        });
                                      },
                                    ),
                                    OptionBox(
                                      text: 'Six Samurai',
                                      index: 2,
                                      isSelected: selectedOptionIndex == 2,
                                      onPressed: () {
                                        setState(() {
                                          getDatabyArchetype("Six%20Samurai");
                                          selectedOptionIndex = 2;
                                        });
                                      },
                                    ),
                                    OptionBox(
                                      text: 'Exodo',
                                      index: 3,
                                      isSelected: selectedOptionIndex == 3,
                                      onPressed: () {
                                        setState(() {
                                          selectedOptionIndex = 3;
                                          getDatabyArchetype("Exodo");
                                        });
                                      },
                                    ),
                                    OptionBox(
                                      text: 'Guardragon',
                                      index: 4,
                                      isSelected: selectedOptionIndex == 4,
                                      onPressed: () {
                                        setState(() {
                                          getDatabyArchetype("Guardragon");
                                          selectedOptionIndex = 4;
                                        });
                                      },
                                    ),
                                    // Agrega más opciones según sea necesario
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            controller: _scrollController,
                            itemCount: _visibleDataCount < response!.length
                                ? _visibleDataCount
                                : response!.length,
                            itemBuilder: (context, index) {
                              final DataCard data = response![index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                child: MyCard(dataCard: data),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:const [
                  Text(
                    "Cargando...",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
    );
  }
}
