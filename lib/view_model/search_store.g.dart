// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchStore on _SearchStore, Store {
  Computed<ApiResponse<dynamic>>? _$stateComputed;

  @override
  ApiResponse<dynamic> get state =>
      (_$stateComputed ??= Computed<ApiResponse<dynamic>>(() => super.state,
              name: '_SearchStore.state'))
          .value;

  final _$_searchAtom = Atom(name: '_SearchStore._search');

  @override
  ObservableFuture<ApiResponse<dynamic>> get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(ObservableFuture<ApiResponse<dynamic>> value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$domainListAtom = Atom(name: '_SearchStore.domainList');

  @override
  List<HydraMember> get domainList {
    _$domainListAtom.reportRead();
    return super.domainList;
  }

  @override
  set domainList(List<HydraMember> value) {
    _$domainListAtom.reportWrite(value, super.domainList, () {
      super.domainList = value;
    });
  }

  final _$getDomainListAsyncAction = AsyncAction('_SearchStore.getDomainList');

  @override
  Future<dynamic> getDomainList() {
    return _$getDomainListAsyncAction.run(() => super.getDomainList());
  }

  @override
  String toString() {
    return '''
domainList: ${domainList},
state: ${state}
    ''';
  }
}
