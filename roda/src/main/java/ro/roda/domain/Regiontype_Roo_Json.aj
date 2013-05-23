// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.Regiontype;

privileged aspect Regiontype_Roo_Json {
    
    public String Regiontype.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static Regiontype Regiontype.fromJsonToRegiontype(String json) {
        return new JSONDeserializer<Regiontype>().use(null, Regiontype.class).deserialize(json);
    }
    
    public static String Regiontype.toJsonArray(Collection<Regiontype> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<Regiontype> Regiontype.fromJsonArrayToRegiontypes(String json) {
        return new JSONDeserializer<List<Regiontype>>().use(null, ArrayList.class).use("values", Regiontype.class).deserialize(json);
    }
    
}