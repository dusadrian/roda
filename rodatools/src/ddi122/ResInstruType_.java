package ddi122;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-25T03:11:55.570+0300")
@StaticMetamodel(ResInstruType.class)
public class ResInstruType_ {
	public static volatile SingularAttribute<ResInstruType, Long> id_;
	public static volatile SingularAttribute<ResInstruType, DataCollType> datacolltype;
	public static volatile ListAttribute<ResInstruType, String> content;
	public static volatile SingularAttribute<ResInstruType, String> id;
	public static volatile SingularAttribute<ResInstruType, String> xmlLang;
	public static volatile SingularAttribute<ResInstruType, String> source;
	public static volatile SingularAttribute<ResInstruType, String> type;
}