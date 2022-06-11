part of 'pages.dart';

class PaymentMethodPage extends StatelessWidget {
  final String paymentURL;

  PaymentMethodPage(this.paymentURL);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: IllustrationPage(
          title: "Anda telah membuat Pesanan",
          subtitle: "Mohon di tunggu, Pesanan anda akan kami proses",
          PicturePath: 'assets/Payment.png',
          buttonTap1: () async {
            await launch(paymentURL);
          },
          buttonTitle1: 'Cara Pembayaran',
          buttonTap2: () {
            Get.to(SuccesOrderPage()); 
          },
          buttonTitle2: 'Kembali',
        ));
  }
}
