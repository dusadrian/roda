// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.UserSettingValuePK;

privileged aspect UserSettingValuePK_Roo_Json {
    
    public String UserSettingValuePK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static UserSettingValuePK UserSettingValuePK.fromJsonToUserSettingValuePK(String json) {
        return new JSONDeserializer<UserSettingValuePK>().use(null, UserSettingValuePK.class).deserialize(json);
    }
    
    public static String UserSettingValuePK.toJsonArray(Collection<UserSettingValuePK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<UserSettingValuePK> UserSettingValuePK.fromJsonArrayToUserSettingValuePKs(String json) {
        return new JSONDeserializer<List<UserSettingValuePK>>().use(null, ArrayList.class).use("values", UserSettingValuePK.class).deserialize(json);
    }
    
}
