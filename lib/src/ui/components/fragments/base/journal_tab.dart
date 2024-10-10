import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/bloc/fill_journal_bloc.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/event/fill_journal_event.dart';
import 'package:pkl_smkn1mejayan_siswa/src/blocs/state/fill_journal_state.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/components/commons/text_input.dart';
import 'package:pkl_smkn1mejayan_siswa/src/ui/utils/file_handler.dart';
import '../../../../constants/color_constant.dart';

class JournalTab extends StatefulWidget {
  final BuildContext context;

  const JournalTab({super.key, required this.context});

  @override
  State<JournalTab> createState() => _JournalTab();
}

class _JournalTab extends State<JournalTab> {
  void _onPickFile() async {
    List<PlatformFile>? fileInfo = await pickFile();
    if (fileInfo != null) {
      context.read<FillJournalBloc>().add(PutJournalFileEvent(fileInfo));
    }
  }

  void _onCancel() async {
    await clearFileCache();
    context.read<FillJournalBloc>().add(RemoveJournalFileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FillJournalBloc, FillJournalState>(
      builder: (context, state) {
        bool fileSelected = (state.journalFileInfo != null) ? true : false;

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormBuilder(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      TextInput.description(
                        initialValue: state.journalContent,
                        onChanged: (value) => context.read<FillJournalBloc>().add(WriteJournalActivityEvent(value)),
                        maxLine: 5,
                        labelText: "Kegiatan yang dilakukan",
                        name: "activity",
                      ),
                      const SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              TextButton.icon(
                                onPressed: () => (!fileSelected) ? _onPickFile() : _onCancel(),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: ColorConstant.primary,
                                  foregroundColor: ColorConstant.white,
                                ),
                                icon: const Icon(Icons.file_open_rounded),
                                label: Text(fileSelected ? "Batal" : "Pilih file"),
                              ),
                              const SizedBox(width: 20,),
                              TextButton.icon(
                                onPressed: (){
                                  // TODO: SEND TO API
                                  Navigator.pop(widget.context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: ColorConstant.primary,
                                  foregroundColor: ColorConstant.white,
                                ),
                                icon: const Icon(Icons.send_rounded),
                                label: const Text("Submit"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          if (state.journalFileInfo != null)
                            Column(
                              children: [
                                Image.file(
                                  File(state.journalFileInfo!.first.path!),
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                Text(state.journalFileInfo!.first.name),
                              ],
                            )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
