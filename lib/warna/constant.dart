class PetaniKuConstant{


static Uri baseUrl(url){
  Uri server = Uri.parse('http://192.168.18.11:8000/api/'+url);
  
  return server;
} 


}