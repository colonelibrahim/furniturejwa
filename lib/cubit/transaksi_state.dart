part of 'transaksi_cubit.dart';

abstract class TransaksiState extends Equatable {
  const TransaksiState();

  @override
  List<Object> get props => [];
}

class TransaksiInitial extends TransaksiState {}

class TransaksiLoaded extends TransaksiState {
  final List<Transaksi> transaksid;

  TransaksiLoaded(this.transaksid);

  @override
  List<Object> get props => [transaksid];
}

class TransaksiLoadingFailed extends TransaksiState {
  final String message;

  TransaksiLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
