import 'package:cword/bloc/data/crossword_save/crossword_save_bloc.dart';
import 'package:cword/bloc/providers.dart';
import 'package:cword/data/entity/level_save.dart';
import 'package:cword/data/model/language.dart';
import 'package:cword/global.dart';
import 'package:cword/ui/button.dart';
import 'package:cword/ui/const.dart';
import 'package:cword/ui/label.dart';

class GeneratorToolsPanel extends StatefulWidget {
  const GeneratorToolsPanel({super.key});

  @override
  State<GeneratorToolsPanel> createState() => _GeneratorToolsPanelState();
}

class _GeneratorToolsPanelState extends State<GeneratorToolsPanel> {
  final TextEditingController _lettersTextEditingController =
      TextEditingController(text: '');
  final TextEditingController _gridSizeXtextEditingController =
      TextEditingController(text: '');
  final TextEditingController _gridSizeYtextEditingController =
      TextEditingController(text: '');

  void updateGridSize() {
    if (int.tryParse(_gridSizeXtextEditingController.text) != null &&
        int.tryParse(_gridSizeYtextEditingController.text) != null) {
      crosswordBuildBloc.add(CrosswordBuildEventGenerate(
          gridSizeHorizontal: int.parse(_gridSizeXtextEditingController.text),
          gridSizeVertical: int.parse(
            _gridSizeYtextEditingController.text,
          ),
          letters: _lettersTextEditingController.text,
          lang: Language.eng));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 0.2.sw,
            child: Column(
              children: [
                BlocBuilder<CrosswordBuildBloc, CrosswordBuildState>(
                    bloc: crosswordBuildBloc,
                    builder: (context, state) {
                      return Column(
                        children: [
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyButton(
                                text: 'Save',
                                minWidth: 120,
                                height: 50,
                                icon: Icon(
                                  Icons.save,
                                  color: Colors.white,
                                ),
                                // elevatedButton: true,
                                onPressed: () {
                                  levelSaveBloc.add(LevelSaveEventPerform(
                                      levelData: LevelSave(
                                    wordsGrid: (state is CrosswordBuildStateReady)
                                        ? state.crossword.getBoard()
                                        : [],
                                    gridSizeX:
                                        int.parse(_gridSizeXtextEditingController.text),
                                    gridSizeY:
                                        int.parse(_gridSizeYtextEditingController.text),
                                    letters: _lettersTextEditingController.text,
                                    words: state is CrosswordBuildStateReady
                                        ? state.crossword.usedWords
                                        : [],
                                  )));
                                },
                              ),
                              MyButton(
                                text: 'Generate',
                                minWidth: 120,
                                height: 50,
                                color: AppConstants.mainColor2,
                                icon: Icon(
                                  Icons.change_circle_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  updateGridSize();
                                },
                              ),
                              MyButton(
                                text: 'Generate',
                                minWidth: 120,
                                height: 50,
                                color: AppConstants.mainColor2,
                                icon: Icon(
                                  Icons.change_circle_outlined,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  updateGridSize();
                                },
                              )
                            ],
                          ),
                          SizedBox(height: 40),
                          LLabel(
                            text: 'Letters:',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                            child: TextField(
                              controller: _lettersTextEditingController,
                              textAlign: TextAlign.center,
                              onChanged: (value) {
                                updateGridSize();
                              },
                            ),
                          ),
                          LLabel(
                            text: 'Grid size:',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _gridSizeXtextEditingController,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      updateGridSize();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _gridSizeYtextEditingController,
                                    textAlign: TextAlign.center,
                                    onChanged: (value) {
                                      updateGridSize();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LLabel(text: 'Words: '),
                              LLabel(
                                  text:
                                  '${(state is CrosswordBuildStateReady) ? state.crossword.usedWords : ''}'),
                            ],
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
