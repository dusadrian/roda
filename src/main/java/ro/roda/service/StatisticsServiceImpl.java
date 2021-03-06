package ro.roda.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.rosuda.JRI.REXP;
import org.rosuda.JRI.Rengine;
import org.springframework.context.SmartLifecycle;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.roda.domain.Variable;

@Service
@Transactional
public class StatisticsServiceImpl implements StatisticsService, SmartLifecycle {

	private final Log log = LogFactory.getLog(this.getClass());

	private Rengine re;

	private String rWorkingDirectory;

	private String rSourceFilename;

	private static final String classpathRodaR = "classpath*:R/roda.R";

	public String getStatisticsJson(String operation, List<Long> variableIds) {
		String errorMessage = null;

		if (variableIds != null && re != null && rWorkingDirectory != null && rSourceFilename != null) {

			Variable v1 = null, v2 = null;
			boolean validVariables = false;

			if (variableIds.size() > 0) {
				// log.trace("Number of variables: " + variableIds.size());

				v1 = Variable.findVariable(variableIds.get(0));
				validVariables = (v1 != null);

				if (validVariables && variableIds.size() > 1) {
					v2 = Variable.findVariable(variableIds.get(1));
					validVariables = (v2 != null);
				}
			}

			if (validVariables) {
				String evalExpr = null;

				re.eval("setwd(\"" + rWorkingDirectory + "\")");
				re.eval("source(\"" + rSourceFilename + "\")");

				if (v2 != null) {
					// exemplul 5 din roda.R
					// REXP rexp = re
					// .eval("getStats(list(vars = list(v1 = c(97, 99, sample(1:10, 122, replace=T), 99), v2 = c(NA, sample(18:90, 123, replace = TRUE), 999)), meta = list(v1 = c(\"NR/NS\"=99, \"Nu e cazul\"=97), v2 = c(\"Non raspuns\"=999))))");

					// log.trace("v1: " + v1.getId());
					// log.trace("v2: " + v2.getId());

					evalExpr = "getStats(list(vars = list(" + v1.getName() + " = c(" + v1.getValues() + "),"
							+ v2.getName() + " = c(" + v2.getValues() + ")), meta = list(" + v1.getName() + " = c("
							+ v1.getCategories() + ")," + v2.getName() + " = c(" + v2.getCategories() + "))))";
				} else {
					// exemplul 3 din roda.R
					// REXP rexp = re
					// .eval("getStats(list(vars = list(v1 = c(97, 99, sample(1:7, 122, replace=T), 99)), meta = list(v1 = c(\"Foarte putin\"=1, \"Foarte mult\"=7, \"Nu e cazul\"=97, \"Nu stiu\"=98, \"Nu raspund\"=99))))");

					// log.trace("Statistics: v1: " + v1.getId());

					evalExpr = "getStats(list(vars = list(" + v1.getName() + " = c(" + v1.getValues()
							+ ")), meta = list(" + v1.getName() + " = c(" + v1.getCategories() + "))))";
				}

				log.trace("Evaluating R expression: " + evalExpr);
				REXP rexp = re.eval(evalExpr);

				if (rexp != null) {
					return rexp.asString();
				} else {
					errorMessage = "Statistics: incorrect R expression was generated / evaluated";
				}
			} else {
				errorMessage = "Statistics: invalid variables as parameters";
			}
		} else {
			errorMessage = "Statistics: incorrect R setup, or no variables sent by client";
		}
		log.trace(errorMessage);
		return "{\"success\": false, \"message\":\"" + errorMessage + "\"}";
	}

	public String getStatisticsJsonDemo(Long rnormParam) {

		REXP rexp = re.eval("rnorm(" + rnormParam.intValue() + ")");

		// The data type REXP provides functions for converting
		// to different data types.
		// In this case we know that rnorm(X) must have returned
		// an array of doubles, so we know what to convert to
		double[] rnd = rexp.asDoubleArray();
		StringBuilder sbRnorm = new StringBuilder();
		sbRnorm.append("{\"itemtype\" : \"paragraph\", \"title\" : \"rnorm\", \"content\":\"");
		for (int i = 0; i < rnd.length; i++) {
			sbRnorm.append(rnd[i]);
			sbRnorm.append(",");
		}
		sbRnorm.append("\"}");

		rexp = re.eval("table(c(1,3,1,2,4,1,5,2,3), c(2,1,1,2,1,1,1,2,1))");
		int[] table = rexp.asIntArray();
		StringBuilder sbTable = new StringBuilder();
		sbTable.append("{\"itemtype\" : \"paragraph\", \"title\" : \"table\", \"content\":\"");
		for (int i = 0; i < table.length; i++) {
			sbTable.append(table[i]);
			sbTable.append(",");
		}
		sbTable.append("\"}");

		return "{\"success\": true, \"data\":[" + sbRnorm + "," + sbTable + "]}";

	}

	@Override
	public void start() {
		log.trace("start()");
		log.trace(System.getProperties());
		log.info(System.getProperty("jri.ignore.ule"));

		re = null;
		rWorkingDirectory = null;
		rSourceFilename = null;

		if (!"yes".equalsIgnoreCase(System.getProperty("jri.ignore.ule"))) {
			String[] args = new String[1];
			args[0] = "--vanilla";
			re = new Rengine(args, false, null);
			log.trace("Rengine.versionCheck() = " + Rengine.versionCheck());

			// get R's working directory and R source file (as canonical paths)
			PathMatchingResourcePatternResolver pmr = new PathMatchingResourcePatternResolver();
			Resource[] resources;
			try {
				resources = pmr.getResources(classpathRodaR);
				if (resources.length == 1) {
					File rFile = resources[0].getFile();
					rSourceFilename = rFile.getCanonicalPath();
					rWorkingDirectory = rFile.getCanonicalFile().getParent();

					log.trace("R Source Filename: " + rSourceFilename);
					log.trace("R Working Directory: " + rWorkingDirectory);
				} else {
					log.fatal("roda.R : ambiguous identification");
				}
			} catch (IOException e) {
				log.fatal("roda.R : not found", e);
			}
		}
	}

	@Override
	public void stop() {
		log.trace("stop()");
		if (re != null) {
			re.end();
			re = null;
		}
	}

	@Override
	public boolean isRunning() {
		return (re != null);
	}

	@Override
	public int getPhase() {
		return Integer.MIN_VALUE;
	}

	@Override
	public boolean isAutoStartup() {
		return true;
	}

	@Override
	public void stop(Runnable callback) {
		log.trace("stop(callback)");

		stop();

		// Our Stop/Shutdown is complete.
		// Regular shutdown will continue.
		callback.run();
	}
}
