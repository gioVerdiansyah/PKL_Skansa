import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:pkl_smkn1mejayan_siswa/src/constants/color_constant.dart';

class TextInput extends StatefulWidget {
  final String name;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool floatingLabel;
  final int? maxLine;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final String? initialValue;

  const TextInput._({
    Key? key,
    required this.name,
    required this.labelText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.floatingLabel = false,
    this.maxLine,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  factory TextInput.basic({
    required String name,
    required String labelText,
    TextInputType type = TextInputType.text,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    String? initialValue,
  }) {
    return TextInput._(
      name: name,
      labelText: labelText,
      keyboardType: type,
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
    );
  }

  factory TextInput.description({
    required String name,
    required String labelText,
    required int? maxLine,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    String? initialValue,
  }) {
    return TextInput._(
      name: name,
      labelText: labelText,
      maxLine: maxLine,
      floatingLabel: true,
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
    );
  }

  factory TextInput.password({
    required String name,
    required String labelText,
    String? Function(String?)? validator,
    void Function(String?)? onChanged,
    String? initialValue,
  }) {
    return TextInput._(
      name: name,
      labelText: labelText,
      obscureText: true, // Password field default to obscure
      validator: validator,
      onChanged: onChanged,
      initialValue: initialValue,
    );
  }

  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderTextField(
          name: widget.name,
          keyboardType: widget.keyboardType,
          obscureText: _obscureText,
          maxLines: widget.maxLine ?? 1,
          initialValue: widget.initialValue,
          decoration: InputDecoration(
            labelText: widget.labelText,
            floatingLabelBehavior: widget.floatingLabel ? FloatingLabelBehavior.always : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: ColorConstant.primary,
                width: 2.0,
              ),
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(12.0),
            suffixIcon: widget.obscureText
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
