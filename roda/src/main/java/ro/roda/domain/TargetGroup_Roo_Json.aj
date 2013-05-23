// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.TargetGroup;

privileged aspect TargetGroup_Roo_Json {
    
    public String TargetGroup.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static TargetGroup TargetGroup.fromJsonToTargetGroup(String json) {
        return new JSONDeserializer<TargetGroup>().use(null, TargetGroup.class).deserialize(json);
    }
    
    public static String TargetGroup.toJsonArray(Collection<TargetGroup> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<TargetGroup> TargetGroup.fromJsonArrayToTargetGroups(String json) {
        return new JSONDeserializer<List<TargetGroup>>().use(null, ArrayList.class).use("values", TargetGroup.class).deserialize(json);
    }
    
}