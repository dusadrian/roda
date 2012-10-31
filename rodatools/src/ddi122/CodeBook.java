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
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import dbext.Org;

/**
 * <p>
 * Java class for anonymous complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="docDscr" type="{http://www.icpsr.umich.edu/DDI}docDscrType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="stdyDscr" type="{http://www.icpsr.umich.edu/DDI}stdyDscrType" maxOccurs="unbounded"/>
 *         &lt;element name="fileDscr" type="{http://www.icpsr.umich.edu/DDI}fileDscrType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="dataDscr" type="{http://www.icpsr.umich.edu/DDI}dataDscrType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="otherMat" type="{http://www.icpsr.umich.edu/DDI}otherMatType" maxOccurs="unbounded" minOccurs="0"/>
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
 *       &lt;attribute name="version" type="{http://www.w3.org/2001/XMLSchema}string" fixed="1.2.2" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "docDscr", "stdyDscr", "fileDscr",
		"dataDscr", "otherMat" })
@XmlRootElement(name = "codeBook")
@Entity
@Table(name = "Codebook")
public class CodeBook {
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

	// links the two Java Packages
	@ManyToOne
	@JoinColumn(name = "org_id")
	@XmlTransient
	private Org org;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "codebook")
	protected List<DocDscrType> docDscr;

	@XmlElement(required = true)
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "codebook")
	protected List<StdyDscrType> stdyDscr;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "codebook")
	protected List<FileDscrType> fileDscr;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "codebook")
	protected List<DataDscrType> dataDscr;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "codebook")
	protected List<OtherMatType> otherMat;

	@XmlAttribute(name = "ID")
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	@XmlID
	@XmlSchemaType(name = "ID")
	protected String id;

	@XmlAttribute(name = "xml-lang")
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	@XmlSchemaType(name = "NMTOKEN")
	protected String xmlLang;

	// @XmlAttribute
	// @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	// protected String source;

	@XmlAttribute
	protected String version;

	/**
	 * Gets the value of the docDscr property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the docDscr property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getDocDscr().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link DocDscrType }
	 * 
	 * 
	 */
	public List<DocDscrType> getDocDscr() {
		if (docDscr == null) {
			docDscr = new ArrayList<DocDscrType>();
		}
		return this.docDscr;
	}

	/**
	 * Gets the value of the stdyDscr property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the stdyDscr property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getStdyDscr().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link StdyDscrType }
	 * 
	 * 
	 */
	public List<StdyDscrType> getStdyDscr() {
		if (stdyDscr == null) {
			stdyDscr = new ArrayList<StdyDscrType>();
		}
		return this.stdyDscr;
	}

	/**
	 * Gets the value of the fileDscr property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the fileDscr property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getFileDscr().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link FileDscrType }
	 * 
	 * 
	 */
	public List<FileDscrType> getFileDscr() {
		if (fileDscr == null) {
			fileDscr = new ArrayList<FileDscrType>();
		}
		return this.fileDscr;
	}

	/**
	 * Gets the value of the dataDscr property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the dataDscr property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getDataDscr().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link DataDscrType }
	 * 
	 * 
	 */
	public List<DataDscrType> getDataDscr() {
		if (dataDscr == null) {
			dataDscr = new ArrayList<DataDscrType>();
		}
		return this.dataDscr;
	}

	/**
	 * Gets the value of the otherMat property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the otherMat property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getOtherMat().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link OtherMatType }
	 * 
	 * 
	 */
	public List<OtherMatType> getOtherMat() {
		if (otherMat == null) {
			otherMat = new ArrayList<OtherMatType>();
		}
		return this.otherMat;
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
	 * Gets the value of the xmlLang property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getXmlLang() {
		return xmlLang;
	}

	/**
	 * Sets the value of the xmlLang property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setXmlLang(String value) {
		this.xmlLang = value;
	}

	/**
	 * Gets the value of the version property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getVersion() {
		if (version == null) {
			return "1.2.2";
		} else {
			return version;
		}
	}

	/**
	 * Sets the value of the version property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setVersion(String value) {
		this.version = value;
	}

	/*
	 * public Org getOrg() { return org; }
	 * 
	 * public void setOrg(Org org) { this.org = org; }
	 */

	public Org getOrg() {
		return org;
	}

	public void setOrg(Org org) {
		this.org = org;
	}
}
