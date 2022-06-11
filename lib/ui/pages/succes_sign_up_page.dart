part of 'pages.dart';

class SuccesSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IllustrationPage(
          title: "Selamat! Berhasil Masuk",
          subtitle: "Sekarang Anda dapat memesan\n Furniture pilihan untuk diri sendiri",
          PicturePath: 'assets/succesorder.jpg',
          buttonTap1: () {},
          buttonTitle1: 'Temukan',
    ));
  }
}