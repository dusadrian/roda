package dbext;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-25T15:50:14.907+0300")
@StaticMetamodel(DemoScope.class)
public class DemoScope_ {
	public static volatile SingularAttribute<DemoScope, Integer> id;
	public static volatile SingularAttribute<DemoScope, String> description;
	public static volatile ListAttribute<DemoScope, DemoSlice> demoSlices;
	public static volatile ListAttribute<DemoScope, Instance> instances;
}