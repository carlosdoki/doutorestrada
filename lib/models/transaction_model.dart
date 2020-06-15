class TransactionModel {
  String name;
  String photo;
  String date;
  String amount;

  TransactionModel(this.name, this.photo, this.date, this.amount);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
        item['name'], item['photo'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "POSTO SOL DA DUTRA",
    "photo": "assets/images/uber_photo.png",
    "date": "1st Apr 2020",
    "amount": "9"
  },
  {
    "name": "Posto Serras",
    "photo": "assets/images/nike_photo.png",
    "date": "30th Mar 2020",
    "amount": "5"
  },
  {
    "name": "Posto Barnabes",
    "photo": "assets/images/user_photo.png",
    "date": "15th Mar 2020",
    "amount": "1"
  }
];
