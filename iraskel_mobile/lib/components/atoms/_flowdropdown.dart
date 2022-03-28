import 'package:flutter/material.dart';

class FlutterFlowDropDown extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const FlutterFlowDropDown({
    this.initialOption,
    this.hintText,
    required this.options,
    required this.onChanged,
    this.icon,
    this.width,
    this.height,
    this.fillColor,
    this.textStyle,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.margin,
    this.hidesUnderline = false,
    required this.id,
    required this.text,
    required this.listItems
  });
  final String id;
  final String text;
  // ignore: prefer_typing_uninitialized_variables
  final listItems;

  final String? initialOption;
  final String? hintText;
  final List<String> options;
  final Function(String) onChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final TextStyle? textStyle;
  final double? elevation;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final bool hidesUnderline;

  @override
  State<FlutterFlowDropDown> createState() => _FlutterFlowDropDownState();
}

class _FlutterFlowDropDownState extends State<FlutterFlowDropDown> {
  late String dropDownValue;
List<dynamic> get effectiveOptions =>
      widget.options.isEmpty ? ['[Option]'] : widget.options;

  @override
  void initState() {
    super.initState();
    dropDownValue = widget.initialOption!;
  }

  @override
  Widget build(BuildContext context) {
    final dropdownWidget = DropdownButton<String>(
      value:effectiveOptions.contains(dropDownValue) ? dropDownValue : null,
      hint: widget.hintText != null
          ? Text(widget.hintText!, style: widget.textStyle)
          : null,
      items: effectiveOptions.map<DropdownMenuItem<String>>((valueItem) {
         
         
            return DropdownMenuItem<String>(
              value: valueItem[widget.id],
             // key: valueItem[widget.value],
              child: Text(valueItem[widget.text]),
            );
          }).toList(),
      elevation: widget.elevation!.toInt(),
      onChanged: (value) {
        dropDownValue = value!;
        widget.onChanged(value);
      },
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: widget.fillColor,
      focusColor: Colors.transparent,
    );
   /* final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 28),
        border: Border.all(
          color: widget.borderColor!,
          width: widget.borderWidth!,
        ),
        color: widget.fillColor,
      ),
      child: Padding(
        padding: widget.margin!,
        child: widget.hidesUnderline
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget,
      ),
    );
    if (widget.height != null || widget.width != null) {
      return Container(
          width: widget.width, height: widget.height, child: childWidget);
    }
    return childWidget;*/
    return dropdownWidget;
  }
}