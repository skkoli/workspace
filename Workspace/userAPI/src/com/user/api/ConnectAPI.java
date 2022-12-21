package com.user.api;







import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


import com.customLog.Logger;





@Path("/userapi")
public class ConnectAPI {
	//login Details
	

	// user master
			@POST
			@Path("/insertUpdateuser")
			@Produces(MediaType.TEXT_PLAIN)
			@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
			public int insertUpdateuser(
					@FormParam("user_name") String user_name, 
					@FormParam("login_id") String login_id,
					 @FormParam("password")String password,
					@FormParam("email_id") String email_id,
					@FormParam("user_id") int user_id,
					@FormParam("flag") int flag) {
				ConnectDataBean bean = null;
				int beanData = 0;
				try {
					Logger.log("IPD", "user_name:: " + user_name);
					bean = new ConnectDataBean();
					beanData = bean.insertUpdateuser(user_name, login_id,password, email_id,  user_id, flag);
					Logger.log("IPD", "beandata:: " + beanData);
					if (beanData > 0) {
					}
				} catch (Exception e) {
					System.out.println(e);
					Logger.log("IPD", e);
				}
				return beanData;
			}	
			
			@POST
			@Path("/getuser")
			@Produces(MediaType.TEXT_PLAIN)
			@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
			public String getuser() {
				ConnectDataBean bean = null;
				String beanData = null;
				try {
					bean = new ConnectDataBean();
					beanData = bean.getuser().toString();
				} catch (Exception e) {
					System.out.println(e);
					Logger.log("IPD", e);
				}
				return beanData;
			}
			
			//login Details
			@POST
			@Path("/get_login_User")
			@Produces(MediaType.TEXT_PLAIN)
			@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
			public String get_login_User() {
				ConnectDataBean bean = null;
				String beanData = null;
				try {
					bean = new ConnectDataBean();
					beanData = bean.get_login_User().toString();
				} catch (Exception e) {
					System.out.println(e);
					Logger.log("IPD", e);
				}
				return beanData;
			}

}
