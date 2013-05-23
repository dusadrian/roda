// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ro.roda.domain;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import ro.roda.domain.News;

privileged aspect News_Roo_Json {
    
    public String News.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public static News News.fromJsonToNews(String json) {
        return new JSONDeserializer<News>().use(null, News.class).deserialize(json);
    }
    
    public static String News.toJsonArray(Collection<News> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static Collection<News> News.fromJsonArrayToNewspieces(String json) {
        return new JSONDeserializer<List<News>>().use(null, ArrayList.class).use("values", News.class).deserialize(json);
    }
    
}