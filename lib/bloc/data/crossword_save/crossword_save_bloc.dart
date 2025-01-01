import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cword/data/entity/level_save.dart';
import 'package:cword/data/model/language.dart';
import 'package:cword/data/model/word.dart';
import 'package:cword/data/entity/crossword.dart';
import 'package:cword/data/repositories/levels_repository.dart';
import 'package:cword/data/repositories/words_repository.dart';
import '../../providers.dart';

class LevelSaveBloc extends Bloc<LevelSaveEvent, LevelSaveState> {
  LevelSaveBloc() : super(LevelSaveStateNotInitialized()) {
    on<LevelSaveEvent>(
      (event, emit) async {
        if (event is LevelSaveEventPerform) {
          emit(LevelSaveStateLoading());

          final LevelSaveRepository repository = LevelSaveRepository();

          var levelDataId = await repository.insertLevel(
              language: Language.eng,
              level: LevelSave(
                wordsGrid: event.levelData.wordsGrid,
                gridSizeX: event.levelData.gridSizeX,
                gridSizeY: event.levelData.gridSizeY,
                letters: event.levelData.letters,
                words: event.levelData.words,
              ));

          emit(LevelSaveStateCompleted(levelDataId: levelDataId));
        }
      },
      transformer: sequential(),
    );
  }

  Crossword createCrossword({
    required int size,
    required List<Word> data,
  }) {
    final crossword = Crossword(size, size);
    crossword.reset();
    data.shuffle();

    for (var row in data) {
      if (!crossword.isCompleted()) {
        if (crossword.addWord(row.word) == 0) {
          // orrizzontale
        } else if (crossword.addWord(row.word) == 1) {
          // verticale
        } else {
          // non usata
        }
      } else {
        continue;
      }
    }

    return crossword;
  }
}

final class LevelSaveEventPerform extends LevelSaveEvent {
  LevelSaveEventPerform({
    required this.levelData,
  });

  final LevelSave levelData;
}

final class LevelSaveEvent {}

final class LevelSaveStateCompleted extends LevelSaveState {
  LevelSaveStateCompleted({required this.levelDataId});

  final int? levelDataId;
}

final class LevelSaveStateLoading extends LevelSaveState {}

final class LevelSaveStateNotInitialized extends LevelSaveState {}

final class LevelSaveState {}
