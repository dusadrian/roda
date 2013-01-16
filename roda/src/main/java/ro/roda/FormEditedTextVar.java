package ro.roda;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.solr.RooSolrSearchable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = FormEditedTextVarPK.class, versionField = "", table = "form_edited_text_var", schema = "public")
@RooDbManaged(automaticallyDelete = true)
@RooSolrSearchable
public class FormEditedTextVar {
}
