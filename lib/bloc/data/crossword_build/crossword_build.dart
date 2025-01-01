import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:cword/data/model/language.dart';
import 'package:cword/data/model/word.dart';
import 'package:cword/data/entity/crossword.dart';
import 'package:cword/data/repositories/words_repository.dart';
import '../../providers.dart';

class CrosswordBuildBloc
    extends Bloc<CrosswordBuildEvent, CrosswordBuildState> {
  CrosswordBuildBloc() : super(CrosswordBuildStateNotInitialized()) {
    on<CrosswordBuildEvent>(
      (event, emit) async {
        if (event is CrosswordBuildEventGenerate) {
          emit(CrosswordBuildStateLoading());
          final WordsRepository repository = WordsRepository();
          var result = await repository.searchByLetters(
              letters: event.letters, lang: event.lang);
          final sessionWords = Word.fromListMap(result);
          final crossword = createCrossword(
              sizeX: event.gridSizeVertical,
              sizeY: event.gridSizeHorizontal,
              data: sessionWords);
          emit(CrosswordBuildStateReady(crossword));
        }
      },
      transformer: sequential(),
    );
  }

  Crossword createCrossword({
    required int sizeX,
    required int sizeY,
    required List<Word> data,
  }) {
    final crossword = Crossword(sizeX, sizeY);
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

    crossword.trimMatrix();

    return crossword;
  }
}

final class CrosswordBuildEventGenerate extends CrosswordBuildEvent {
  CrosswordBuildEventGenerate(
      {required this.gridSizeVertical,
      required this.gridSizeHorizontal,
      required this.letters,
      required this.lang});

  final int gridSizeVertical;
  final int gridSizeHorizontal;
  final String letters;
  final Language lang;
}

final class CrosswordBuildEvent {}

final class CrosswordBuildStateReady extends CrosswordBuildState {
  CrosswordBuildStateReady(this.crossword);

  final Crossword crossword;
}

final class CrosswordBuildStateLoading extends CrosswordBuildState {}

final class CrosswordBuildStateNotInitialized extends CrosswordBuildState {}

final class CrosswordBuildState {}
