package org.opendatafoundation.data.spss;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2012-11-08T15:51:29.834+0200")
@StaticMetamodel(SPSSRecordType7Subtype11.class)
public class SPSSRecordType7Subtype11_ {
	public static volatile SingularAttribute<SPSSRecordType7Subtype11, Long> id_;
	public static volatile SingularAttribute<SPSSRecordType7Subtype11, Integer> recordTypeCode;
	public static volatile SingularAttribute<SPSSRecordType7Subtype11, Integer> recordSubtypeCode;
	public static volatile SingularAttribute<SPSSRecordType7Subtype11, Integer> dataElementLength;
	public static volatile SingularAttribute<SPSSRecordType7Subtype11, Integer> numberOfDataElements;
	public static volatile ListAttribute<SPSSRecordType7Subtype11, VariableDisplayParams> variableDisplayParams;
}