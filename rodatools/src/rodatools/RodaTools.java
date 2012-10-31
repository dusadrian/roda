package rodatools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.xml.XMLConstants;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.SchemaOutputResolver;
import javax.xml.bind.Unmarshaller;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.stream.StreamSource;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.opendatafoundation.data.FileFormatInfo;
import org.opendatafoundation.data.FileFormatInfo.ASCIIFormat;
import org.opendatafoundation.data.spss.SPSSFile;
import org.opendatafoundation.data.spss.SPSSFileException;
import org.xml.sax.SAXException;

import ddi122.CodeBook;

public class RodaTools {

	// TODO move to external properties file
	private static final String xsdDdi25 = "xsd/codebook.xsd";
	private static final String xsdDdi122 = "xsd/ddi122.xsd";
	private static final String rodaNesstar = "data/roda-nesstar/";
	private static final String rodaNesstarDbOutput = "data/roda-db-export/";
	private static final String jaxbContextPath = "ddi122";
	private static final String jpaPersistenceUnitName = "ddi122-jpa";

	/**
	 * @param args
	 */
	public static void main(String[] args) throws SAXException, IOException {

		// TODO better validation
		if (args.length == 0) {
			usage();
			System.exit(1);
		}

		long startTime = System.nanoTime();

		RodaTools rt = new RodaTools();

		// TODO use Apache Commons CLI, http://commons.apache.org/cli/

		try {
			if ("-i1".compareTo(args[0]) == 0) {
				rt.importOneToDb(args[1], args[2], args[3], args[4]);
			} else if ("-e".compareTo(args[0]) == 0) {
				rt.exportAllFromDb();
			} else if ("-i".compareTo(args[0]) == 0) {
				rt.importAllToDb(args[1], args[2], args[3]);
			} else if ("-g".compareTo(args[0]) == 0) {
				rt.generateSchema(new Ddi122SchemaOutputResolver());
			} else if ("-v2".compareTo(args[0]) == 0) {

				File file = new File(args[1]);

				// select only XML files in the directory
				String[] filenames = file.list(new FilenameFilter() {
					@Override
					public boolean accept(File f, String s) {
						if (s.toUpperCase().endsWith(".XML"))
							return true;
						return false;
					}
				});

				if (filenames == null) {
					rt.validateDdi25(args[1]);
				} else {
					for (String xmlFilename : filenames) {
						rt.validateDdi25(args[1] + "/" + xmlFilename);
					}
				}
			} else if ("-v1".compareTo(args[0]) == 0) {
				File file = new File(args[1]);

				// select only XML files in the directory
				String[] filenames = file.list(new FilenameFilter() {
					@Override
					public boolean accept(File f, String s) {
						if (s.toUpperCase().endsWith(".XML"))
							return true;
						return false;
					}
				});

				if (filenames == null) {
					rt.validateDdi122(args[1]);
				} else {
					for (String xmlFilename : filenames) {
						rt.validateDdi122(args[1] + "/" + xmlFilename);
					}
				}
			} else if ("-c".compareTo(args[0]) == 0) {
				File file = new File(args[1]);

				// select only XML files in the directory
				String[] filenames = file.list(new FilenameFilter() {
					@Override
					public boolean accept(File f, String s) {
						if (s.toUpperCase().endsWith(".XML"))
							return true;
						return false;
					}
				});

				if (filenames == null) {
					rt.convertNesstarToDdi25(args[1], args[2]);
				} else {
					for (String filename : filenames) {
						rt.convertNesstarToDdi25(args[1] + "/" + filename,
								args[2] + "/" + filename);
					}
				}
			} else if ("-s".compareTo(args[0]) == 0) {
				File file = new File(args[1]);

				// select only XML files in the directory
				String[] filenames = file.list(new FilenameFilter() {
					@Override
					public boolean accept(File f, String s) {
						if (s.toUpperCase().endsWith(".SAV"))
							return true;
						return false;
					}
				});

				if (filenames == null) {
					rt.convertSpssToAsciiDelimited(args[1], args[2]);
				} else {
					for (String filename : filenames) {
						rt.convertSpssToAsciiDelimited(
								args[1] + "/" + filename, args[2] + "/"
										+ filename);
					}
				}
			} else {
				usage();
			}
		} catch (Exception e) {
			usage();
			System.out.println(e.getMessage());
			e.printStackTrace();
		}

		long duration = System.nanoTime() - startTime;
		System.out.println("Duration: " + (duration / 1000000000) + "."
				+ (duration % 1000000000) / 1000000 + " s ");
	}

