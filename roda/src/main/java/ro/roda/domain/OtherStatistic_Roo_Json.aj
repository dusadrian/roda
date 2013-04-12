// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.OtherStatistic;

privileged aspect OtherStatistic_Roo_Json {
    
    public String OtherStatistic.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static OtherStatistic OtherStatistic.fromJsonToOtherStatistic(String json) {
        return new JSONDeserializer<OtherStatistic>().use(null, OtherStatistic.class).deserialize(json);
    }
    
    public static String OtherStatistic.toJsonArray(Collection<OtherStatistic> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<OtherStatistic> OtherStatistic.fromJsonArrayToOtherStatistics(String json) {
        return new JSONDeserializer<List<OtherStatistic>>().use(null, ArrayList.class).use("values", OtherStatistic.class).deserialize(json);
    }
    
}
