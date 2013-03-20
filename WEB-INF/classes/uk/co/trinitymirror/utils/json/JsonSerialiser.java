package uk.co.trinitymirror.utils.json;

import com.google.gson.Gson;

/**
  * Serialises objects to JSON .
  * Relies on the Gson library: http://code.google.com/p/google-gson/
  */
public class JsonSerialiser {

  /**
    * Serialise an object to a JSON string
    * @param object - the object to serialise. This will
    *   not serialise self referencing objects, or very complex 
    *   objects (throws a StackOverflow exception)
    * 
    */
  public static String toJson(Object object) {
    Gson gson = new Gson();
    return gson.toJson(object);
  }

}
