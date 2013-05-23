package ro.roda.domain;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.solr.RooSolrSearchable;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = InstanceRightTargetGroupPK.class, versionField = "", table = "instance_right_target_group", schema = "public")
@RooDbManaged(automaticallyDelete = true)
@RooSolrSearchable
@RooJson
public class InstanceRightTargetGroup {
}