package ro.roda;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = SelectionVariableItemPK.class, versionField = "", table = "selection_variable_item", schema = "public")
@RooDbManaged(automaticallyDelete = true)
public class SelectionVariableItem {
}
