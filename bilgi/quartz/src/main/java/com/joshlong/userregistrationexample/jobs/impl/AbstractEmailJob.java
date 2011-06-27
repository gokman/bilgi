package com.joshlong.userregistrationexample.jobs.impl;

import com.joshlong.userregistrationexample.jobs.AbstractJob;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

abstract public class AbstractEmailJob extends AbstractJob {

    private static Logger log = Logger.getLogger(AbstractEmailJob.class);

    public static String PROPERTIES_KEY = "properties";
    public static String TXT_KEY = "txt";
    public static String HTML_KEY = "html";

    public Map<String, String> loadTemplate(String templateNameRoot) throws IOException {

        String propertiesKey = PROPERTIES_KEY;
        String txtKey = TXT_KEY;
        String htmlKey = HTML_KEY;

        Map<String, String> params = new HashMap<String, String>();

        for (String suffix : new String[]{txtKey, htmlKey, propertiesKey}) {

            String tplName = "templates/" + templateNameRoot + "." + suffix;
            log.debug("Trying to load template '" + tplName + "'");
            InputStream inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(tplName);
            if (null == inputStream) continue;
            String content = StringUtils.defaultString(IOUtils.toString(inputStream));
            IOUtils.closeQuietly(inputStream);

            params.put(suffix, content);
        }

        Properties properties = new Properties();
        InputStream inp = IOUtils.toInputStream(params.get(propertiesKey));
        properties.load(inp);
        IOUtils.closeQuietly(inp);
        params.remove(propertiesKey);
        List<String> propertyNames = Collections.list((Enumeration<String>) properties.propertyNames());

        String html = params.get(htmlKey);
        String txt = params.get(txtKey);

        for (String propertyName : propertyNames)
            params.put(propertyName, properties.getProperty(propertyName));

        params.put(htmlKey, html);
        params.put(txtKey, txt);
        return params;
    }
}
