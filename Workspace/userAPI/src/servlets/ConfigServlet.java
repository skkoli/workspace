package servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.faces.VO_Face;

public class ConfigServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		try {
			String configFile = (String)getServletContext().getInitParameter("configFile");
			//String jbossHome=(String)System.getProperty("jboss.server.home.url");
			String catalinaBaseURL = (String)System.getProperty("catalina.home");
			String absoluteConfigFile = catalinaBaseURL.concat(configFile);
			System.out.println("configFile : "+configFile);
			System.out.println("catalinaBaseURL : "+catalinaBaseURL);
			System.out.println("absoluteConfigFile : "+absoluteConfigFile);
			
			VO_Face.createStartupConfig(absoluteConfigFile);
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
