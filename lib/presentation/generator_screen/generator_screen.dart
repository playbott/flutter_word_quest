import 'package:cword/bloc/providers.dart';
import 'package:cword/global.dart';
import 'package:cword/ui/label.dart';
import 'package:path/path.dart' as p;

import 'package:cword/ui/grid_builder.dart';
import 'package:flutter/material.dart';

import 'generator_panel.dart';
import 'word_comb_table.dart';

class GeneratorScreen extends StatefulWidget {
  const GeneratorScreen({super.key});

  @override
  GeneratorScreenState createState() => GeneratorScreenState();
}

class GeneratorScreenState extends State<GeneratorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: LLabel(
          text: 'Crossword Sandbox',
          color: Colors.white,
        ),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 0.2.sw,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: BlocBuilder<CrosswordBuildBloc,
                                CrosswordBuildState>(
                            bloc: crosswordBuildBloc,
                            builder: (context, state) {
                              if (state is CrosswordBuildStateReady) {
                                return Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                              // width: MediaQuery.of(context).size.width,
                                              padding: EdgeInsets.all(12),
                                              child: CrossWordGrid(
                                                  crossword: state.crossword)),
                                        ),
                                      ],
                                    )),
                                  ],
                                );
                              }
                              return Container(
                                alignment: Alignment.center,
                                // width: MediaQuery.of(context).size.width / 2,
                                height: 0.3.sw,
                                child: CircularProgressIndicator(),
                              );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Container(
                width: 0.75.sw,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GeneratorToolsPanel(),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                        child: DataTable2SimpleDemo(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
