// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountStore on _AccountStore, Store {
  Computed<ApiResponse<dynamic>>? _$stateComputed;

  @override
  ApiResponse<dynamic> get state =>
      (_$stateComputed ??= Computed<ApiResponse<dynamic>>(() => super.state,
              name: '_AccountStore.state'))
          .value;

  final _$_accountDataObjAtom = Atom(name: '_AccountStore._accountDataObj');

  @override
  ObservableFuture<ApiResponse<dynamic>> get _accountDataObj {
    _$_accountDataObjAtom.reportRead();
    return super._accountDataObj;
  }

  @override
  set _accountDataObj(ObservableFuture<ApiResponse<dynamic>> value) {
    _$_accountDataObjAtom.reportWrite(value, super._accountDataObj, () {
      super._accountDataObj = value;
    });
  }

  final _$accountDataAtom = Atom(name: '_AccountStore.accountData');

  @override
  ApiResponse<dynamic> get accountData {
    _$accountDataAtom.reportRead();
    return super.accountData;
  }

  @override
  set accountData(ApiResponse<dynamic> value) {
    _$accountDataAtom.reportWrite(value, super.accountData, () {
      super.accountData = value;
    });
  }

  final _$createAccountAsyncAction = AsyncAction('_AccountStore.createAccount');

  @override
  Future<dynamic> createAccount(String name, String pass) {
    return _$createAccountAsyncAction
        .run(() => super.createAccount(name, pass));
  }

  @override
  String toString() {
    return '''
accountData: ${accountData},
state: ${state}
    ''';
  }
}
