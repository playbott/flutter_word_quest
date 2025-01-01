import 'dart:async';
import 'package:cword/global.dart';
import 'package:flutter/services.dart';
import 'package:widget_marquee/widget_marquee.dart';

import 'label.dart';


class FS {
  static const _fSizeMultipler = 1;

  static double p1 = _fSizeMultipler * 30.0;
  static double p2 = _fSizeMultipler * 26.0;
  static double p3 = _fSizeMultipler * 22.0;
  static double p4 = _fSizeMultipler * 20.0;
  static double p5 = _fSizeMultipler * 18.0;
  static double p6 = _fSizeMultipler * 16.0;
  static double p7 = _fSizeMultipler * 14.0;
  static double p8 = _fSizeMultipler * 12.0;
  static double p9 = _fSizeMultipler * 10.0;
  static double p10 = _fSizeMultipler * 8.0;
  static double p11 = _fSizeMultipler * 6.0;
  static double p12 = _fSizeMultipler * 4.0;
  static double p13 = _fSizeMultipler * 2.0;
}

class MyLabel extends StatelessWidget {
  const MyLabel(
      {required this.text,
      this.onPressed,
      this.size,
      this.fontWeight,
      this.fontStyle,
      this.color,
      this.textOverflow,
      this.fontFamily,
      this.decorationStyle,
      this.align,
      this.maxLines,
      this.marquee,
      super.key});

  final String text;
  final double? size;
  final Color? color;
  final VoidCallback? onPressed;
  final TextAlign? align;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String? fontFamily;
  final TextDecoration? decorationStyle;
  final int? maxLines;
  final bool? marquee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: marquee ?? false
          ? Marquee(
              key: Key(text.hashCode.toString()),
              id: text.hashCode.toString(),
              gap: 0.1.sw,
              duration: Duration(
                  milliseconds: text.length * 4000 ~/ (size ?? FS.p7 / 1.5)),
              delay: const Duration(milliseconds: 1000),
              child: LLabel(
                text: text,
                align: align,
                maxLines: maxLines,
                fontWeight: fontWeight,
                decorationStyle: decorationStyle,
                textOverflow: textOverflow,
                size: size,
                color: color,
                fontStyle: fontStyle,
              ),
            )
          : Text(
              text,
              textAlign: align,
              maxLines: maxLines,
              style: TextStyle(
                fontWeight: fontWeight,
                decoration: decorationStyle,
                overflow: textOverflow,
                fontSize: size,
                color: color ?? Theme.of(context).textTheme.bodyMedium?.color,
                fontStyle: fontStyle,
                fontFamily: fontFamily,
              ),
            ),
    );
  }
}

class SecondaryLabel extends StatelessWidget {
  const SecondaryLabel(
      {required this.text,
      this.onPressed,
      this.size,
      this.textColor,
      super.key});

  final String text;
  final double? size;
  final Color? textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return LLabel(
        text: text,
        size: size,
        color: textColor,
        decorationStyle:
            onPressed == null ? TextDecoration.none : TextDecoration.underline);
  }
}

class MyTextField extends StatelessWidget {
  MyTextField({
    this.enabled,
    this.controller,
    this.validator,
    this.prefix,
    this.prefixIcon,
    this.onChanged,
    this.label,
    this.obscureText,
    this.inputFormatters,
    this.errorText,
    this.keyboardType,
    this.fontSize,
    this.onSubmitted,
    this.textInputAction,
    this.textAlign,
    this.textAlignVertical,
    super.key,
  });

  final bool? enabled;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? prefix;
  final Icon? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextAlignVertical? textAlignVertical;
  final String? label;
  final bool? obscureText;
  final ValueChanged<String>? onSubmitted;
  final TextAlign? textAlign;
  final double? fontSize;

  final StreamController<String?> _errorStreamController =
      StreamController<String?>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.08),
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1.0, color: Colors.grey),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (prefix != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: LLabel(
                          text: prefix!,
                          color: Colors.black,
                          size: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    Expanded(
                      child: TextFormField(
                        onChanged: onChanged,
                        validator: (_) {
                          _errorStreamController.add(validator.toString());
                          return null;
                        },
                        enabled: enabled,
                        textAlign: textAlign ?? TextAlign.start,
                        maxLines: 1,
                        keyboardType: keyboardType,
                        onFieldSubmitted: onSubmitted,
                        textInputAction: textInputAction,
                        textAlignVertical: textAlignVertical,
                        inputFormatters: inputFormatters,
                        controller: controller,
                        obscureText: obscureText ?? false,
                        style: TextStyle(
                            color: Colors.black,
                            height: 1.2,
                            fontSize: fontSize),
                        decoration: InputDecoration(
                          prefixIcon: prefixIcon,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 20.0),
                          hintStyle: TextStyle(
                              color: Colors.black45, fontSize: fontSize),
                          suffixStyle: const TextStyle(color: Colors.grey),
                          errorText: errorText,
                          labelText: '',
                          hintText: label ?? '',
                          enabledBorder: _inputBorder,
                          focusedBorder: _inputBorder,
                          errorBorder: _inputBorder,
                          border: _inputBorder,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        /*
        StreamBuilder<String?>(
            stream: _errorStreamController.stream,
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Container(padding: EdgeInsets.only(top: 10.0), child: MyLabel(text: snapshot.data!, color: FlexColor.redLightPrimary));
              }

              return Container();
            })
        */
      ],
    );
  }
}

OutlineInputBorder _inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.transparent, width: 1),
  borderRadius: BorderRadius.circular(15.0),
);

class MyTextFieldController {
  MyTextFieldController({required this.controller, required this.formKey});

  final TextEditingController controller;
  final GlobalObjectKey<FormFieldState> formKey;
}
