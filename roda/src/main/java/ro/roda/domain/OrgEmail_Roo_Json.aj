// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.OrgEmail;

privileged aspect OrgEmail_Roo_Json {
    
    public String OrgEmail.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static OrgEmail OrgEmail.fromJsonToOrgEmail(String json) {
        return new JSONDeserializer<OrgEmail>().use(null, OrgEmail.class).deserialize(json);
    }
    
    public static String OrgEmail.toJsonArray(Collection<OrgEmail> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<OrgEmail> OrgEmail.fromJsonArrayToOrgEmails(String json) {
        return new JSONDeserializer<List<OrgEmail>>().use(null, ArrayList.class).use("values", OrgEmail.class).deserialize(json);
    }
    
}
