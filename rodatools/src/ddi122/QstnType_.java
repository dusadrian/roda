package ddi122;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-26T11:59:01.973+0300")
@StaticMetamodel(QstnType.class)
public class QstnType_ {
	public static volatile SingularAttribute<QstnType, Long> id_;
	public static volatile SingularAttribute<QstnType, VarType> vartype;
	public static volatile ListAttribute<QstnType, QstnLitType> qstnLit;
	public static volatile SingularAttribute<QstnType, String> id;
	public static volatile ListAttribute<QstnType, String> var;
	public static volatile SingularAttribute<QstnType, String> seqNo;
	public static volatile ListAttribute<QstnType, String> sdatrefs;
}
