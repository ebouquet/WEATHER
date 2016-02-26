/*
  COMPILATOR :
  start /D {working_directory} C:\Windows\System32\cmd.exe /K processing-java --sketch={working_directory} --run
*/


/*
 -COPYLEFT- SHARE IT COPY IT ^^
 DAMIEN BAIS / ESADSE
 damien.bais@esadse.fr

 this a very very simple class for my student
 to make some work with meteo data.
 I know it's now very well coded but
 the meaning is it to be very very simplistic
 and easy tu use.

 Share it, use it and enjoy it with this!
 VERSION 2.3   29/10/2015

 Just look this but don't make messy thing!

 If you want some more information about this class :
 https://developer.yahoo.com/weather/documentation.html

 */


//---------------------------------------------------------------------------------------
//  METEO CLASS   (*-*)
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
class Meteo {
  Meteo() {
  }
  boolean debug=true;
  boolean celsius=true;
  //--------------------------------------------
  //  REQUEST LINK FOR YAHOO API
  //--------------------------------------------
  String url_yahoo ="http://xml.weather.yahoo.com/forecastrss?w=";
  String zip;
  //--------------------------------------------
  //  LOCATION
  //--------------------------------------------
  String location_city = "";     //  Paris
  String location_country = "";  //  FR
  String location_region = "";   //
  //--------------------------------------------
  //  Units
  //--------------------------------------------
  String unit_distance="";       //  mi
  String unit_pressure="";       //  in
  String unit_speed="";          //  mph
  String unit_temperature="";    //  F
  //--------------------------------------------
  //  ATMOSPHERE
  //--------------------------------------------
  int atmos_humidity;            //  63
  float atmos_pressure;          //  30
  float atmos_visibility;        //  6.21
  int atmos_rising;              //  1
  //--------------------------------------------
  //  WIND
  //--------------------------------------------
  float wind_chill;              //  61
  float wind_direction;          //  300
  float wind_speed;              //  12
  //--------------------------------------------
  //  ASTRONOMY
  //--------------------------------------------
  String astro_sunrise;          //  7:09 pm
  String astro_sunset;           //  6:19 am
  //--------------------------------------------
  //  LATITURE / LONGITUDE
  //--------------------------------------------
  float latitude;
  float longitude;
  //--------------------------------------------
  //  CONDITION
  //--------------------------------------------
  int condi_code;
  String condi_text;
  float condi_temp;
  String condi_date;
  //--------------------------------------------
  //  FORECAST
  //--------------------------------------------

  int day_0_CODE;
  String day_0_DATE = "";
  String day_0_DAY = "";
  float day_0_HIGH;
  float day_0_LOW;
  String day_0_TEXT = "";

  int day_1_CODE;
  String day_1_DATE = "";
  String day_1_DAY = "";
  float day_1_HIGH;
  float day_1_LOW;
  String day_1_TEXT = "";

  int day_2_CODE;
  String day_2_DATE = "";
  String day_2_DAY = "";
  float day_2_HIGH;
  float day_2_LOW;
  String day_2_TEXT = "";

  int day_3_CODE;
  String day_3_DATE = "";
  String day_3_DAY = "";
  float day_3_HIGH;
  float day_3_LOW;
  String day_3_TEXT = "";

