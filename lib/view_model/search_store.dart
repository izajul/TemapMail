import 'package:mobx/mobx.dart';
import 'package:temp_mail/model/search.model.dart';
import 'package:temp_mail/network/api_response.dart';
import 'package:temp_mail/view_model/respo/search.repo.dart';

part 'respo/search_store.g.dart';

class SearchStore extends _SearchStore with _$SearchStore {
  SearchStore(SearchDomainRepo repo) : super(repo);
}

abstract class _SearchStore with Store {
  final SearchDomainRepo _domainRepo;
  _SearchStore(this._domainRepo);

  @observable
  late ObservableFuture<ApiResponse> _search;

  @observable
  late List<HydraMember> domainList;

  @computed
  ApiResponse get state {
    if (_search.status == FutureStatus.rejected) {
      return ApiResponse.initiate('');
    }

    return (_search.status == FutureStatus.pending)
        ? ApiResponse.loading("")
        : ApiResponse.completed(null);
  }

  @action
  Future getDomainList() async {
    _search = ObservableFuture(_domainRepo.findDomain());
  }
}
