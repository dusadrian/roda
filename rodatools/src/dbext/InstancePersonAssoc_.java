package dbext;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-25T15:50:15.251+0300")
@StaticMetamodel(InstancePersonAssoc.class)
public class InstancePersonAssoc_ {
	public static volatile SingularAttribute<InstancePersonAssoc, Integer> id;
	public static volatile SingularAttribute<InstancePersonAssoc, String> assocDescription;
	public static volatile SingularAttribute<InstancePersonAssoc, String> assocName;
	public static volatile ListAttribute<InstancePersonAssoc, InstancePerson> instancePersons;
}