// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.PersonEmailPK;

privileged aspect PersonEmailPK_Roo_Json {
    
    public String PersonEmailPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static PersonEmailPK PersonEmailPK.fromJsonToPersonEmailPK(String json) {
        return new JSONDeserializer<PersonEmailPK>().use(null, PersonEmailPK.class).deserialize(json);
    }
    
    public static String PersonEmailPK.toJsonArray(Collection<PersonEmailPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<PersonEmailPK> PersonEmailPK.fromJsonArrayToPersonEmailPKs(String json) {
        return new JSONDeserializer<List<PersonEmailPK>>().use(null, ArrayList.class).use("values", PersonEmailPK.class).deserialize(json);
    }
    
}