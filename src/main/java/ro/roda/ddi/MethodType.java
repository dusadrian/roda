//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2012.10.05 at 02:34:54 AM EEST 
//

package ro.roda.ddi;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

/**
 * <p>
 * Java class for methodType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="methodType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="dataColl" type="{http://www.icpsr.umich.edu/DDI}dataCollType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="notes" type="{http://www.icpsr.umich.edu/DDI}notesType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="anlyInfo" type="{http://www.icpsr.umich.edu/DDI}anlyInfoType" minOccurs="0"/>
 *         &lt;element name="stdyClas" type="{http://www.icpsr.umich.edu/DDI}stdyClasType" minOccurs="0"/>
 *       &lt;/sequence>
 *       &lt;attribute name="ID" type="{http://www.w3.org/2001/XMLSchema}ID" />
 *       &lt;attribute name="xml-lang" type="{http://www.w3.org/2001/XMLSchema}NMTOKEN" />
 *       &lt;attribute name="source" default="producer">
 *         &lt;simpleType>
 *           &lt;restriction base="{http://www.w3.org/2001/XMLSchema}NMTOKEN">
 *             &lt;enumeration value="archive"/>
 *             &lt;enumeration value="producer"/>
 *           &lt;/restriction>
 *         &lt;/simpleType>
 *       &lt;/attribute>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "methodType", propOrder = { "dataColl" })
@Entity
@Table(schema = "ddi",name = "MethodologyAndProcessing")
public class MethodType {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@XmlTransient
	private long id_;

	public long getId_() {
		return id_;
	}

	public void setId_(long id_) {
		this.id_ = id_;
	}

	@ManyToOne
	@JoinColumn(name = "StudyDescription_id")
	@XmlTransient
	private StdyDscrType stdydscrtype;

	public StdyDscrType getStdydscrtype() {
		return stdydscrtype;
	}

	public void setStdydscrtype(StdyDscrType stdydscrtype) {
		this.stdydscrtype = stdydscrtype;
	}

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "methodtype")
	protected List<DataCollType> dataColl;

	@XmlAttribute(name = "ID")
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	@XmlID
	@XmlSchemaType(name = "ID")
	protected String id;

	// @XmlAttribute(name = "xml-lang")
	// @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	// @XmlSchemaType(name = "NMTOKEN")
	// protected String xmlLang;
	//
	// @XmlAttribute
	// @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	// protected String source;

	/**
	 * Gets the value of the dataColl property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the dataColl property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getDataColl().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link DataCollType }
	 * 
	 * 
	 */
	public List<DataCollType> getDataColl() {
		if (dataColl == null) {
			dataColl = new ArrayList<DataCollType>();
		}
		return this.dataColl;
	}

	/**
	 * Gets the value of the id property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getID() {
		return id;
	}

	/**
	 * Sets the value of the id property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setID(String value) {
		this.id = value;
	}

}
