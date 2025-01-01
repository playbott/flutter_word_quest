import 'package:cword/global.dart';

import 'const.dart';
import 'label.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    this.color,
    this.textColor,
    required this.text,
    this.fontSize,
    required this.onPressed,
    this.minWidth = 80,
    this.height,
    this.shape,
    this.elevatedButton,
    this.padding,
    this.icon,
    this.suffixIcon,
  });

  final Color? color;
  final Color? textColor;
  final String text;
  final double? fontSize;
  final double minWidth;
  final double? height;
  final VoidCallback onPressed;
  final ShapeBorder? shape;
  final bool? elevatedButton;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final Widget? suffixIcon;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.elevatedButton ?? false)
        ? ElevatedButton(
            style: ButtonStyle(
              backgroundColor: widget.color != null
                  ? WidgetStateProperty.all(
                      widget.color ?? Theme.of(context).primaryColor)
                  : null,
              iconColor: WidgetStateProperty.all(Colors.transparent),
              overlayColor: widget.color != null
                  ? WidgetStateProperty.all(
                      Theme.of(context).primaryColor.withOpacity(0.2))
                  : null,
              surfaceTintColor: WidgetStateProperty.all(widget.color),
              shadowColor: WidgetStateProperty.all(widget.color),
              foregroundColor:
                  WidgetStateProperty.all(widget.textColor ?? Colors.white),

              // iconColor: WidgetStateProperty.all(widget.color),
/*              padding: WidgetStateProperty.all(const EdgeInsets.all(50)),
              textStyle: WidgetStateProperty.all(
                const TextStyle(fontSize: 30),
              ),*/
            ),
            onPressed: () async {
              await AppLogService.addLog('"${widget.text}" button pressed',
                  type: AppLogType.tap);
              widget.onPressed();
            },
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                padding: widget.padding ?? const EdgeInsets.all(10),
                constraints: BoxConstraints(
                    minWidth: widget.minWidth,
                    minHeight: widget.height ?? 0.0,
                    maxHeight: widget.height ?? double.infinity),
                duration: const Duration(milliseconds: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null)
                      AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: widget.icon!),
                    AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: SizedBox(width: widget.icon != null ? 10 : 0)),
                    LLabel(
                      text: widget.text,
                      align: TextAlign.center,
                      color: widget.textColor ?? Colors.white,
                      size: widget.fontSize ?? FS.p8.sp,
                      fontFamily: FontFamilies.wixMadeforDisplay,
                    ),
                    if (widget.suffixIcon != null) const SizedBox(width: 10),
                    if (widget.suffixIcon != null) widget.suffixIcon!,
                  ],
                ),
              ),
            ),
          )
        : MaterialButton(
            minWidth: widget.minWidth,
            height: widget.height,
            onPressed: () async {
              await AppLogService.addLog('"${widget.text}" button pressed',
                  type: AppLogType.tap);
              widget.onPressed();
            },
            color: widget.color ?? AppConstants.mainColor2,
            shape: widget.shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
            child: Container(
              padding: widget.padding,
              child: LLabel(
                text: widget.text,
                size: widget.fontSize ?? FS.p7,
                color: widget.textColor ?? Colors.white,
              ),
            ),
          );
  }
}
