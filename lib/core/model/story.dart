import 'package:equatable/equatable.dart';

class Story extends Equatable {
  const Story({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final int id;
  final String name;
  final String imageUrl;

  @override
  List<Object> get props => [name, imageUrl];
}
