// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.OrgInternetPK;

privileged aspect OrgInternetPK_Roo_Json {
    
    public String OrgInternetPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static OrgInternetPK OrgInternetPK.fromJsonToOrgInternetPK(String json) {
        return new JSONDeserializer<OrgInternetPK>().use(null, OrgInternetPK.class).deserialize(json);
    }
    
    public static String OrgInternetPK.toJsonArray(Collection<OrgInternetPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<OrgInternetPK> OrgInternetPK.fromJsonArrayToOrgInternetPKs(String json) {
        return new JSONDeserializer<List<OrgInternetPK>>().use(null, ArrayList.class).use("values", OrgInternetPK.class).deserialize(json);
    }
    
}
