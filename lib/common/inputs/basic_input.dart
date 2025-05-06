import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicInput extends StatefulWidget {
  final String title;
  final String hintText;
  final bool? obscure;
  final bool? num;

  const BasicInput({
    super.key,
    required this.title,
    required this.hintText,
    this.obscure,
    this.num,
  });

  @override
  State<BasicInput> createState() => _BasicInputState();
}

class _BasicInputState extends State<BasicInput> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscure ?? false;
  }

  @override
  Widget build(BuildContext context) {
    void toggleVisibility() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 10),
        TextField(
          keyboardType: widget.num == true ? TextInputType.number : null,
          inputFormatters:
              widget.num == true
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
          obscureText: _obscureText,
          decoration: InputDecoration(
            prefixText: widget.num == true ? 'Rp. ' : null,
            prefixStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            suffixIcon:
                widget.obscure == true
                    ? IconButton(
                      onPressed: () {
                        toggleVisibility();
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey.shade600,
                      ),
                    )
                    : null,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black.withAlpha(80),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black.withAlpha(80),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1,
                color: Colors.black.withAlpha(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
