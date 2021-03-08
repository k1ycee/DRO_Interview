import 'package:dro/data/drug_dummy_data.dart';
import 'package:dro/data/failure.dart';
import 'package:dro/model/drug_data.dart';
import 'package:dro/utils/database.dart';
import 'package:dro/vm/base_vm.dart';

import '../locator.dart';

class HomeViewModel extends BaseViewModel {
  List<Drugs> drugs = [];
  List<Drugs> searchedDrugs = [];
  final data = locator<DummyDrugDataABS>();

  int _pillAmount = 1;
  int get pillAmount => _pillAmount;

  bool _isBody = true;
  bool get isBody => _isBody;

  void onSearchClicked() {
    _isBody = !_isBody;
    print(_isBody);
    notifyListeners();
  }

  Future<void> getDrugData() async {
    setBusy(true);
    try {
      var drugList = await data.fetchDrugData();
      this.drugs = drugList;
      setBusy(false);
    } on Failure catch (failureMessage) {
      setFailure(failureMessage.message);
    }
    setBusy(false);
  }

  Future<void> search(String drugName) async {
    setBusy(true);
    try {
      var searchResult = await data.searchDrugData(drugName);
      this.searchedDrugs = searchResult;
      setBusy(false);
    } on Failure catch (failureMessage) {
      setFailure(failureMessage.message);
    }
    setBusy(false);
  }

  void increaseNumberOfPills() {
    _pillAmount = _pillAmount + 1;
    notifyListeners();
  }

  void decreaseNumberOfPills() {
    _pillAmount = _pillAmount - 1;
    notifyListeners();
  }

  Future<void> selectedDrugList({
    String? drugName,
    String? drugContent,
    String? drugForm,
    int? price,
    String? image,
    String? mass,
    int? availableAmount,
  }) async {}
}
