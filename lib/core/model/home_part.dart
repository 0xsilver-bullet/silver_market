import 'package:equatable/equatable.dart';

class HomePart extends Equatable {
  const HomePart({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final int id;
  final String name;
  final String imageUrl;

  @override
  List<Object> get props => [];
}
