//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2012.10.05 at 02:34:54 AM EEST 
//

package ddi122;

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
import javax.persistence.OneToOne;
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
 * Java class for setAvailType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="setAvailType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="accsPlac" type="{http://www.icpsr.umich.edu/DDI}accsPlacType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="origArch" type="{http://www.icpsr.umich.edu/DDI}origArchType" minOccurs="0"/>
 *         &lt;element name="avlStatus" type="{http://www.icpsr.umich.edu/DDI}avlStatusType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="collSize" type="{http://www.icpsr.umich.edu/DDI}collSizeType" minOccurs="0"/>
 *         &lt;element name="complete" type="{http://www.icpsr.umich.edu/DDI}completeType" minOccurs="0"/>
 *         &lt;element name="fileQnty" type="{http://www.icpsr.umich.edu/DDI}fileQntyType" minOccurs="0"/>
 *         &lt;element name="notes" type="{http://www.icpsr.umich.edu/DDI}notesType" maxOccurs="unbounded" minOccurs="0"/>
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
 *       &lt;attribute name="media" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="callno" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="label" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="type" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "setAvailType", propOrder = { "accsPlac", "origArch" })
@Entity
@Table(name = "DataSetAvailability")
public class SetAvailType {
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
	@JoinColumn(name = "DataAccess_id")
	@XmlTransient
	private DataAccsType dataaccess;

	public DataAccsType getDataaccess() {
		return dataaccess;
	}

	public void setDataaccess(DataAccsType dataaccess) {
		this.dataaccess = dataaccess;
	}

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "setavailtype")
	protected List<AccsPlacType> accsPlac;

	@OneToOne(cascade = { CascadeType.ALL })
	protected OrigArchType origArch;

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

	@XmlAttribute
	protected String media;
	@XmlAttribute
	protected String callno;
	@XmlAttribute
	protected String label;
	@XmlAttribute
	protected String type;

	/**
	 * Gets the value of the accsPlac property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the accsPlac property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getAccsPlac().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link AccsPlacType }
	 * 
	 * 
	 */
	public List<AccsPlacType> getAccsPlac() {
		if (accsPlac == null) {
			accsPlac = new ArrayList<AccsPlacType>();
		}
		return this.accsPlac;
	}

	/**
	 * Gets the value of the origArch property.
	 * 
	 * @return possible object is {@link OrigArchType }
	 * 
	 */
	public OrigArchType getOrigArch() {
		return origArch;
	}

	/**
	 * Sets the value of the origArch property.
	 * 
	 * @param value
	 *            allowed object is {@link OrigArchType }
	 * 
	 */
	public void setOrigArch(OrigArchType value) {
		this.origArch = value;
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

	/**
	 * Gets the value of the media property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getMedia() {
		return media;
	}

	/**
	 * Sets the value of the media property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setMedia(String value) {
		this.media = value;
	}

	/**
	 * Gets the value of the callno property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getCallno() {
		return callno;
	}

	/**
	 * Sets the value of the callno property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setCallno(String value) {
		this.callno = value;
	}

	/**
	 * Gets the value of the label property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getLabel() {
		return label;
	}

	/**
	 * Sets the value of the label property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setLabel(String value) {
		this.label = value;
	}

	/**
	 * Gets the value of the type property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getType() {
		return type;
	}

	/**
	 * Sets the value of the type property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setType(String value) {
		this.type = value;
	}

}
