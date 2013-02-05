package ro.roda;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = UserAuthLogPK.class, versionField = "", table = "user_auth_log", schema = "public")
@RooDbManaged(automaticallyDelete = true)
public class UserAuthLog {
}
