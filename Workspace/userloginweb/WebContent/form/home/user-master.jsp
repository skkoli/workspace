<%@page import="com.config.FaceConfig"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.util.*,com.config.ConnectionFactory,com.config.I18nUtility,com.customLog.Logger,com.faces.VO_Face"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
String dbConnVar = "IPD";
try {
%>
<html lang="en">
<!--begin::Head-->
<head>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
table, th, td {
	border: 1px solid white;
	border-collapse: collapse;
	background-color: #ffffff;
}
table.a {
	table-layout: auto;
	width: 100%;
}
::placeholder {
	color: white;
}
</style>
</head>

<body>
<div class="container d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
							<!--begin::Info-->
							<div class="d-flex align-items-center flex-wrap">
								<!--begin::Daterange-->
								<a class="btn btn-bg-white font-weight-bold  my-2 my-lg-0"
									data-toggle="tooltip"> <span
									class=" text-dark font-weight-boldest mr-2"
									style="font-size: 16px">User Master</span>

								</a>
							</div>
							
							<div class="d-flex align-items-center flex-wrap">
								<!--begin::Daterange-->
								<a class="btn btn-bg-white font-weight-bold  my-2 my-lg-0"
									id="kt_dashboard_daterangepicker" data-toggle="tooltip"
									title="Select dashboard daterange" data-placement="left"> <span
									class="text-muted font-weight-bold mr-2"
									style="font-size: 16px" id="kt_dashboard_daterangepicker_title">Date
										:</span> <!-- <span
									class="text-primary font-weight-bolder" 
									id="kt_dashboard_daterangepicker_date" type="date">Aug 16</span> -->
									<input type="date" id="kt_dashboard_daterangepicker_date"
									style="border: none"></input>
								</a>
							</div>
							
						</div>
					</div>
					
					<div class="d-flex flex-column-fluid">
						<!--begin::Container-->
						<div class="container">
							<div class="example-preview">
								<div class="card card-custom">
									<form class="form" id="kt_form_1">
										<div class="card-body">
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>User Name:</label><span class="text-danger"
															id="type">*</span> <input type="text" name="user_name_1"
															id="user_name_1" class="form-control form-control-solid"
															placeholder="Enter User Name" required autocomplete="off"/>
													</div>
												</div>
												<div class="col-xl-6">
													<div class="form-group">
														<label>Login Id:</label><span class="text-danger"
															id="type">*</span> <input type="text" name="login_id"
															id="login_id" class="form-control form-control-solid"
															placeholder="Enter Login Id" required autocomplete="off"/>
													</div>
												</div>
											</div>
												<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Password:</label><span class="text-danger"
															id="type">*</span> <input type="password" name="Password"
															id="password" class="form-control form-control-solid"
															placeholder="Enter Password" required autocomplete="off"/>

													</div>
												</div>
												<div class="col-xl-6">
													<div class="form-group">
														<label>Confirm Password:</label><span class="text-danger"
															id="type">*</span> <span id='message1'></span><input
															type="text" name="confirm_password" id="confirm_password"
															class="form-control form-control-solid"
															placeholder="Enter Confirm Password" required autocomplete="off"/>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xl-6">
													<div class="form-group">
														<label>Email Id:</label><span class="text-danger"
															id="type">*</span> <input type="text" name="email_id"
															id="email_id" class="form-control form-control-solid"
															placeholder="Enter Email Id" required autocomplete="off"/>
													</div>
												</div>
												
									</div>
										</div>
										<div class="text-center">
											<button type="submit" id="adduser"
												class="btn btn-primary mr-2">Submit</button>
											<button type="submit" id="updateuser"
												class="btn btn-primary mr-2">Update</button>
											<button type="button" class="btn btn-primary mr-2"
												id="cancel">Cancel</button>
										</div>
									</form>
									<!--end::Form-->
								</div>
							</div>
							<br />
							<div class="example-preview">
								<div class="card card-custom">
									<br />
									<div class="input-icon ml-10" style="width: 30%;">
										<input type="text" class="form-control form-control-solid"
											placeholder="Search..." id="txt_searchall1" /> <span>
											<i class="flaticon2-search-1 text-muted"></i>
										</span>
									</div>
									<br />
									<table data-toggle="table" class='a'
										data-classes="table table-hover table-condensed "
										data-striped="true" data-sort-name="Quality"
										data-sort-order="desc" data-pagination="false"
										data-scroll="false" data-height=550 id="table-id">
										<thead>
											<tr>
												<th class="col-sm-2 text-center" data-field="sr-no"
													data-sortable="true">Sr No</th>
												<th class="col-sm-2 text-center" data-field="user-name"
													data-sortable="true">User Name</th>
												<th class="col-sm-3 text-center" data-field="login-idx"
													data-sortable="true">Login Id</th>
											<th class="col-sm-2 text-center" data-field="action"
													data-sortable="true">Action</th>
											</tr>
										</thead>
										<tbody class="data">
										</tbody>
									</table>
									<!--end::Form-->
								</div>
							</div>
							<!--end::Row-->
							<div class="alert alert-success  " role="alert"
								id="success_alert">
								<div class="alert-text">
									<span id="success_msg"></span>
								</div>
							</div>
							<div class="alert alert-danger " role="alert" id="danger_alert">
								<div class="alert-text">
									<span id="danger_msg"></span>
								</div>
							</div>
							<div class="alert alert-warning " role="alert" id="warning_alert">
								<div class="alert-text">
									<span id="warning_msg"></span>
								</div>
							</div>
						</div>
					</div>
					

	
	<script type="text/javascript">
	
	var basePath='<%=basePath%>';    
	var base='<%=base%>';  
	
	
	
	$('#updateuser').hide();
	$("#adduser").show();
	//matching password 
	$('#password, #confirm_password').on('keyup', function () {
		  if ($('#password').val() == $('#confirm_password').val()) {
		    $('#message1').html('Matched').css('color', 'green');
		  } else 
		    $('#message1').html('Not Matched').css('color', 'red');
		});

	
	
		
	
	
	
$('#adduser').click(function() {
							var user_name = $('#user_name_1').val();
							var email_id = $('#email_id').val();
							var login_id = $('#login_id').val();
							var password = $('#password').val();
						var flag = 1; // Addition
						if(user_name != "" ){
							$.ajax({
								url : base +"/userAPI/userapi/insertUpdateuser",
								type : "post",
								dataType : "json",
								async : false,
								data : {
									"user_name"   : user_name,
                                    "email_id"    : email_id,
                                    "login_id"    : login_id,
                                    "password"    : password,
									"flag"        : flag
								},
								error : function(xhr) {
									var msg = "Data insertion failed Error : "
											+ xhr.status
											+ " "
											+ xhr.statusText;
									 $('#warning_msg').text(msg);
									 $('#warning_alert').addClass("show");
							           $('#warning_alert').removeClass("hide");
							           $('#warning_alert').addClass("showAlert");
							           setTimeout(function(){
							             $('#warning_alert').removeClass("show");
							             $('#warning_alert').addClass("hide");
							           },2000);
								},
								success : function(response) {
									if (response != null) {

										if (response >= 1) {

											var msg = "user Data inserted Successfully.";
											 $('#success_msg').text(msg);
											 $('#success_alert').addClass("show");
									           $('#success_alert').removeClass("hide");
									           $('#success_alert').addClass("showAlert");
									           setTimeout(function(){
									             $('#success_alert').removeClass("show");
									             $('#success_alert').addClass("hide");
									             window.location.reload();
									           },2000);
										} 
									}
								}
							});
						}
						})
		"use strict";
var user_id;
var html = "";
$.ajax({
	url : base +"/userAPI/ipdapi/getuser",
	type : "post",
	dataType : "json",
	async : false,
	data : {"user_id": user_id},
	success:function(data)
	{
		const row = data.find(d => d.user_id == user_id);
		data.forEach((row)=> {
			html +="<tr id= tr-id-2 class= tr-class-2>"
			html += "<td>"+row.user_id+"</td>"; 
			html += "<td>"+row.user_name+"</td>";
	        html += "<td>"+row.login_id+"</td>";
	     
     	    html += '<td><a href="javascript:update('+row.user_id+');" class="btn_user btn-sm btn-clean btn-icon mr-2" title="Edit details"><span class="svg-icon svg-icon-md"><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M8,17.9148182 L8,5.96685884 C8,5.56391781 8.16211443,5.17792052 8.44982609,4.89581508 L10.965708,2.42895648 C11.5426798,1.86322723 12.4640974,1.85620921 13.0496196,2.41308426 L15.5337377,4.77566479 C15.8314604,5.0588212 16,5.45170806 16,5.86258077 L16,17.9148182 C16,18.7432453 15.3284271,19.4148182 14.5,19.4148182 L9.5,19.4148182 C8.67157288,19.4148182 8,18.7432453 8,17.9148182 Z" fill="#B5B5C3" fill-rule="nonzero" transform="translate(12.000000, 10.707409) rotate(-135.000000) translate(-12.000000, -10.707409) "/><rect fill="#000000" opacity="0.3" x="5" y="20" width="15" height="2" rx="1"/></g></svg></span>'
        	       	+ '<a href="javascript:deleteById('+row.user_id+');" class="btn_user btn-sm btn-clean btn-icon" title="Delete"><span class="svg-icon svg-icon-md"> <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 24 24" version="1.1"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><rect x="0" y="0" width="20" height="20"/><path d="M6,8 L6,20.5 C6,21.3284271 6.67157288,22 7.5,22 L16.5,22 C17.3284271,22 18,21.3284271 18,20.5 L18,8 L6,8 Z" fill="#B5B5C3" fill-rule="nonzero"/>\ <path d="M14,4.5 L14,4 C14,3.44771525 13.5522847,3 13,3 L11,3 C10.4477153,3 10,3.44771525 10,4 L10,4.5 L5.5,4.5 C5.22385763,4.5 5,4.72385763 5,5 L5,5.5 C5,5.77614237 5.22385763,6 5.5,6 L18.5,6 C18.7761424,6 19,5.77614237 19,5.5 L19,5 C19,4.72385763 18.7761424,4.5 18.5,4.5 L14,4.5 Z" fill="#000000" opacity="0.3"/></g> </svg></span></a></td>';
	        html +="</tr>"
		});
		 $(".data").html(html);
	}
});	

$(document).ready(function (){
	   var table = $('#table-id').DataTable();
	});

		 
function update(user_id){
			 $(window).scrollTop(0);
			 $('.btn_user').hide();
				$('#updateuser').show();
				$("#adduser").hide();
				$.ajax({
			        type:"POST",
			        dataType: "json",
			        data:{"user_id": user_id},
					async : false,
					url : base +"/ipdAPI/ipdapi/getuser",
			        success:function(data)
			        {
			            const row = data.find(d => d.user_id ==user_id);
			            $("#user_name_1").val(row.user_name);
			        	$("#email_id").val(row.email_id);
			        	
			        	$("#login_id").val(row.login_id);
			        	$("#password").val(row.password);
			        	$("#confirm_password").val(row.password);
			        	
			        }
			     });
$('#updateuser').click(function() {
							var user_name = $('#user_name_1').val();
							var email_id = $('#email_id').val();
							
							var login_id = $('#login_id').val();
							var password = $('#password').val();
							var confirm_password = $('#confirm_password').val();
							var role_type = $('#role_type').val();
							
							var flag = 2; // Addition
							if(confirm_password == password && confirm_password != "" ){
							$.ajax({
								url : base +"/ipdAPI/ipdapi/insertUpdateuser",
										type : "post",
										dataType : "json",
										async : false,
										data : {
											"user_name" : user_name,
											"email_id" : email_id,
											"login_id" : login_id,
											"password" : confirm_password,
		                                    "user_id": user_id,
											"flag" : flag
											
										},
										error : function(xhr) {
											var msg = "(Data updation failed. Error : "
													+ xhr.status
													+ " "
													+ xhr.statusText;
											 $('#warning_msg').text(msg);
											 $('#warning_alert').addClass("show");
									           $('#warning_alert').removeClass("hide");
									           $('#warning_alert').addClass("showAlert");
									           setTimeout(function(){
									             $('#warning_alert').removeClass("show");
									             $('#warning_alert').addClass("hide");
									           },2000);
										},
										success : function(response) {
											if (response != null) {

												if (response >= 1) {

													var msg = "User Data updated Successfully.";
													 $('#success_msg').text(msg);
													 $('#success_alert').addClass("show");
											           $('#success_alert').removeClass("hide");
											           $('#success_alert').addClass("showAlert");
											           setTimeout(function(){
											             $('#success_alert').removeClass("show");
											             $('#success_alert').addClass("hide");
											             window.location.reload();
											           },2000);
												} 
											}
										}
								   
									});
							}
						})
		 }
	"use strict";
$('#cancel').click(function() {		
				window.location.reload();
				})
		 
		// Delete data by user_id
function deleteById(user_id){
	Swal.fire({
        title: "Are you sure?",
        text: "You want to Delete Data!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Yes, delete it!",
        cancelButtonText: "No, cancel!",
        reverseButtons: true
    }).then(function(result) {
        if (result.value) {
			$.ajax({
				url : base + "/userAPI/userapi/insertUpdateuser",
				type : "post",
				dataType : "json",
				async : false,
				data : {
					"user_id" : user_id,
					"flag" : 3
				},
				error : function(xhr) {
					var msg = "Data deletion failed. Error : "
							+ xhr.status
							+ " "
							+ xhr.statusText;
					 $('#warning_msg').text(msg);
					 $('#warning_alert').addClass("show");
			           $('#warning_alert').removeClass("hide");
			           $('#warning_alert').addClass("showAlert");
			           setTimeout(function(){
			             $('#warning_alert').removeClass("show");
			             $('#warning_alert').addClass("hide");
			           },2000);
				},
				success : function(response) {
					if (response != null) {

						if (response >=1) {

							var msg = "User Data deleted Successfully.";
							 $('#danger_msg').text(msg);
							 $('#danger_alert').addClass("show");
					           $('#danger_alert').removeClass("hide");
					           $('#danger_alert').addClass("showAlert");
					           setTimeout(function(){
					             $('#danger_alert').removeClass("show");
					             $('#danger_alert').addClass("hide");
					           },2000);
							location.reload(true);
						} 
					}
				}
			});
			} else if (result.dismiss === "cancel") {
				Swal.fire(
			            "Cancelled",
			            "Your Data is safe :)",
			            "error"
			        )
			}
			});
			}
$(document).ready(function(){
			  // Search all columns
			  $('#txt_searchall1').keyup(function(){
			    // Search Text
			    var search = $(this).val();
			    // Hide all table tbody rows
			    $('table tbody tr').hide();
			    // Count total search result
			    var len = $('table tbody tr:not(.notfound) td:contains("'+search+'")').length;
			    if(len > 0){
			      // Searching text in columns and show match row
			      $('table tbody tr:not(.notfound) td:contains("'+search+'")').each(function(){
			        $(this).closest('tr').show();
			      });
			    }else{
			      $('.notfound').show();
			    }
			  });
			});
		$.expr[":"].contains = $.expr.createPseudo(function(arg) {
			   return function( elem ) {
			     return $(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
			   };
			});
		
document.addEventListener('keypress', function (e) {
		    if (e.keyCode === 13 || e.which === 13) {
		        e.preventDefault();
		        return false;
		    }
		});
	</script>
</body>
</html>

<%
} catch (Exception e) {
Logger.log(dbConnVar, "" + e);
}
%>