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
 * Java class for prodStmtType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="prodStmtType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="producer" type="{http://www.icpsr.umich.edu/DDI}producerType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="copyright" type="{http://www.icpsr.umich.edu/DDI}copyrightType" minOccurs="0"/>
 *         &lt;element name="prodDate" type="{http://www.icpsr.umich.edu/DDI}prodDateType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="prodPlac" type="{http://www.icpsr.umich.edu/DDI}prodPlacType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="software" type="{http://www.icpsr.umich.edu/DDI}softwareType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="fundAg" type="{http://www.icpsr.umich.edu/DDI}fundAgType" maxOccurs="unbounded" minOccurs="0"/>
 *         &lt;element name="grantNo" type="{http://www.icpsr.umich.edu/DDI}grantNoType" maxOccurs="unbounded" minOccurs="0"/>
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
@XmlType(name = "prodStmtType", propOrder = { "producer", "copyright",
		"prodDate", "prodPlac", "software", "fundAg", "grantNo" })
@Entity
@Table(name = "ProductionStatement")
public class ProdStmtType {
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

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "prodstmttype")
	protected List<ProducerType> producer;

	@OneToOne(cascade = { CascadeType.ALL })
	protected CopyrightType copyright;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "prodstmttype")
	protected List<ProdDateType> prodDate;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "prodstmttype")
	protected List<ProdPlacType> prodPlac;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "prodstmttype")
	protected List<SoftwareType> software;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "prodstmttype")
	protected List<FundAgType> fundAg;

	@OneToMany(cascade = { CascadeType.ALL }, mappedBy = "prodstmttype")
	protected List<GrantNoType> grantNo;

	@XmlAttribute(name = "ID")
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	@XmlID
	@XmlSchemaType(name = "ID")
	protected String id;
	@XmlAttribute(name = "xml-lang")
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	@XmlSchemaType(name = "NMTOKEN")
	protected String xmlLang;
	@XmlAttribute
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	protected String source;

	/**
	 * Gets the value of the producer property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the producer property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getProducer().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link ProducerType }
	 * 
	 * 
	 */
	public List<ProducerType> getProducer() {
		if (producer == null) {
			producer = new ArrayList<ProducerType>();
		}
		return this.producer;
	}

	/**
	 * Gets the value of the copyright property.
	 * 
	 * @return possible object is {@link CopyrightType }
	 * 
	 */
	public CopyrightType getCopyright() {
		return copyright;
	}

	/**
	 * Sets the value of the copyright property.
	 * 
	 * @param value
	 *            allowed object is {@link CopyrightType }
	 * 
	 */
	public void setCopyright(CopyrightType value) {
		this.copyright = value;
	}

	/**
	 * Gets the value of the prodDate property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the prodDate property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getProdDate().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link ProdDateType }
	 * 
	 * 
	 */
	public List<ProdDateType> getProdDate() {
		if (prodDate == null) {
			prodDate = new ArrayList<ProdDateType>();
		}
		return this.prodDate;
	}

	/**
	 * Gets the value of the prodPlac property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the prodPlac property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getProdPlac().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link ProdPlacType }
	 * 
	 * 
	 */
	public List<ProdPlacType> getProdPlac() {
		if (prodPlac == null) {
			prodPlac = new ArrayList<ProdPlacType>();
		}
		return this.prodPlac;
	}

	/**
	 * Gets the value of the software property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the software property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getSoftware().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link SoftwareType }
	 * 
	 * 
	 */
	public List<SoftwareType> getSoftware() {
		if (software == null) {
			software = new ArrayList<SoftwareType>();
		}
		return this.software;
	}

	/**
	 * Gets the value of the fundAg property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the fundAg property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getFundAg().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link FundAgType }
	 * 
	 * 
	 */
	public List<FundAgType> getFundAg() {
		if (fundAg == null) {
			fundAg = new ArrayList<FundAgType>();
		}
		return this.fundAg;
	}

	/**
	 * Gets the value of the grantNo property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the grantNo property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getGrantNo().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link GrantNoType }
	 * 
	 * 
	 */
	public List<GrantNoType> getGrantNo() {
		if (grantNo == null) {
			grantNo = new ArrayList<GrantNoType>();
		}
		return this.grantNo;
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
	 * Gets the value of the source property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSource() {
		if (source == null) {
			return null;
		} else {
			return source;
		}
	}

	/**
	 * Sets the value of the source property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSource(String value) {
		this.source = value;
	}

}