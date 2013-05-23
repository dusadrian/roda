// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.OrgAddress;

privileged aspect OrgAddress_Roo_Json {
    
    public String OrgAddress.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static OrgAddress OrgAddress.fromJsonToOrgAddress(String json) {
        return new JSONDeserializer<OrgAddress>().use(null, OrgAddress.class).deserialize(json);
    }
    
    public static String OrgAddress.toJsonArray(Collection<OrgAddress> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<OrgAddress> OrgAddress.fromJsonArrayToOrgAddresses(String json) {
        return new JSONDeserializer<List<OrgAddress>>().use(null, ArrayList.class).use("values", OrgAddress.class).deserialize(json);
    }
    
}