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
import javax.persistence.ElementCollection;
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
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

/**
 * <p>
 * Java class for stdyDscrType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="stdyDscrType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="citation" type="{http://www.icpsr.umich.edu/DDI}citationType" maxOccurs="unbounded"/>
 *         &lt;element name="stdyInfo" type="{http://www.icpsr.umich.edu/DDI}stdyInfoType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="method" type="{http://www.icpsr.umich.edu/DDI}methodType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="dataAccs" type="{http://www.icpsr.umich.edu/DDI}dataAccsType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="othrStdyMat" type="{http://www.icpsr.umich.edu/DDI}othrStdyMatType" maxOccurs="unbounded" minOccurs="0"/>
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
 *       &lt;attribute name="access" type="{http://www.w3.org/2001/XMLSchema}IDREFS" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "stdyDscrType", propOrder = { "citation", "stdyInfo", "method",
		"dataAccs", "othrStdyMat" })
@Entity
@Table(name = "StudyDescription")
public class StdyDscrType {
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
	@JoinColumn(name = "Codebook_id")
	@XmlTransient
	private CodeBook codebook;

	public CodeBook getCodebook() {
		return codebook;
	}

	public void setCodebook(CodeBook codebook) {
		this.codebook = codebook;
	}

	@XmlElement(required = true)
	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "stdydscrtype")
	protected List<CitationType> citation;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "stdydscrtype")
	protected List<StdyInfoType> stdyInfo;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "stdydscrtype")
	protected List<MethodType> method;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "stdydscrtype")
	protected List<DataAccsType> dataAccs;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "stdydscrtype")
	protected List<OthrStdyMatType> othrStdyMat;

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
	// TODO Cosmin commented IDREF annot.
	// @XmlIDREF
	@XmlSchemaType(name = "IDREFS")
	@ElementCollection
	protected List<String> access;

	/**
	 * Gets the value of the citation property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the citation property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getCitation().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link CitationType }
	 * 
	 * 
	 */
	public List<CitationType> getCitation() {
		if (citation == null) {
			citation = new ArrayList<CitationType>();
		}
		return this.citation;
	}

	/**
	 * Gets the value of the stdyInfo property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the stdyInfo property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getStdyInfo().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link StdyInfoType }
	 * 
	 * 
	 */
	public List<StdyInfoType> getStdyInfo() {
		if (stdyInfo == null) {
			stdyInfo = new ArrayList<StdyInfoType>();
		}
		return this.stdyInfo;
	}

	/**
	 * Gets the value of the method property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the method property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getMethod().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link MethodType }
	 * 
	 * 
	 */
	public List<MethodType> getMethod() {
		if (method == null) {
			method = new ArrayList<MethodType>();
		}
		return this.method;
	}

	/**
	 * Gets the value of the dataAccs property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the dataAccs property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getDataAccs().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link DataAccsType }
	 * 
	 * 
	 */
	public List<DataAccsType> getDataAccs() {
		if (dataAccs == null) {
			dataAccs = new ArrayList<DataAccsType>();
		}
		return this.dataAccs;
	}

	/**
	 * Gets the value of the othrStdyMat property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the othrStdyMat property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getOthrStdyMat().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link OthrStdyMatType }
	 * 
	 * 
	 */
	public List<OthrStdyMatType> getOthrStdyMat() {
		if (othrStdyMat == null) {
			othrStdyMat = new ArrayList<OthrStdyMatType>();
		}
		return this.othrStdyMat;
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
	 * Gets the value of the access property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the access property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getAccess().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List {@link Object }
	 * 
	 * 
	 */
	public List<String> getAccess() {
		if (access == null) {
			access = new ArrayList<String>();
		}
		return this.access;
	}

}
