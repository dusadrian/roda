// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.FormEditedNumberVar;

privileged aspect FormEditedNumberVar_Roo_Json {
    
    public String FormEditedNumberVar.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static FormEditedNumberVar FormEditedNumberVar.fromJsonToFormEditedNumberVar(String json) {
        return new JSONDeserializer<FormEditedNumberVar>().use(null, FormEditedNumberVar.class).deserialize(json);
    }
    
    public static String FormEditedNumberVar.toJsonArray(Collection<FormEditedNumberVar> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<FormEditedNumberVar> FormEditedNumberVar.fromJsonArrayToFormEditedNumberVars(String json) {
        return new JSONDeserializer<List<FormEditedNumberVar>>().use(null, ArrayList.class).use("values", FormEditedNumberVar.class).deserialize(json);
    }
    
}
