
<head>

<meta charset="utf-8" />
<title>Login Page</title>




</head>

<style>



</style>
<!--end::Head-->
<!--begin::Body-->
<body >
	<!--begin::Main-->

	<div class="d-flex flex-column flex-root">
		<!--begin::Login-->
		<div class="login login-3 login-signin-on d-flex flex-row-fluid" id="kt_login">
			<div
				class="d-flex flex-column flex-lg-row flex-row-fluid text-center">
			
				<div
					class="d-flex w-100 flex-center p-15 position-relative overflow-hidden">
					<div class="bg-dark-o-90 rounded " style="width:25%">
						<div class="login-signin text-white">
							<div class="mb-10  ">
								 <h3>  &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h3> 
								<h3>  WelCome To login</h3> 
							</div>
							<form class="form"  id="kt_login_signin_form">
								<div class="form-group ml-5 mr-5" style="width:90%">
									<input class="form-control h-auto text-white placeholder-white  bg-dark-o-90 rounded-pill border-0 py-4 px-8 mb-5" id="username" type="text" placeholder="username" name="username" autocomplete="off" />
								</div>
								<div class="form-group ml-5 mr-5" style="width:90%">
									<input class="form-control h-auto text-white placeholder-white  bg-dark-o-90 rounded-pill border-0 py-4 px-8 mb-5" id="password" type="password" placeholder="Password" name="password" autocomplete="off"/>
								</div>
								
								<div class="form-group d-flex flex-wrap justify-content-between align-items-center px-8">
									<div class="checkbox-inline   ">
										<label class="checkbox checkbox-outline checkbox-white text-white m-0 ml-10 ">
										<input type="checkbox" name="remember" />
										<span></span>Remember me </label>
									
									</div>

                     
						
								<div class="form-group text-center mt-10">
									<button id="kt_login_submit" class="btn btn-pill btn-outline-white font-weight-bold opacity-90 px-15 py-3">Sign In</button>
								</div>
								
								 <a href="user-master.jsp" class="mb-5">New Registration</a>
							</form>
							<div class="ml-15  " style="width:300px">
								
								
							</div>
							<div class="mb-20  ">
								 <h3>  &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h3> 
								
							</div>
						</div>
						</div>
				</div>
				<!--end:Content-->
			</div>
		</div>
		<!--end::Login-->
	</div>
	<!--end::Main-->
	
	<script type="text/javascript">

		$('#kt_login_submit').click(function() {
			
					var login_id = $('#username').val();
					var password = $('#password').val();
		            
					$.ajax({
						url : base + "/userAPI/userapi/get_login_User",
						type : "post",
						dataType : "json",
						async : false,
						data : {"flag":1,},
						success:function(data)
					     {
							const row = data.find(d => d.login_id == login_id &&  d.password == password );
							
							if(row != null){
									var url = "/userloginweb/form/home/index.jsp"  + '?login_id=' + login_id;  
								Swal.fire({
							        title: "WelCome!",
							        text: "Have A Good Day " + row.user_name,
							        icon: "success",
							        timer: 3000,
							        onOpen: function() {
							            Swal.showLoading()
							        }
							    }).then(function(result) {
							        if (result.dismiss === "timer") {
							        	window.location.assign(url);
							        }
							    })
					 }else{
						Swal.fire({
					       title: "Wrong!",
					       text: "Please Enter Correct Credentials",
					       icon: "danger",
					       timer: 3000,
					       onOpen: function() {
					           Swal.showLoading()
					       }
					   }).then(function(result) {
					       if (result.dismiss === "timer") {
					       	window.location.reload();
					       }
					   })
						
					}
					} 
					});	 
					
		             
		             
		             
				});
	</script>
</body>

</html>
