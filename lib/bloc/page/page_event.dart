import 'package:codenames/model/app_page.dart';
import 'package:equatable/equatable.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class PageUpdated extends PageEvent {
  final AppPage page;

  const PageUpdated(this.page);

  @override
  List<Object> get props => [page];

  @override
  String toString() => 'PageUpdated { page: $page }';
}
