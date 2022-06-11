part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransaksiCubit, TransaksiState>(builder: (_, state) {
      if (state is TransaksiLoaded) {
        if (state.transaksid.length == 0) {
          return IllustrationPage(
            title: 'Furniture JWA',
            subtitle: 'Sepertinya kamu belum pesan furniture',
            PicturePath: 'assets/sofavector.jpg',
            buttonTap1: () {},
            buttonTitle1: 'Pesan Furniture untukmu',
          );
        } else {
          double listItemWidth =
              MediaQuery.of(context).size.width - 2 * defaultMargin;

          return RefreshIndicator(
            onRefresh: () async {
              await context.bloc<TransaksiCubit>().getTransaksid();
            },
            child: ListView(
              children: [
                Column(
                  children: [
                    //header
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: defaultMargin),
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Pesanan Anda',
                            style: blackFontStyle1,
                          ),
                          Text(
                            'Mohon Tunggu, pesanan furniture untukmu',
                            style: greyFontStyle.copyWith(
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                    //Body
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: [
                          CustomTabBar(
                            titles: ['Sedang di proses', 'Pesanan sebelumnya'],
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
                          Builder(builder: (_) {
                            List<Transaksi> transaksid = (selectedIndex == 0)
                                ? state.transaksid
                                    .where((element) =>
                                        element.status ==
                                            TransaksiStatus.on_delivery ||
                                        element.status ==
                                            TransaksiStatus.pending)
                                    .toList()
                                : state.transaksid
                                    .where((element) =>
                                        element.status ==
                                            TransaksiStatus.delivered ||
                                        element.status ==
                                            TransaksiStatus.cancelled)
                                    .toList();

                            return Column(
                              children: transaksid
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: defaultMargin,
                                            left: defaultMargin,
                                            bottom: 16),
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (e.status ==
                                                TransaksiStatus.pending) {
                                              await launch(e.paymentUrl);
                                            }
                                          },
                                          child: OrderListItem(
                                              transaksi: e,
                                              itemWidth: listItemWidth),
                                        ),
                                      ))
                                  .toList(),
                            );
                          }),
                          SizedBox(
                            height: 60, //membuat jarak history dengan navbar
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: loadingIndicator,
        );
      }
    });
  }
}
