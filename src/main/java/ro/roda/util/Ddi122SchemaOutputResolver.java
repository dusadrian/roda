package ro.roda.util;

import java.io.File;
import java.io.IOException;

import javax.xml.bind.SchemaOutputResolver;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamResult;

public class Ddi122SchemaOutputResolver extends SchemaOutputResolver {

	public Result createOutput(String namespaceURI, String suggestedFileName) throws IOException {
		File file = new File(suggestedFileName);
		StreamResult result = new StreamResult(file);
		result.setSystemId(file.toURI().toURL().toString());
		return result;
	}

}
