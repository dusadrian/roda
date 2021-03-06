package ro.roda.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.rosuda.JRI.REXP;
import org.rosuda.JRI.RMainLoopCallbacks;
import org.rosuda.JRI.Rengine;

public class RBean {

	private final Log log = LogFactory.getLog(this.getClass());

	private Rengine re;

	public RBean(String[] arg0, boolean arg1, RMainLoopCallbacks arg2) {
		log.trace(System.getProperties());
		if ("yes".equalsIgnoreCase(System.getProperty("jri.ignore.ule"))) {
			re = null;
		} else {
			re = new Rengine(arg0, arg1, arg2);
			log.trace("JRI Rengine.versionCheck() = " + Rengine.versionCheck());
		}
	}

	public void rnorm(int param) {
		// http://www.wojtek.njh6.de/Ddocs/Djri/jri.html

		// Tomcat JVM:
		// -Djava.library.path=/Users/cosmin/R/x86_64-apple-darwin12.2.1-library/2.15/rJava/jri:/opt/local/lib/R/lib/x86_64
		// Environment for MacOSX + macports:
		// R_HOME=/opt/local/lib/R

		// the engine creates R as a new thread
		// so we should wait until it's ready
		if (re == null) {
			log.error("RBean not initialized");
			return;
		}
		while (!re.waitForR()) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				log.error("InterruptedException", e);
			}
		}

		// In R, call rnorm(X), which generates X numbers from a standard
		// normal distribution.
		REXP rn = re.eval("rnorm(" + param + ")");

		// The data type REXP provides functions for converting to different
		// data types.
		// In this case we know that rnorm(X) must have returned
		// an array of doubles, so we know what to convert to:
		double[] rnd = rn.asDoubleArray();

		log.trace("Obtained result from R");
		for (int i = 0; i < rnd.length; i++) {
			log.trace(rnd[i]);
		}
	}

	public REXP eval(String statement) {
		// Tomcat JVM:
		// -Djava.library.path=/Users/cosmin/R/x86_64-apple-darwin12.2.1-library/2.15/rJava/jri:/opt/local/lib/R/lib/x86_64
		// Environment for MacOSX + macports:
		// R_HOME=/opt/local/lib/R

		// the engine creates R as a new thread
		// so we should wait until it's ready
		if (re == null) {
			log.error("RBean not initialized");
			return null;
		}
		while (!re.waitForR()) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				log.error("InterruptedException", e);
			}
		}

		boolean obtainedLock = re.getRsync().safeLock();
		try {
			return re.eval(statement);
		} finally {
			if (obtainedLock)
				re.getRsync().unlock();
		}

	}

	/**
	 * ends the underlying Rengine connection
	 */
	public void end() {
		if (re != null) {
			re.end();
		}
	}
}

/*
 * 1 variabila:
 * 
 * aa<-sample(18:90, 1200, replace=TRUE); summary(aa) //pt. numerice
 * 
 * bb<-sample(1:5, 1200, replace=TRUE); table(bb) // pt. categoriale
 * 
 * 2 variabile:
 * 
 * cc<-sample(1:2, 1200, replace=TRUE); table(bb,cc) // crosstab 2 variabile
 * categoriale
 */
