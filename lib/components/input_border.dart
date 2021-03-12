import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:revisit/constant.dart';

class RevisitInputBorder extends StatefulWidget {
  final TextEditingController inputController;
  final String labelText;
  final bool disableEmptyInput;
  final bool obscureText;
  final TextInputType keyboardType;
  final Icon icon;
  final BorderSide borderSide;
  final bool autoValidate;
  final Function onValidate;
  final int errorMaxLines;
  final double borderRadius;
  final double labelSize;
  final Color labelColor;
  final FontWeight labelWeight;
  final bool noPadding;
  final Color errorColor;
  final bool isDense;
  final Color backGroundColor;

  RevisitInputBorder(
      this.labelText, {
        this.inputController,
        this.disableEmptyInput = false,
        this.obscureText = false,
        this.keyboardType = TextInputType.text,
        this.icon = const Icon(Icons.email),
        this.borderSide,
        this.labelSize = Constant.MINIMUM_FONT_SIZE,
        this.labelColor = Colors.black54,
        this.labelWeight = FontWeight.w500,
        this.noPadding = false,
        this.autoValidate = false,
        this.onValidate,
        this.errorMaxLines = 1,
        this.errorColor,
        this.borderRadius = Constant.MINIMUM_BORDER_RADIUS_LG,
        this.isDense =  true,
        this.backGroundColor = Colors.transparent,
      });

  @override
  State<StatefulWidget> createState() => _RevisitInputBorderState();
}

class _RevisitInputBorderState extends State<RevisitInputBorder> {
  List<TextInputFormatter> inputFormatters = new List();
  String _labelText;
  BorderSide _borderSide;
  Color _errorColor;

  @override
  void initState() {
    if (this.widget.keyboardType == TextInputType.number) {
      this.inputFormatters.add(WhitelistingTextInputFormatter.digitsOnly);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _labelText =  widget.labelText;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: widget.labelSize,
      fontWeight: widget.labelWeight,
      color: widget.labelColor,
    );
    _borderSide = widget.borderSide ??
        BorderSide(
          color: Colors.black54,
          width: Constant.MINIMUM_BORDER_WIDTH,
        );
    _errorColor = widget.errorColor ?? Constant.red025;

    return Container(
      padding: widget.noPadding
          ? EdgeInsets.all(0.0)
          : EdgeInsets.only(
        left: Constant.MINIMUM_PADDING / 3,
        right: Constant.MINIMUM_PADDING / 3,
      ),
      child: Material(
        color: Colors.transparent,
        child: TextFormField(
          // autovalidate: widget.autoValidate,
          keyboardType: this.widget.keyboardType,
          obscureText: this.widget.obscureText,
          controller: this.widget.inputController,
          style: textStyle,
          inputFormatters: this.inputFormatters,
          validator: widget.onValidate,
          decoration: InputDecoration(
            isDense: true,
            fillColor: widget.backGroundColor,
            filled: widget.backGroundColor != null ? true : false,
            contentPadding: EdgeInsets.only( bottom: 6),
//            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: _borderSide,
              borderRadius: BorderRadius.circular(
                widget.borderRadius,
              ),
            ),
            prefixIcon: widget.icon,
            prefixStyle: textStyle,
            labelText: _labelText,
            labelStyle: textStyle,
//            hintText: _labelText,
//            hintStyle: textStyle,
            errorMaxLines: widget.errorMaxLines,
            errorStyle: TextStyle(
              color: _errorColor,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
    );
  }
}