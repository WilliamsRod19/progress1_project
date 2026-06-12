import 'package:flutter/material.dart';

class DefaultBuildField extends StatefulWidget {
  final IconData icon;
  final String label;
  final String initialValue;
  final String hint;
  final bool isNumber;
  final bool readOnly;
  final Function(String text) onChange;
  const DefaultBuildField({
    super.key,
    required this.icon,
    required this.label,
    required this.initialValue,
    required this.hint,
    required this.onChange,
    required this.isNumber,
    required this.readOnly

  });

  @override
  State<DefaultBuildField> createState() => _DefaultBuildFieldState();
}

class _DefaultBuildFieldState extends State<DefaultBuildField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant DefaultBuildField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.initialValue != widget.initialValue){
      _controller.text = widget.initialValue;
    }
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: widget.readOnly,
      onChanged: widget.onChange,
      keyboardType: widget.isNumber ?TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hint,
        prefixIcon: Icon(widget.icon,color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300)
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300)
        ),
        label: Text(widget.label)
      ),
    );
  }
}