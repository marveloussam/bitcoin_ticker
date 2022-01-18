//2. Import the required packages.
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC';
const apiKey = 'ZDJiOTY0YWExYzg1NDFlMWFjYTkyZjk2NTU4MmYwOTQ';

class CoinData {
  //TODO 3: Update getCoinData to take the selectedCurrency as an input.
  Future getCoinData(selectedCurrency) async {
    //TODO 4: Update the URL to use the selectedCurrency input.
   // String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
  	
    String myURL = '$coinAPIURL$selectedCurrency';
 


    http.Response response = await http.get(Uri.parse(myURL), headers: {'x-ba-key': apiKey});
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['last'];
      return lastPrice;
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}
