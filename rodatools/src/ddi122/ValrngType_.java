package ddi122;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-25T03:11:55.782+0300")
@StaticMetamodel(ValrngType.class)
public class ValrngType_ {
	public static volatile SingularAttribute<ValrngType, Long> id_;
	public static volatile SingularAttribute<ValrngType, VarType> vartype;
	public static volatile ListAttribute<ValrngType, RangeType> range;
	public static volatile ListAttribute<ValrngType, ItemType> item;
	public static volatile SingularAttribute<ValrngType, String> id;
	public static volatile SingularAttribute<ValrngType, String> xmlLang;
	public static volatile SingularAttribute<ValrngType, String> source;
}