	private static void usage() {
		System.out.println("Usage: ");
		System.out.println("-i1\timport one file to DB");
		System.out.println("-i\timport all to DB");
		System.out.println("-e\texport all from DB");
		System.out.println("-g\tGENERATE SCHEMA from JAXB Java classes");
		System.out
				.println("-v1\tVALIDATE DDI 1.2.2\tparameter 1 : [XML file] | [XML dir]");
		System.out
				.println("-v2\tVALIDATE DDI 2.5\tparameter 1 : [XML file] | [XML dir]");
		System.out
				.println("-s\tSPSS\t parameter 1 : [SPSS .SAV file] | [SPSS dir]");
		System.out
				.println("-c\tCONVERT\tparameter 1: [source XML file] | [source XML dir]");
		System.out
				.println("\t\t parameter 2: [converted XML file] | [converted XML dir]");
	}

	private void validateDdi25(String filename) throws SAXException,
			IOException {

		Validator validatorDdi25 = SchemaFactory
				.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
				.newSchema(new File(xsdDdi25)).newValidator();

		File file = new File(filename);
		Source source = new StreamSource(file);
		try {
			validatorDdi25.validate(source);
			System.out.println(file.getAbsolutePath() + " : VALID");
		} catch (SAXException e) {
			System.out.println(file.getAbsolutePath() + " : NOT VALID because");
			System.out.println(e.getMessage());
		}
	}

	private void validateDdi122(String filename) throws SAXException,
			IOException {

		Validator validatorDdi122 = SchemaFactory
				.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
				.newSchema(new File(xsdDdi122)).newValidator();

		File file = new File(filename);
		Source source = new StreamSource(file);
		try {
			validatorDdi122.validate(source);
			System.out.println(file.getAbsolutePath() + " : VALID");
		} catch (SAXException e) {
			System.out.println(file.getAbsolutePath() + " : NOT VALID because");
			System.out.println(e.getMessage());
		}
	}

	private void convertNesstarToDdi25(String filenameInput,
			String filenameOutput) throws SAXException, IOException {
		BufferedReader br;
		FileWriter fw = new FileWriter(filenameOutput);
		String line;
		boolean insideTag = false, afterTag = false;

		br = new BufferedReader(new InputStreamReader(new FileInputStream(
				filenameInput), Charset.forName("UTF-8")));
		while ((line = br.readLine()) != null) {
			if (afterTag) {
				fw.write(line + "\n");
			}
			if (line.matches(".*<codeBook .*")) {
				insideTag = true;
			}
			if (insideTag && line.endsWith(">")) {
				insideTag = false;
				afterTag = true;
				fw.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
				fw.write("<codeBook xmlns=\"ddi:codebook:2_5\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"ddi:codebook:2_5 codebook.xsd\" version=\"2.5\">\n");
			}
		}
		br.close();
		fw.close();
		// validate(filenameOutput);
	}

	private void convertSpssToAsciiDelimited(String spssFilename,
			String outputFilename) throws SPSSFileException,
			TransformerException, IOException {

		SPSSFile spssFile = new SPSSFile(spssFilename);
		spssFile.loadMetadata();
		spssFile.loadData();

		FileFormatInfo fileFormatInfo = new FileFormatInfo();
		fileFormatInfo.format = FileFormatInfo.Format.ASCII;
		fileFormatInfo.asciiFormat = ASCIIFormat.DELIMITED;

		spssFile.exportData(new File(outputFilename), fileFormatInfo);

		// spssFile.dumpDDI2();
	}

	private void exportAllFromDb() throws JAXBException, IOException,
			SAXException {

		// override DDL generation
		// make sure tables are _not_ created / dropped
		// we just want to use the available data
		HashMap<String, Object> properties = new HashMap<String, Object>();
		properties.put("eclipselink.ddl-generation", "none");
		// TODO add logging level control

		EntityManagerFactory emf = Persistence.createEntityManagerFactory(
				jpaPersistenceUnitName, properties);

		EntityManager em = emf.createEntityManager();

		JAXBContext jc = JAXBContext.newInstance(jaxbContextPath);

		Marshaller marshaller = jc.createMarshaller();
		// validate using DDI 1.2.2 XML Schema
		marshaller.setSchema(SchemaFactory.newInstance(
				XMLConstants.W3C_XML_SCHEMA_NS_URI).newSchema(
				new File(xsdDdi122)));
		// clean XML formatting
		marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);

		em.getTransaction().begin();

		// get the CodeBook which was saved in database
		Query query = em.createQuery("select c from CodeBook c");

