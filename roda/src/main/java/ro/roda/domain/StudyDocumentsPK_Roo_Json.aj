// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.StudyDocumentsPK;

privileged aspect StudyDocumentsPK_Roo_Json {
    
    public String StudyDocumentsPK.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static StudyDocumentsPK StudyDocumentsPK.fromJsonToStudyDocumentsPK(String json) {
        return new JSONDeserializer<StudyDocumentsPK>().use(null, StudyDocumentsPK.class).deserialize(json);
    }
    
    public static String StudyDocumentsPK.toJsonArray(Collection<StudyDocumentsPK> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<StudyDocumentsPK> StudyDocumentsPK.fromJsonArrayToStudyDocumentsPKs(String json) {
        return new JSONDeserializer<List<StudyDocumentsPK>>().use(null, ArrayList.class).use("values", StudyDocumentsPK.class).deserialize(json);
    }
    
}