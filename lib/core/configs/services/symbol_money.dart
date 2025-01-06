enum SymbolMoney {
  usd(r'$ '),
  sol('S/ '),
  point('ptos');

  const SymbolMoney(this.symbol);
  final String symbol;
}