		em.getTransaction().commit();

		// iterate over results
		for (CodeBook cb : (List<CodeBook>) query.getResultList()) {

			String filename = cb.getID() + ".xml";
			System.err.println(filename);
			// save the CodeBook as XML
			marshaller.marshal(cb, new File(rodaNesstarDbOutput + filename));

			// optional gentle suggestion :)
			System.gc();
		}

		em.close();
		emf.close();
	}

	/**
	 * @throws JAXBException
	 * @throws IOException
	 * @throws SAXException
	 */
	private void importAllToDb(String jdbcUrl, String username,
			String userpassword) throws JAXBException, IOException,
			SAXException {
		EntityManagerFactory emf;
		EntityManager em;

		JAXBContext jc = JAXBContext.newInstance(jaxbContextPath);

		Unmarshaller unmarshaller = jc.createUnmarshaller();

		// validate using DDI 1.2.2 XML Schema
		unmarshaller.setSchema(SchemaFactory.newInstance(
				XMLConstants.W3C_XML_SCHEMA_NS_URI).newSchema(
				new File(xsdDdi122)));

		File file = new File(rodaNesstar);
		String[] filenames = file.list(new FilenameFilter() {
			@Override
			public boolean accept(File f, String s) {
				if (s.toUpperCase().endsWith(".XML"))
					return true;
				return false;
			}
		});

		if (filenames != null) {

			// override DDL generation type
			HashMap<String, Object> properties = new HashMap<String, Object>();
			properties.put("eclipselink.ddl-generation",
					"drop-and-create-tables");
			properties.put("hibernate.hbm2ddl.auto", "create");
			// TODO add logging level control

			emf = Persistence.createEntityManagerFactory(
					jpaPersistenceUnitName, properties);

			em = emf.createEntityManager();

			for (String filename : filenames) {
				System.err.println(filename);

				CodeBook cb = (CodeBook) unmarshaller.unmarshal(new File(
						rodaNesstar + filename));

				em.getTransaction().begin();
				em.persist(cb);
				em.getTransaction().commit();

				// optional
				System.gc();

				// // get the CodeBook which was saved in database
				// Query query = em.createQuery("select c from CodeBook c");
				// CodeBook result = (CodeBook) query.getResultList().get(0);
				//
				// // save the CodeBook as XML
				// marshaller.marshal(result, new File(rodaNesstarDb+filename));
			}
			em.close();
			emf.close();
		}

	}

	private void importOneToDb(String jdbcUrl, String username,
			String userpassword, String fname) throws JAXBException,
			IOException, SAXException {
		EntityManagerFactory emf;
		EntityManager em;

		JAXBContext jc = JAXBContext.newInstance(jaxbContextPath);

		Unmarshaller unmarshaller = jc.createUnmarshaller();
		// validate using DDI 1.2.2 XML Schema
		unmarshaller.setSchema(SchemaFactory.newInstance(
				XMLConstants.W3C_XML_SCHEMA_NS_URI).newSchema(
				new File(xsdDdi122)));

		String filename = fname;
		File file = new File(filename);

		// properties for JPA
		HashMap<String, Object> properties = new HashMap<String, Object>();

		properties.put("javax.persistence.jdbc.url", jdbcUrl);

		properties.put("hibernate.connection.url", jdbcUrl);

		properties.put("hibernate.connection.username", username);

		properties.put("hibernate.connection.password", userpassword);

		// override DDL generation type

		// eclipselink
		properties.put("eclipselink.ddl-generation", "none");

		// hibernate
		properties.put("hibernate.hbm2ddl.auto", "update");

		// TODO add logging level control

		emf = Persistence.createEntityManagerFactory(jpaPersistenceUnitName,
				properties);

		em = emf.createEntityManager();

		System.err.println(filename);

		CodeBook cb = (CodeBook) unmarshaller.unmarshal(file);

		em.getTransaction().begin();
		em.persist(cb);
		em.getTransaction().commit();

		// optional
		System.gc();

		// // get the CodeBook which was saved in database
		// Query query = em.createQuery("select c from CodeBook c");
		// CodeBook result = (CodeBook) query.getResultList().get(0);
		//
		// // save the CodeBook as XML
		// marshaller.marshal(result, new File(rodaNesstarDb+filename));
		em.close();
		emf.close();

	}

	private void generateSchema(SchemaOutputResolver sor) throws JAXBException,
			IOException, SAXException {
		JAXBContext jc = JAXBContext.newInstance(jaxbContextPath);
		jc.generateSchema(sor);
	}
}