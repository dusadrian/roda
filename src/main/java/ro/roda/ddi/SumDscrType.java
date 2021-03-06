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
 * Java class for sumDscrType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="sumDscrType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="timePrd" type="{http://www.icpsr.umich.edu/DDI}timePrdType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="collDate" type="{http://www.icpsr.umich.edu/DDI}collDateType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="nation" type="{http://www.icpsr.umich.edu/DDI}nationType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="geogCover" type="{http://www.icpsr.umich.edu/DDI}geogCoverType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="geogUnit" type="{http://www.icpsr.umich.edu/DDI}geogUnitType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="anlyUnit" type="{http://www.icpsr.umich.edu/DDI}anlyUnitType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="universe" type="{http://www.icpsr.umich.edu/DDI}universeType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="dataKind" type="{http://www.icpsr.umich.edu/DDI}dataKindType" maxOccurs="unbounded" minOccurs="0"/>
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
@XmlType(name = "sumDscrType", propOrder = { "timePrd", "collDate", "nation",
		"geogCover", "geogUnit", "anlyUnit", "universe" })
@Entity
@Table(schema = "ddi",name = "SummaryDataDescription")
public class SumDscrType {
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
	@JoinColumn(name = "StudyInfoAndScope_id")
	@XmlTransient
	private StdyInfoType stdyinfotype;

	public StdyInfoType getStdyinfotype() {
		return stdyinfotype;
	}

	public void setStdyinfotype(StdyInfoType stdyinfotype) {
		this.stdyinfotype = stdyinfotype;
	}

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<TimePrdType> timePrd;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<CollDateType> collDate;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<NationType> nation;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<GeogCoverType> geogCover;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<GeogUnitType> geogUnit;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<AnlyUnitType> anlyUnit;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "sumdscrtype")
	protected List<UniverseType> universe;

	@XmlAttribute(name = "ID")
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	@XmlID
	@XmlSchemaType(name = "ID")
	protected String id;

	// @XmlAttribute(name = "xml-lang")
	// @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	// @XmlSchemaType(name = "NMTOKEN")
	// protected String xmlLang;
	// @XmlAttribute
	// @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	// protected String source;

	/**
	 * Gets the value of the timePrd property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the timePrd property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getTimePrd().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link TimePrdType }
	 * 
	 * 
	 */
	public List<TimePrdType> getTimePrd() {
		if (timePrd == null) {
			timePrd = new ArrayList<TimePrdType>();
		}
		return this.timePrd;
	}

	/**
	 * Gets the value of the collDate property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the collDate property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getCollDate().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link CollDateType }
	 * 
	 * 
	 */
	public List<CollDateType> getCollDate() {
		if (collDate == null) {
			collDate = new ArrayList<CollDateType>();
		}
		return this.collDate;
	}

	/**
	 * Gets the value of the nation property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the nation property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getNation().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link NationType }
	 * 
	 * 
	 */
	public List<NationType> getNation() {
		if (nation == null) {
			nation = new ArrayList<NationType>();
		}
		return this.nation;
	}

	/**
	 * Gets the value of the geogCover property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the geogCover property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getGeogCover().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link GeogCoverType }
	 * 
	 * 
	 */
	public List<GeogCoverType> getGeogCover() {
		if (geogCover == null) {
			geogCover = new ArrayList<GeogCoverType>();
		}
		return this.geogCover;
	}

	/**
	 * Gets the value of the geogUnit property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the geogUnit property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getGeogUnit().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link GeogUnitType }
	 * 
	 * 
	 */
	public List<GeogUnitType> getGeogUnit() {
		if (geogUnit == null) {
			geogUnit = new ArrayList<GeogUnitType>();
		}
		return this.geogUnit;
	}

	/**
	 * Gets the value of the anlyUnit property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the anlyUnit property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getAnlyUnit().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link AnlyUnitType }
	 * 
	 * 
	 */
	public List<AnlyUnitType> getAnlyUnit() {
		if (anlyUnit == null) {
			anlyUnit = new ArrayList<AnlyUnitType>();
		}
		return this.anlyUnit;
	}

	/**
	 * Gets the value of the universe property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the universe property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getUniverse().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link UniverseType }
	 * 
	 * 
	 */
	public List<UniverseType> getUniverse() {
		if (universe == null) {
			universe = new ArrayList<UniverseType>();
		}
		return this.universe;
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
