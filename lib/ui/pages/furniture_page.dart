part of 'pages.dart';

class FurniturePage extends StatefulWidget {
  @override
  _FurniturePageState createState() => _FurniturePageState();
}

class _FurniturePageState extends State<FurniturePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - 2 * defaultMargin;
    return ListView(
      children: [
        Column(
          children: [
            //HEADER
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'JWA INTERIOR',
                        style: blackFontStyle1,
                      ),
                      Text(
                        "Wujudkan Interior furniture untukmu",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: 50,
                  //   height: 50,
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(8),
                  //       image: DecorationImage(
                  //           image: NetworkImage(
                  //               (context.bloc<UserCubit>().state as UserLoaded)
                  //                   .user
                  //                   .picturePath),
                  //           fit: BoxFit.cover)),
                  // ),
                ],
              ),
            ),
            //List Furniture
            Container(
              height: 258,
              width: double.infinity,
              child: BlocBuilder<FurnitureCubit, FurnitureState>(
                builder: (_, state) => (state is FurnitureLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.interiors
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                          left: (e == state.interiors.first)
                                              ? defaultMargin
                                              : 0,
                                          right: defaultMargin),
                                      child: GestureDetector(
                                          onTap: () {
                                            Get.to(ItemDetailsPage(
                                              transaksi: Transaksi(
                                                  furniture_interior: e,
                                                  user: (context
                                                          .bloc<UserCubit>()
                                                          .state as UserLoaded)
                                                      .user),
                                              onBackButtonPressed: () {
                                                Get.back();
                                              },
                                            ));
                                          },
                                          child: FurnitureCard(e)),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Center(child: loadingIndicator),
              ),
            ),
            //filter
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Filter",
                        style:
                            greyFontStyle.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                    ),
                  ],
                ),
              ),
            //List Furniture (TABS)
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    titles: ['Kursi', 'Sofa', 'Recommended', 'Paket Interior'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<FurnitureCubit, FurnitureState>(builder: (_, state) {
                    if (state is FurnitureLoaded) {
                      List<Furniture_interior> furniture_interior = 
                      state.interiors.where((element) =>
                        element.types.contains((selectedIndex == 0)
                        ? FurnitureType.kursi
                        : (selectedIndex == 1)
                            ? FurnitureType.sofa
                            : FurnitureType.recommended)).toList();

                      return Column(
                          children: furniture_interior
                              .map((e) => Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        defaultMargin, 0, defaultMargin, 16),
                                    child: FurnitureListItem(
                                        furniture_interior: e,
                                        itemWidth: listItemWidth),
                                  ))
                              .toList());
                    } else {
                      return Center(
                        child: loadingIndicator,
                      );
                    }
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        )
      ],
    );
  }
}
