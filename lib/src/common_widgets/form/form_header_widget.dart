import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.imageColor,
    this.heightBetween,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
    super.key,
  });

  final String image, title, subTitle;
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * imageHeight,
          color: imageColor,
        ),
        SizedBox(height: heightBetween,),
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(subTitle,textAlign:textAlign , style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
