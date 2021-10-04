// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homepage_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageViewModel on _HomePageViewModelBase, Store {
  final _$datasAtom = Atom(name: '_HomePageViewModelBase.datas');

  @override
  List<Data> get datas {
    _$datasAtom.reportRead();
    return super.datas;
  }

  @override
  set datas(List<Data> value) {
    _$datasAtom.reportWrite(value, super.datas, () {
      super.datas = value;
    });
  }

  final _$userAtom = Atom(name: '_HomePageViewModelBase.user');

  @override
  List<User> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(List<User> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_HomePageViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$buttonTextAtom = Atom(name: '_HomePageViewModelBase.buttonText');

  @override
  ObservableList<String> get buttonText {
    _$buttonTextAtom.reportRead();
    return super.buttonText;
  }

  @override
  set buttonText(ObservableList<String> value) {
    _$buttonTextAtom.reportWrite(value, super.buttonText, () {
      super.buttonText = value;
    });
  }

  final _$iconsAtom = Atom(name: '_HomePageViewModelBase.icons');

  @override
  ObservableList<IconData> get icons {
    _$iconsAtom.reportRead();
    return super.icons;
  }

  @override
  set icons(ObservableList<IconData> value) {
    _$iconsAtom.reportWrite(value, super.icons, () {
      super.icons = value;
    });
  }

  final _$datalarAtom = Atom(name: '_HomePageViewModelBase.datalar');

  @override
  ObservableFuture<List<Data>>? get datalar {
    _$datalarAtom.reportRead();
    return super.datalar;
  }

  @override
  set datalar(ObservableFuture<List<Data>>? value) {
    _$datalarAtom.reportWrite(value, super.datalar, () {
      super.datalar = value;
    });
  }

  final _$pageStateAtom = Atom(name: '_HomePageViewModelBase.pageState');

  @override
  PageState get pageState {
    _$pageStateAtom.reportRead();
    return super.pageState;
  }

  @override
  set pageState(PageState value) {
    _$pageStateAtom.reportWrite(value, super.pageState, () {
      super.pageState = value;
    });
  }

  final _$isServiseReuquestLoadingAtom =
      Atom(name: '_HomePageViewModelBase.isServiseReuquestLoading');

  @override
  bool get isServiseReuquestLoading {
    _$isServiseReuquestLoadingAtom.reportRead();
    return super.isServiseReuquestLoading;
  }

  @override
  set isServiseReuquestLoading(bool value) {
    _$isServiseReuquestLoadingAtom
        .reportWrite(value, super.isServiseReuquestLoading, () {
      super.isServiseReuquestLoading = value;
    });
  }

  final _$fetchDatasAsyncAction =
      AsyncAction('_HomePageViewModelBase.fetchDatas');

  @override
  Future<void> fetchDatas() {
    return _$fetchDatasAsyncAction.run(() => super.fetchDatas());
  }

  final _$_HomePageViewModelBaseActionController =
      ActionController(name: '_HomePageViewModelBase');

  @override
  void changeRequest() {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.changeRequest');
    try {
      return super.changeRequest();
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getButtonText(String? Id) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.getButtonText');
    try {
      return super.getButtonText(Id);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reverseButtonText(String? buttonTxt, int index) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.reverseButtonText');
    try {
      return super.reverseButtonText(buttonTxt, index);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reverseIcon(IconData icon, int index) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.reverseIcon');
    try {
      return super.reverseIcon(icon, index);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getIcon(String? id) {
    final _$actionInfo = _$_HomePageViewModelBaseActionController.startAction(
        name: '_HomePageViewModelBase.getIcon');
    try {
      return super.getIcon(id);
    } finally {
      _$_HomePageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
datas: ${datas},
user: ${user},
currentIndex: ${currentIndex},
buttonText: ${buttonText},
icons: ${icons},
datalar: ${datalar},
pageState: ${pageState},
isServiseReuquestLoading: ${isServiseReuquestLoading}
    ''';
  }
}
