// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.StudyDescrPK;

privileged aspect StudyDescrPK_Roo_Json {
    
    public String StudyDescrPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static StudyDescrPK StudyDescrPK.fromJsonToStudyDescrPK(String json) {
        return new JSONDeserializer<StudyDescrPK>().use(null, StudyDescrPK.class).deserialize(json);
    }
    
    public static String StudyDescrPK.toJsonArray(Collection<StudyDescrPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<StudyDescrPK> StudyDescrPK.fromJsonArrayToStudyDescrPKs(String json) {
        return new JSONDeserializer<List<StudyDescrPK>>().use(null, ArrayList.class).use("values", StudyDescrPK.class).deserialize(json);
    }
    
}
