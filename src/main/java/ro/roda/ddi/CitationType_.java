package ro.roda.ddi;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-10-26T11:35:48.863+0300")
@StaticMetamodel(CitationType.class)
public class CitationType_ {
	public static volatile SingularAttribute<CitationType, Long> id_;
	public static volatile SingularAttribute<CitationType, StdyDscrType> stdydscrtype;
	public static volatile SingularAttribute<CitationType, RelMatType> relmattype;
	public static volatile SingularAttribute<CitationType, TitlStmtType> titlStmt;
	public static volatile SingularAttribute<CitationType, RspStmtType> rspStmt;
	public static volatile SingularAttribute<CitationType, ProdStmtType> prodStmt;
	public static volatile SingularAttribute<CitationType, DistStmtType> distStmt;
	public static volatile SingularAttribute<CitationType, SerStmtType> serStmt;
	public static volatile ListAttribute<CitationType, VerStmtType> verStmt;
	public static volatile SingularAttribute<CitationType, BiblCitType> biblCit;
	public static volatile ListAttribute<CitationType, HoldingsType> holdings;
	public static volatile SingularAttribute<CitationType, String> id;
}
