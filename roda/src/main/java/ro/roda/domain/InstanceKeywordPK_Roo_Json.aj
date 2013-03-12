// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.InstanceKeywordPK;

privileged aspect InstanceKeywordPK_Roo_Json {
    
    public String InstanceKeywordPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static InstanceKeywordPK InstanceKeywordPK.fromJsonToInstanceKeywordPK(String json) {
        return new JSONDeserializer<InstanceKeywordPK>().use(null, InstanceKeywordPK.class).deserialize(json);
    }
    
    public static String InstanceKeywordPK.toJsonArray(Collection<InstanceKeywordPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<InstanceKeywordPK> InstanceKeywordPK.fromJsonArrayToInstanceKeywordPKs(String json) {
        return new JSONDeserializer<List<InstanceKeywordPK>>().use(null, ArrayList.class).use("values", InstanceKeywordPK.class).deserialize(json);
    }
    
}