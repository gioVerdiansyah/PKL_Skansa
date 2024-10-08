import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/event/fill_journal_event.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/state/fill_journal_state.dart';

class FillJournalBloc extends Bloc<FillJournalEvent, FillJournalState> {
  FillJournalBloc() : super(const FillJournalState(journalContent: null, journalFileInfo: null)) {
    on<WriteJournalActivityEvent>((event, emit) {
      emit(state.copyWith(journalContent: event.content));
    });

    on<PutJournalFileEvent>((event, emit) {
      emit(FillJournalState(journalFileInfo: event.fileInfo, journalContent: state.journalContent));
    });

    on<RemoveJournalFileEvent>((event, emit) {
      emit(FillJournalState(journalFileInfo: null, journalContent: state.journalContent));
    });

    on<RemoveJournalEvent>((event, emit) {
      emit(const FillJournalState(journalFileInfo: null, journalContent: null));
    });
  }
}