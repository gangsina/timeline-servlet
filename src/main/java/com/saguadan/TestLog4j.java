package com.saguadan;

import com.bentengwu.utillib.file.PathUtil;
import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

/**
 * @Author thender email: bentengwu@163.com
 * @Date 2019/6/25 14:40.
 */
public class TestLog4j {
    static Logger logger = LoggerFactory.getLogger(TestLog4j.class);
    public static void main(String args[]) {
        PropertyConfigurator.configure(PathUtil.getDir() + File.separator +"src/main/resources/log4j.properties");

        logger.debug("Here is some DEBUG");
        logger.info("Here is some INFO");
        logger.warn("Here is some WARN");
        logger.error("Here is some ERROR");
    }
}
