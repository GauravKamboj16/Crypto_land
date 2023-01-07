class BuyCoinModel{

  late String _name,_symbol;
  late double _price,_totalCoins,_totalValue;


  String get name => _name;

  set name(String value) {
    _name = value;
  }

  BuyCoinModel(this._name, this._symbol, this._price, this._totalCoins,this._totalValue);

  get symbol => _symbol;

  set symbol(value) {
    _symbol = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  get totalValue => _totalValue;

  set totalValue(value) {
    _totalValue = value;
  }

  get totalCoins => _totalCoins;

  set totalCoins(value) {
    _totalCoins = value;
  }
}