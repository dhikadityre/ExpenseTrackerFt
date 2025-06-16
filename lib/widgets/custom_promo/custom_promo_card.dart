import 'package:flutter/material.dart';

class CustomPromoCard extends StatelessWidget {
  final Widget? displayImage;
  final String title;
  final String subtitle;
  final Color? titleColor;
  final double? titleSize;
  final Color? subtitleColor;
  final double? subtitleSize;
  final void Function() onSelectSubtitle;

  const CustomPromoCard({
    super.key,
    this.displayImage,
    required this.title,
    required this.subtitle,
    this.titleColor = Colors.grey,
    this.titleSize = 50,
    this.subtitleColor = Colors.black,
    this.subtitleSize = 12,
    required this.onSelectSubtitle,
  });

  @override
  Widget build(BuildContext context) {
    return render();
  }

  Decoration renderBackground() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(6),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(51, 51, 51, 0.25),
          blurRadius: 0.5,
          spreadRadius: 0,
          offset: Offset(0, 0),
        ),
        BoxShadow(
          color: Color.fromRGBO(51, 51, 51, 0.31),
          blurRadius: 0.5,
          spreadRadius: 0,
          offset: Offset(0, 0),
        ),
      ],
    );
  }

  Widget renderContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: titleColor,
              fontSize: titleSize,
            ),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: onSelectSubtitle,
            child: Row(
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: subtitleSize,
                    fontWeight: FontWeight.bold,
                    color: subtitleColor,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget render() {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(16),
      decoration: renderBackground(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (displayImage != null) ...[
            displayImage!,
            const SizedBox(width: 23),
          ],
          renderContent(),
        ],
      ),
    );
  }
}