// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.OrgEmailPK;

privileged aspect OrgEmailPK_Roo_Json {
    
    public String OrgEmailPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static OrgEmailPK OrgEmailPK.fromJsonToOrgEmailPK(String json) {
        return new JSONDeserializer<OrgEmailPK>().use(null, OrgEmailPK.class).deserialize(json);
    }
    
    public static String OrgEmailPK.toJsonArray(Collection<OrgEmailPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<OrgEmailPK> OrgEmailPK.fromJsonArrayToOrgEmailPKs(String json) {
        return new JSONDeserializer<List<OrgEmailPK>>().use(null, ArrayList.class).use("values", OrgEmailPK.class).deserialize(json);
    }
    
}
