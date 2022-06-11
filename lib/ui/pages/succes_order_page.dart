part of 'pages.dart';

class SuccesOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
          title: "Anda telah membuat Pesanan",
          subtitle: "Mohon di tunggu, Pesanan anda akan kami proses",
          PicturePath: 'assets/box.jpg',
          buttonTap1: () {
            Get.offAll(MainPage());
          },
          buttonTitle1: 'Pesan Furniture lainnya',
          buttonTap2: () {
            Get.offAll(MainPage(
              initialPage: 1,
            ));
          },
          buttonTitle2: 'Lihat Pesanan',
        ));
  }
}
