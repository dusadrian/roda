// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.City;

privileged aspect City_Roo_Json {
    
    public String City.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static City City.fromJsonToCity(String json) {
        return new JSONDeserializer<City>().use(null, City.class).deserialize(json);
    }
    
    public static String City.toJsonArray(Collection<City> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<City> City.fromJsonArrayToCitys(String json) {
        return new JSONDeserializer<List<City>>().use(null, ArrayList.class).use("values", City.class).deserialize(json);
    }
    
}