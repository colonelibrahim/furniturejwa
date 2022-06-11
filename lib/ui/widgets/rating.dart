part of 'widgets.dart';

class Rating extends StatelessWidget {
  final double rate;

  Rating(this.rate);

  @override
  Widget build(BuildContext context) {
    int numberofStars = rate.round();

    return Row(
      children: List<Widget>.generate(
              5,
              (index) => Icon(
                    (index <  numberofStars)
                        ? MdiIcons.star
                        : MdiIcons.starOutline,
                    size: 16,
                    color: goldColor,
                  )) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rate.toString(),
              style: greyFontStyle.copyWith(fontSize: 12),
            )
          ],
    );
  }
}
