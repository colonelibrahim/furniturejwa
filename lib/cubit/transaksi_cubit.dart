import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture/models/models.dart';
import 'package:furniture/services/services.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  Future<void> getTransaksid() async {
    ApiReturnValue<List<Transaksi>> result =
        await TransaksiServices.getTransaksid();

    if (result.value != null) {
      emit(TransaksiLoaded(result.value));
    } else {
      emit(TransaksiLoadingFailed(result.message));
    }
  }

  Future<String> submitTransaksi(Transaksi transaksi) async {
    ApiReturnValue<Transaksi> result =
        await TransaksiServices.submitTransaksi(transaksi);

    if (result.value != null) {
      emit(TransaksiLoaded(
          (state as TransaksiLoaded).transaksid + [result.value]));
      return result.value.paymentUrl;
    } else {
      return null;
    }
  }
}