  int day_4_CODE;
  String day_4_DATE = "";
  String day_4_DAY = "";
  float day_4_HIGH;
  float day_4_LOW;
  String day_4_TEXT = "";
  //--------------------------------------------
  //  LOAD AND PARSE
  //--------------------------------------------
  void loadMeteo(String _zip) {
    if (debug)println("try to load: "+_zip);

    zip=_zip;
    XML meteo = loadXML(url_yahoo+_zip);

    if (meteo!=null) {

      if (debug) {
        println("-XML--------------------------------------------------------------------");
        println(meteo);
        println("------------------------------------------------------------------------");
      }
      XML channel = meteo.getChild("channel");
      //---------------------------------------------------------
      //  LOCATION
      //---------------------------------------------------------
      XML weather_loc = channel.getChild("yweather:location");
      location_city = weather_loc.getString("city");
      location_country = weather_loc.getString("country");
      location_region = weather_loc.getString("region");
      //---------------------------------------------------------
      //  ATMOSPHERE
      //---------------------------------------------------------
      XML weather_at = channel.getChild("yweather:atmosphere");
      atmos_humidity = weather_at.getInt("humidity");
      try {
        atmos_pressure = weather_at.getFloat("pressure");
      }
      catch(Exception e) {
      }
      try {
        atmos_rising = weather_at.getInt("rising");
      }
      catch(Exception e) {
      }
      try {
        atmos_visibility = weather_at.getFloat("visibility");
      }
      catch(Exception e) {
      }
      //---------------------------------------------------------
      //  Wind
      //---------------------------------------------------------
      XML weather_wi = channel.getChild("yweather:wind");
      wind_chill = weather_wi.getFloat("chill");
      try {
        wind_direction = weather_wi.getFloat("direction");
      }
      catch(Exception e) {
      }
      try {
        wind_speed = weather_wi.getFloat("speed");
      }
      catch(Exception e) {
      }
      //---------------------------------------------------------
      //  ASTRONOMY
      //---------------------------------------------------------
      XML weather_astro = channel.getChild("yweather:astronomy");
      astro_sunrise = weather_astro.getString("sunrise");
      astro_sunset = weather_astro.getString("sunset");
      //---------------------------------------------------------
      //  Forecast
      //---------------------------------------------------------
      XML weather_item = channel.getChild("item");
      //---------------------------------------------------------
      //  CONDITION
      //---------------------------------------------------------
      XML weather_condition = weather_item.getChild("yweather:condition");
      condi_code = weather_condition.getInt("code");
      condi_temp = conv(weather_condition.getFloat("temp"));
      condi_date = weather_condition.getString("date");
      condi_text = weather_condition.getString("text");
      //---------------------------------------------------------
      //  LATITTUDE / LONGITUDE
      //---------------------------------------------------------
      latitude = float(weather_item.getChild("geo:lat").getContent());
      longitude = float(weather_item.getChild("geo:long").getContent());
      //---------------------------------------------------------
      //  FORECAST
      //---------------------------------------------------------
      XML [] weather_forecast = weather_item.getChildren("yweather:forecast");

      day_0_CODE = weather_forecast[0].getInt("code");
      day_0_DATE = weather_forecast[0].getString("date");
      day_0_DAY = weather_forecast[0].getString("day");
      day_0_HIGH = conv(weather_forecast[0].getInt("high"));
      day_0_LOW = conv(weather_forecast[0].getInt("low"));
      day_0_TEXT = weather_forecast[0].getString("text");

      day_1_CODE = weather_forecast[1].getInt("code");
      day_1_DATE = weather_forecast[1].getString("date");
      day_1_DAY = weather_forecast[1].getString("day");
      day_1_HIGH = conv(weather_forecast[1].getInt("high"));
      day_1_LOW = conv(weather_forecast[1].getInt("low"));
      day_1_TEXT = weather_forecast[1].getString("text");

      day_2_CODE = weather_forecast[2].getInt("code");
      day_2_DATE = weather_forecast[2].getString("date");
      day_2_DAY = weather_forecast[2].getString("day");
      day_2_HIGH = conv(weather_forecast[2].getInt("high"));
      day_2_LOW = conv(weather_forecast[2].getInt("low"));
      day_2_TEXT = weather_forecast[2].getString("text");

      day_3_CODE = weather_forecast[3].getInt("code");
      day_3_DATE = weather_forecast[3].getString("date");
      day_3_DAY = weather_forecast[3].getString("day");
      day_3_HIGH = conv(weather_forecast[3].getInt("high"));
      day_3_LOW = conv(weather_forecast[3].getInt("low"));
      day_3_TEXT = weather_forecast[3].getString("text");

      day_4_CODE = weather_forecast[4].getInt("code");
      day_4_DATE = weather_forecast[4].getString("date");
      day_4_DAY = weather_forecast[4].getString("day");
      day_4_HIGH = conv(weather_forecast[4].getInt("high"));
      day_4_LOW = conv(weather_forecast[4].getInt("low"));
      day_4_TEXT = weather_forecast[4].getString("text");

      //---------------------------------------------------------
      //  END PARSING
      //---------------------------------------------------------
    } else {
      println("no Parsed!");
    }

    //------------------------------------------------------------------------------------
  }

  //---------------------------------------------------------
  //  FIND WOEID By CITY
  //---------------------------------------------------------
  String pro_Add="http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20geo.places%20where%20text%3D%22";
  String post_Add="%22&format=xml";

  Place [] findWOEIDByCity(String city) {

    XML request;
    try {
      request = loadXML(pro_Add+city+post_Add);
    }
    catch(Exception e) {
      //println(e);
      println("--------------------------------------------------------------------");
      println("A don't know this city : "+city);
      println("--------------------------------------------------------------------");
      request = null;
    }

    Place [] places=new Place[0];
    
    if (request!=null) {
      if (debug) {
        println("-XML--------------------------------------------------------------------");
        println(request);
        println("------------------------------------------------------------------------");
      }
      //---------------------------------------------------------
      //  parse nbr result
      //---------------------------------------------------------
      int nbrResult = request.getInt("yahoo:count");
      if (debug)println("found "+nbrResult+" result!");
      //---------------------------------------------------------
      //  if i found some result
      //---------------------------------------------------------
      if (nbrResult>0) {
        XML [] results = request.getChild("results").getChildren("place");

        for (int i=0; i<results.length; i++) {
          Place p=new Place();
          p.name = results[i].getChild("name").getContent();
          p.country = results[i].getChild("country").getContent();
          p.woeid = results[i].getChild("woeid").getContent();
          p.timeZone = results[i].getChild("timezone").getContent();
          p.latitude = float(results[i].getChild("centroid").getChild("longitude").getContent());
          p.longitude = float(results[i].getChild("centroid").getChild("latitude").getContent());
          places = (Place[]) append(places, p);
        }
      }
    }
    return places;
  }

  //---------------------------------------------------------
  //  TRY TO FIND CITY
  //---------------------------------------------------------
  void tryToFind(String ville) {
    Place [] places = findWOEIDByCity(ville);
    if (places.length>0)loadMeteo(places[0].woeid);
  }

  //---------------------------------------------------------
  //  UTILS THING TO MAKE CALCULATION
  //---------------------------------------------------------
  //CONVERTISSOR OF T°
  float conv(float v) {
    if (celsius) {
      return f2celsius(v);
    } else {
      return v;
    }
  }

  //farenheight to celsius [  (F°-32)  x  5/9 = °C ]
  float f2celsius(float v) {
    float r = (v-32.0)*(0.55);
    return r;
  }
  //------------------------------------END OF CLASS
  
  void initHashMap(){
  
  }
  
  
  
  
  
}


//---------------------------------------------------------------------------------------
//  PLACE CLASS
//---------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
class Place {
  String name;
  String woeid;
  String country;
  float latitude;
  float longitude;
  String timeZone;
}