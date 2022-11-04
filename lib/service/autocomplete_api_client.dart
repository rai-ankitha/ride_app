
import 'package:http/http.dart' as http;


class HttpService {
 Future<http.Response> getSuggestions(search)
 {
  return http.get(Uri.parse(
      "https://api.foursquare.com/v3/autocomplete?query=${search}&types=geo"),
      headers: {
       'Authorization': 'fsq3T7SKdVMGwe+IQk+L/A1uyXQgk+w0ILNgWBUGmoeyld8=',
       'accept': 'application/json'
      });
 }

}
