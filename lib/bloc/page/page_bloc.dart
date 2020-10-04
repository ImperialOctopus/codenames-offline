import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:codenames/bloc/page/page_event.dart';
import 'package:codenames/model/app_page.dart';

class TabBloc extends Bloc<PageEvent, AppPage> {
  TabBloc() : super(AppPage.menu);

  @override
  Stream<AppPage> mapEventToState(PageEvent event) async* {
    if (event is PageUpdated) {
      yield event.page;
    }
  }
}
