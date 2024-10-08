import 'package:equatable/equatable.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class FillJournalState extends Equatable {
  final String? journalContent;
  final List<PlatformFile>? journalFileInfo;

  const FillJournalState({this.journalContent, this.journalFileInfo});

  FillJournalState copyWith({
    String? journalContent,
    List<PlatformFile>? journalFileInfo,
  }) {
    return FillJournalState(
      journalContent: journalContent ?? this.journalContent,
      journalFileInfo: journalFileInfo != null ? List.of(journalFileInfo) : this.journalFileInfo,
    );
  }

  @override
  List<Object?> get props => [journalContent, journalFileInfo];
}