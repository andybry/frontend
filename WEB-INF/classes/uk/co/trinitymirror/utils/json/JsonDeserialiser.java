package uk.co.trinitymirror.utils.json;

import com.google.gson.Gson;

/**
  * Deserialises objects from JSON .
  * Relies on the Gson library: http://code.google.com/p/google-gson/
  */
public class JsonDeserialiser {

  /**
    * Deserialise an object to a JSON string
    * @param jsonString - the string to deserialise.
    * @param classOfT - a class that should represent the top level object
    *   e.g. if the top level object is a map java.util.Map and for arrays
        
    * 
    */
  public static Object fromJson(String jsonString) {
    Gson gson = new Gson();
    // trim the string
    String trimmedString = jsonString.replaceAll("^\\s*(\\S*)\\s*$", "$1");
    Class<?> classOfT = java.lang.String.class;
    if(trimmedString.startsWith("{")) {
      classOfT = java.util.Map.class;
    } else if(trimmedString.startsWith("[")) {
      classOfT = java.util.List.class;
    }
    return gson.fromJson(jsonString, classOfT);
  }

}
