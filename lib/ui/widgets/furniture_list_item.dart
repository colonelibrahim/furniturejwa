part of 'widgets.dart';

class FurnitureListItem extends StatelessWidget {
  final Furniture_interior furniture_interior;
  final double itemWidth;

  FurnitureListItem(
      {@required this.furniture_interior, @required this.itemWidth});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(furniture_interior.picturePath),
              fit: BoxFit.cover)),
        ),
        SizedBox(
          width: itemWidth - 182, //(60 + 12 + 110)
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                      furniture_interior.name,
                      style: blackFontStyle2,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      ),
                      Text(
                      NumberFormat.currency(
                          symbol: 'IDR', decimalDigits: 0, locale: 'id-ID')
                        .format(furniture_interior.price),
                      style: greyFontStyle.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
        ),
        Rating(furniture_interior.rate)
      ],
    );
  }
}
