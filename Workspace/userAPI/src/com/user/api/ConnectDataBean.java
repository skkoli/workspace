package com.user.api;

import java.sql.CallableStatement;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Types;

import javax.servlet.annotation.MultipartConfig;


import org.json.JSONArray;
import org.json.JSONObject;

import com.config.ConnectionFactory;
import com.customLog.Logger;

@MultipartConfig
public class ConnectDataBean {

	private ConnectionFactory cf = null;
	String dbConnVar = "user";

	public ConnectDataBean() {
		cf = new ConnectionFactory(dbConnVar);
	}

	
	
	
	// user master
		public int insertUpdateuser(String user_name, String login_id, String password, String email_id,
				
				 int user_id, int flag) {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;
			int result = 0;
			try {
				System.out.println("user name in bean  " + user_name);
				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_crud_user(?,?,?,?,?,?)}");
				cs.registerOutParameter(1, Types.INTEGER);
				cs.setString(2, user_name);
				cs.setString(3, login_id);
				cs.setString(4, password);
				cs.setString(5, email_id);
				cs.setInt(6, user_id);
				cs.setInt(7, flag);
				cs.execute();
				result = cs.getInt(1);
			} catch (Exception e) {
				Logger.log(dbConnVar, e);
			} finally {
				try {
					if (con != null) {
						cf.freeConnection(con);
						con.close();
					}
					if (cs != null) {
						cs.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e1) {
					Logger.log(dbConnVar, e1);
				}
			}
			return result;
		}
		
		
		public JSONArray getuser() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;
			JSONArray jarr = null;
			JSONObject finaljson = null;
			try {
				jarr = new JSONArray();
				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_user_details(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);
				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);
				while (rs.next()) {
					JSONObject resultjson = new JSONObject();
					resultjson.put("user_id", rs.getInt(1));
					resultjson.put("user_name", rs.getString(2));
					resultjson.put("login_id", rs.getString(3));
					resultjson.put("password", rs.getString(4));
					resultjson.put("email_id", rs.getString(5));
					
					jarr.put(resultjson);
				}
				finaljson = new JSONObject();
				finaljson.put("data", jarr);
			} catch (Exception e) {
				Logger.log(dbConnVar, e);
			} finally {
				try {
					if (con != null) {
						con.close();
					}
					if (cs != null) {
						cs.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e1) {
					Logger.log(dbConnVar, e1);
				}
			}
			return jarr;
		}

		
		public JSONArray get_login_User() {
			Connection con = null;
			CallableStatement cs = null;
			ResultSet rs = null;
			JSONArray jarr = null;
			JSONObject finaljson = null;
			try {
				jarr = new JSONArray();
				con = cf.getConnection();
				cs = con.prepareCall("{?=call fun_retrieve_login_user_details(?)}");
				cs.registerOutParameter(1, Types.OTHER);
				cs.setObject(2, rs);
				con.setAutoCommit(false); // without this the Result set is not returning
				cs.execute();
				rs = (ResultSet) cs.getObject(1);
				while (rs.next()) {
					JSONObject resultjson = new JSONObject();
					resultjson.put("user_id", rs.getInt(1));
					resultjson.put("user_name", rs.getString(2));
					resultjson.put("login_id", rs.getString(3));
					resultjson.put("email_id", rs.getString(4));
					resultjson.put("password", rs.getString(5));
					
					jarr.put(resultjson);
				}
				finaljson = new JSONObject();
				finaljson.put("data", jarr);
			} catch (Exception e) {
				Logger.log(dbConnVar, e);
			} finally {
				try {
					if (con != null) {
						con.close();
					}
					if (cs != null) {
						cs.close();
					}
					if (rs != null) {
						rs.close();
					}
				} catch (Exception e1) {
					Logger.log(dbConnVar, e1);
				}
			}
			return jarr;
		}

	
}