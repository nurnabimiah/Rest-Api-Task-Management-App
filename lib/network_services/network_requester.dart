
import 'dart:convert';

import 'package:http/http.dart' as http;
class NetworkRequester {



  Future getRequest(String url) async {

    /*
    * http code ta ekTa error generate korte pare
    * ai error ta handle korar jonno amra try catch use korbo
    * try er modde amra code lekhbo jodi success hoy return korbe
    * R jodi success na hoy catch a jeye error ta generate korbe
    * Network thekhe jokhon kiso amra nei tokhon amra decode kori
    * Network er modde kono kiso patate hole amra encode kori
    * */


    try{
     http.Response response = await http.get(Uri.parse(url));
     if(response.statusCode == 200){
       /*
       * jodi request ta sucess hoy tahole er body ta k amra return kore dibo
       * body ta request korle sob kiso niye ase
       * */
       return jsonDecode(response.body);

     }else{
       print('Request failed');
     }

    }catch(e){
        print(e);
    }
  }




  //............post method

  Future postRequest(String url,Map<String,String> body) async {

    /*
    *
    * post method a bes kiso jinis k pass korano jay
    * mane body sathe niye onno kothao niye jete chassi
    * post method encode korte hoy
    * */


    try{
      http.Response response = await http.post(Uri.parse(url),
          headers: {"Content-type": "application/json", "Accept": "application/json"},
          body: jsonEncode(body) );
      if(response.statusCode == 200){
        /*
       * jodi request ta sucess hoy tahole er body ta k amra return kore dibo
       * body ta request korle sob kiso niye ase
       * */

        return jsonDecode(response.body);

      }else{
        print('Request failed');
      }

    }catch(e){
      print(e);
    }
  }



}