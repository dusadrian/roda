package ddi122;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-25T03:11:55.263+0300")
@StaticMetamodel(GeogCoverType.class)
public class GeogCoverType_ {
	public static volatile SingularAttribute<GeogCoverType, Long> id_;
	public static volatile SingularAttribute<GeogCoverType, SumDscrType> sumdscrtype;
	public static volatile ListAttribute<GeogCoverType, String> content;
	public static volatile SingularAttribute<GeogCoverType, String> id;
	public static volatile SingularAttribute<GeogCoverType, String> xmlLang;
	public static volatile SingularAttribute<GeogCoverType, String> source;
}