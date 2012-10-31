//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, vJAXB 2.1.10 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2012.10.05 at 02:34:54 AM EEST 
//

package ddi122;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlID;
import javax.xml.bind.annotation.XmlMixed;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlTransient;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;

import org.hibernate.annotations.Type;

/**
 * <p>
 * Java class for catStatType complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType name="catStatType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;choice maxOccurs="unbounded" minOccurs="0">
 *         &lt;element name="Link" type="{http://www.icpsr.umich.edu/DDI}LinkType"/>
 *         &lt;element name="ExtLink" type="{http://www.icpsr.umich.edu/DDI}ExtLinkType"/>
 *         &lt;element name="table" type="{http://www.icpsr.umich.edu/DDI}tableType"/>
 *       &lt;/choice>
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
 *       &lt;attribute name="type" default="freq">
 *         &lt;simpleType>
 *           &lt;restriction base="{http://www.w3.org/2001/XMLSchema}NMTOKEN">
 *             &lt;enumeration value="freq"/>
 *             &lt;enumeration value="percent"/>
 *             &lt;enumeration value="crosstab"/>
 *           &lt;/restriction>
 *         &lt;/simpleType>
 *       &lt;/attribute>
 *       &lt;attribute name="URI" type="{http://www.w3.org/2001/XMLSchema}string" />
 *       &lt;attribute name="methrefs" type="{http://www.w3.org/2001/XMLSchema}IDREFS" />
 *       &lt;attribute name="wgtd" default="not-wgtd">
 *         &lt;simpleType>
 *           &lt;restriction base="{http://www.w3.org/2001/XMLSchema}NMTOKEN">
 *             &lt;enumeration value="wgtd"/>
 *             &lt;enumeration value="not-wgtd"/>
 *           &lt;/restriction>
 *         &lt;/simpleType>
 *       &lt;/attribute>
 *       &lt;attribute name="wgt-var" type="{http://www.w3.org/2001/XMLSchema}IDREFS" />
 *       &lt;attribute name="weight" type="{http://www.w3.org/2001/XMLSchema}IDREFS" />
 *       &lt;attribute name="sdatrefs" type="{http://www.w3.org/2001/XMLSchema}IDREFS" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "catStatType", propOrder = { "content" })
@Entity
@Table(name = "CategoryStatistic")
public class CatStatType {
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
	@JoinColumn(name = "category_id")
	@XmlTransient
	private CatgryType category;

	public CatgryType getCategory() {
		return category;
	}

	public void setCategory(CatgryType category) {
		this.category = category;
	}

	// @XmlElementRefs({
	// @XmlElementRef(name = "ExtLink", namespace =
	// "http://www.icpsr.umich.edu/DDI", type = JAXBElement.class),
	// @XmlElementRef(name = "table", namespace =
	// "http://www.icpsr.umich.edu/DDI", type = JAXBElement.class),
	// @XmlElementRef(name = "Link", namespace =
	// "http://www.icpsr.umich.edu/DDI", type = JAXBElement.class)
	// })
	@XmlMixed
	@ElementCollection
	@Type(type = "text")
	protected List<String> content;
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
	@XmlAttribute
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	protected String type;
	@XmlAttribute(name = "URI")
	protected String uri;
	@XmlAttribute
	// TODO Cosmin commented IDREF annot.
	// @XmlIDREF
	@XmlSchemaType(name = "IDREFS")
	@ElementCollection
	protected List<String> methrefs;
	@XmlAttribute
	@XmlJavaTypeAdapter(CollapsedStringAdapter.class)
	protected String wgtd;
	@XmlAttribute(name = "wgt-var")
	// TODO Cosmin commented IDREF annot.
	// @XmlIDREF
	@XmlSchemaType(name = "IDREFS")
	@ElementCollection
	protected List<String> wgtVar;
	@XmlAttribute
	// TODO Cosmin commented IDREF annot.
	// @XmlIDREF
	@XmlSchemaType(name = "IDREFS")
	@ElementCollection
	protected List<String> weight;
	@XmlAttribute
	// TODO Cosmin commented IDREF annot.
	// @XmlIDREF
	@XmlSchemaType(name = "IDREFS")
	@ElementCollection
	protected List<String> sdatrefs;

	/**
	 * Gets the value of the content property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the content property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getContent().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List
	 * {@link JAXBElement }{@code <}{@link ExtLinkType }{@code >}
	 * {@link JAXBElement }{@code <}{@link TableType }{@code >}
	 * {@link JAXBElement }{@code <}{@link LinkType }{@code >} {@link String }
	 * 
	 * 
	 */
	public List<String> getContent() {
		if (content == null) {
			content = new ArrayList<String>();
		}
		return this.content;
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

	/**
	 * Gets the value of the type property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getType() {
		if (type == null) {
			return "freq";
		} else {
			return type;
		}
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

	/**
	 * Gets the value of the uri property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getURI() {
		return uri;
	}

	/**
	 * Sets the value of the uri property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setURI(String value) {
		this.uri = value;
	}

	/**
	 * Gets the value of the methrefs property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the methrefs property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getMethrefs().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List {@link Object }
	 * 
	 * 
	 */
	public List<String> getMethrefs() {
		if (methrefs == null) {
			methrefs = new ArrayList<String>();
		}
		return this.methrefs;
	}

	/**
	 * Gets the value of the wgtd property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getWgtd() {
		if (wgtd == null) {
			return "not-wgtd";
		} else {
			return wgtd;
		}
	}

	/**
	 * Sets the value of the wgtd property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setWgtd(String value) {
		this.wgtd = value;
	}

	/**
	 * Gets the value of the wgtVar property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the wgtVar property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getWgtVar().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List {@link Object }
	 * 
	 * 
	 */
	public List<String> getWgtVar() {
		if (wgtVar == null) {
			wgtVar = new ArrayList<String>();
		}
		return this.wgtVar;
	}

	/**
	 * Gets the value of the weight property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the weight property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getWeight().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List {@link Object }
	 * 
	 * 
	 */
	public List<String> getWeight() {
		if (weight == null) {
			weight = new ArrayList<String>();
		}
		return this.weight;
	}

	/**
	 * Gets the value of the sdatrefs property.
	 * 
	 * <p>
	 * This accessor method returns a reference to the live List, not a
	 * snapshot. Therefore any modification you make to the returned List will
	 * be present inside the JAXB object. This is why there is not a
	 * <CODE>set</CODE> method for the sdatrefs property.
	 * 
	 * <p>
	 * For example, to add a new item, do as follows:
	 * 
	 * <pre>
	 * getSdatrefs().add(newItem);
	 * </pre>
	 * 
	 * 
	 * <p>
	 * Objects of the following type(s) are allowed in the List {@link Object }
	 * 
	 * 
	 */
	public List<String> getSdatrefs() {
		if (sdatrefs == null) {
			sdatrefs = new ArrayList<String>();
		}
		return this.sdatrefs;
	}

}