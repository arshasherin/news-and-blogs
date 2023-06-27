import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;


 const  String uri = "https://milliondotsadmin.noviindus.co.in/api";

  class Webservice{
   Future<Map<String,dynamic>>fetchBlogCategory()async{
     try{
       http.Response response = await http.get(Uri.parse("$uri/news-and-blogs"),headers: {
        "Content-Type": "application/json"
       },
       );

      if(response.statusCode==202){
         Map<String,dynamic> data;
          data = jsonDecode(response.body);
        return data;  
      }else{
        log("Error while geting data");
        // print("errorrrr===="+value.toString());
      }
     }catch (e){
      log(e.toString());
      // log("e");
     }
     return {
     
     };
   }

   Future <Map<String,dynamic>>fetchBlogByCategory({required int id})async{

   try{
        final response = await http.post(Uri.parse("$uri/news-and-blogs-catg"),
    headers: {
        "Content-Type": "application/json"
       },
       body: jsonEncode({
        "category":id
       })
    );
    if(response.statusCode==200){
      log(response.body);
      // log(response.body.toString());
      Map<String,dynamic> data;
          data = jsonDecode(response.body);
        return data; 
      
    }else{
      log("error while fetching data");
      // log("errorrrrrr=========");
    }
   }catch(e){
      log(e.toString());
      // log("e");
   } return {};
   }

   Future<Map<String,dynamic>>  fetchBlogDetailsById(int blogId)async{
    try{
      final response = await http.get(Uri.parse("https://milliondotsadmin.noviindus.co.in/api/news-and-blogs-details/$blogId"),headers: {
                "Content-Type": "application/json"

      });  
      if(response.statusCode==202){
         Map<String,dynamic> data;
         data = jsonDecode(response.body);
         return data;
      }else{
        log("erro while fetching blog details");
      }  
    }catch(e){
      log(e.toString());
    }
    return {};
   }
   
}