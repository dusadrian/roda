// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.StudyOrgPK;

privileged aspect StudyOrgPK_Roo_Json {
    
    public String StudyOrgPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static StudyOrgPK StudyOrgPK.fromJsonToStudyOrgPK(String json) {
        return new JSONDeserializer<StudyOrgPK>().use(null, StudyOrgPK.class).deserialize(json);
    }
    
    public static String StudyOrgPK.toJsonArray(Collection<StudyOrgPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<StudyOrgPK> StudyOrgPK.fromJsonArrayToStudyOrgPKs(String json) {
        return new JSONDeserializer<List<StudyOrgPK>>().use(null, ArrayList.class).use("values", StudyOrgPK.class).deserialize(json);
    }
    
}