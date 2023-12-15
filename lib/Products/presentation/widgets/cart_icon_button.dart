import 'package:flutter/material.dart';

class ECCartAddButton extends StatefulWidget {
  final double width;
  final double height;
  final double fontSize;
 // final Product product; //the product to add or remove from cart
  final String color;
  const ECCartAddButton({
    Key? key,
    required this.width,
    required this.height,
    required this.fontSize,
   // required this.product,
    required this.color,
  }) : super(key: key);

  @override
  State<ECCartAddButton> createState() => _ECCartAddButtonState();
}

class _ECCartAddButtonState extends State<ECCartAddButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
    
      },
      child: Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey)),
        child: Text(
          "Add to cart",
          style: TextStyle(
              fontFamily: "Inter",
              fontWeight: FontWeight.w400,
              color: const Color(0xffFFFFFF),
              fontSize: widget.fontSize),
        ),
      ),
    );
  }
}
