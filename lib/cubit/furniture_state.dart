part of 'furniture_cubit.dart';

abstract class FurnitureState extends Equatable {
  const FurnitureState();

  @override
  List<Object> get props => [];
}

class FurnitureInitial extends FurnitureState {}

class FurnitureLoaded extends FurnitureState {
  final List<Furniture_interior> interiors;

  FurnitureLoaded(this.interiors);

  @override
  List<Object> get props => [interiors];
}

class FurnitureLoadingFailed extends FurnitureState {
  final String message;

  FurnitureLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
