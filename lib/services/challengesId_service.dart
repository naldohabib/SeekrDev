part of 'services.dart';

class CreditIdAnswer extends Equatable {
  final String url;
  final String id;

  CreditIdAnswer({this.url, this.id});

  @override
  List<Object> get props => [url, id];
}
   