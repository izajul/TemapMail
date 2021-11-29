import 'package:mobx/mobx.dart';
import 'package:temp_mail/network/api_response.dart';
import 'package:temp_mail/view_model/respo/account.repo.dart';

part 'account_store.g.dart';

class AccountStore extends _AccountStore with _$AccountStore {
  AccountStore(AccountRepo accountRepo) : super(accountRepo);
}

abstract class _AccountStore with Store {
  final AccountRepo accountRepo;

  _AccountStore(this.accountRepo);

  @observable
  late ObservableFuture<ApiResponse> _accountDataObj;

  @observable
  late ApiResponse accountData;

  @computed
  ApiResponse get state {
    if (_accountDataObj.status == FutureStatus.rejected) {
      return ApiResponse.initiate('');
    }

    return (_accountDataObj.status == FutureStatus.pending)
        ? ApiResponse.loading("")
        : ApiResponse.completed(null);
  }

  @action
  Future createAccount(String name, String pass) async {
    _accountDataObj = ObservableFuture(accountRepo.createAccount(name, pass));
    accountData = await _accountDataObj;
  }
}
