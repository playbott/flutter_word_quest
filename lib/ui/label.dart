import 'package:cword/ui/text.dart';

const globalFontFamily = 'WixMadeforDisplay';

class LLabel extends MyLabel {
  const LLabel({
    super.key,
    required super.text,
    super.align,
    super.decorationStyle,
    super.fontStyle,
    super.fontWeight,
    super.maxLines,
    super.onPressed,
    super.size,
    super.color,
    super.textOverflow,
    super.marquee,
    super.fontFamily = globalFontFamily,
  }) : super();
}
