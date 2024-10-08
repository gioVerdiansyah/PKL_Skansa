import 'package:equatable/equatable.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

abstract class FillJournalEvent<T> extends Equatable {
  const FillJournalEvent();

  @override
  List<Object?> get props => [];
}

class WriteJournalActivityEvent extends FillJournalEvent {
  final String? content;
  const WriteJournalActivityEvent(this.content);

  @override
  List<Object?> get props => [content];
}

class PutJournalFileEvent extends FillJournalEvent {
  final List<PlatformFile>? fileInfo;
  const PutJournalFileEvent(this.fileInfo);

  @override
  List<Object?> get props => [fileInfo];
}

class RemoveJournalFileEvent extends FillJournalEvent {}

class RemoveJournalEvent extends FillJournalEvent {}
