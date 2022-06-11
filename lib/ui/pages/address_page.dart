part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File pictureFile;

  AddressPage(this.user, this.password, this.pictureFile);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumController = TextEditingController();

  bool isLoading = false;
  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Jakarta', 'Bekasi', 'Semarang'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Alamat',
      subtitle: "Pastikan alamat anda benar",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          //Ini membuat form nomor hp anda
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
            child: Text(
              "Nomor Handphone",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Ketik nomor handphone Anda'),
            ),
          ),
          //ini membuat Alamat
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Alamat",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Ketik alamat tinggal Anda'),
            ),
          ),

          //ini membuat no rumah
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "No Rumah",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: TextField(
              controller: houseNumController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: 'Ketik no rumah Anda'),
            ),
          ),
          //ini membuat textbox kota
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
            child: Text(
              "Kota",
              style: blackFontStyle2,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black)),
            child: DropdownButton(
                value: selectedCity,
                isExpanded: true,
                underline: SizedBox(),
                items: cities
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          style: blackFontStyle3,
                        )))
                    .toList(),
                onChanged: (item) {
                  setState(() {
                    selectedCity = item;
                  });
                }),
          ),
          //ini membuat button1
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 24),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: (isLoading == true)
              ?Center(
                child: loadingIndicator,
                )
              :RaisedButton(
              onPressed: () async {
                User user = widget.user.copyWith(
                    phoneNumber: phoneController.text,
                    address: addressController.text,
                    houseNumber: houseNumController.text,
                    city: selectedCity);

                setState(() {
                  isLoading = true;
                });

                await context.bloc<UserCubit>().signUp(user, widget.password,
                pictureFile: widget.pictureFile);

                UserState state = context.bloc<UserCubit>().state;

               if (state is UserLoaded) {
                    context.bloc<FurnitureCubit>().getInteriors();
                    context.bloc<TransaksiCubit>().getTransaksid();
                     Get.to(MainPage());
              } else {
                  Get.snackbar("", "",
                    backgroundColor: "D9435E".toColor(),
                      icon: Icon(
                       MdiIcons.closeCircleOutline,
                        color: Colors.white,
                        ),
                         titleText: Text(
                          "Gagal Masuk",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                          fontWeight: FontWeight.w600),
                            ),
                          messageText: Text(
                            (state as UserLoadingFailed).message,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ));
                       setState(() {
                        isLoading = false;
                  });
                }
              },
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Colors.blue,
              child: Text(
                'Selesai',
                style: GoogleFonts.poppins(
                    color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
