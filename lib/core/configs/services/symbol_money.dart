enum SymbolMoney {
  usd(r'$ '),
  sol('S/ ');

  const SymbolMoney(this.symbol);
  final String symbol;
}
