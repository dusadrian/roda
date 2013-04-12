// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.UserSettingValue;

privileged aspect UserSettingValue_Roo_Json {
    
    public String UserSettingValue.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static UserSettingValue UserSettingValue.fromJsonToUserSettingValue(String json) {
        return new JSONDeserializer<UserSettingValue>().use(null, UserSettingValue.class).deserialize(json);
    }
    
    public static String UserSettingValue.toJsonArray(Collection<UserSettingValue> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<UserSettingValue> UserSettingValue.fromJsonArrayToUserSettingValues(String json) {
        return new JSONDeserializer<List<UserSettingValue>>().use(null, ArrayList.class).use("values", UserSettingValue.class).deserialize(json);
    }
    
}
