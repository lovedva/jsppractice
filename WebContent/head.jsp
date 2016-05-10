<%@ page import="dto.*"%>
<!--<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">-->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dropdowns-enhancement.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/button.css" rel="stylesheet">
<link href="css/head.css" rel="stylesheet">
</head>
<body>


	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top ">
	
			<a class="navbar-brand" href="index.jsp">Project:BBS</a>
		
		
		<!-- 折叠内容-->
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <!-- 折叠内容-->

		<div id="navbar" class="navbar-collapse collapse">


			<%
				//判断是否登录
				User user = (User) request.getSession().getAttribute("user");
				if (user != null) {
			%>
			
			   <div class=" navbar-right ">
                <!--if admin or master
                <div class="navbar-text " style="margin-right: 0px; ">
                    <a href="#" class="navbar-link">Dashboard</span></a>

                </div>
                -->
                 <div class="navbar-text " style="margin-right: 0px; ">
                    <a href="#" class="navbar-link"><%=user.getName()%><span class="badge"></span></a>

                </div>
                <div class="navbar-text " style="margin-right: 40px; ">

                    <a href="actions/dologout.jsp" class="navbar-link">Log out</a>
                </div>

            </div>
			
	
				<%
					} else { //未登录显示登录/注册提示
				%>
				<div class="navbar-form navbar-right ">
					<div class="btn-group">
						<form action="<%=request.getContextPath()%>/actions/dologin.jsp"
							method="post" name="LoginForm">
							<button data-toggle="dropdown"
								class="btn btn-success dropdown-toggle" data-placeholder="false">
								Login <span class="caret"></span>
							</button>
							<ul class="dropdown-menu noclose">

								<li><div class="col-md-9">
										<h3
											style="font-size: 20px; margin-left: -5px; margin-top: 4px;">Login</h3>
									</div></li>
								<li>
									<div class="input-group navdropdownform ">
										<div class="input-group-addon">
											<span class="icon-user"></span>
										</div>
										<div>
											<input type="text" class="form-control" id="InputUsername1"
												placeholder="Username" name="username">
										</div>

									</div>
								</li>
								<li>
									<div class="input-group navdropdownform">
										<div class="input-group-addon">
											<span class="icon-key"></span>
										</div>
										<input type="password" class="form-control "
											id="InputPassword1" placeholder="Password" name="password">
									</div>
								</li>
								<input class="btn btn-success navdropdownbtn" type="submit"
									value="Login">
									<input type="hidden" name="redirecturl" value=<%=request.getRequestURL() %>>
								<!--  Login</button>-->
								<a href="#" style="margin-left: 1px; vertical-align: bottom">Forget
									password?</a>
							</ul>
						</form>
					</div>


					<div class="btn-group" style="margin-right: 10px; margin-left: 5px">
						<form action="<%=request.getContextPath()%>/actions/dosignup.jsp"
							method="post" name="LoginForm">
							<button data-toggle="dropdown"
								class="btn btn-info dropdown-toggle" data-placeholder="false">
								Sign up <span class="caret"></span>
							</button>
							<ul class="dropdown-menu noclose">

								<li><div>
										<h3
											style="font-size: 20px; margin-left: 10px; margin-top: 4px;">Create
											an account</h3>
									</div></li>

								<li role="separator" class="divider"></li>

								<li>
									<div class="form-group navdropdownform2">

										<label for="exampleInputEmail1">Email address</label> <input
											type="text" class="form-control " id="exampleInputEmail1"
											placeholder="Email" name="email">

									</div>
								</li>
								<li><div class="form-group  navdropdownform2 ">
										<label for="Username">Username</label> <input type="text"
											placeholder="Username" id="Username" class="form-control" name="username">
									</div></li>
								<li>
									<div class="form-group  navdropdownform2 ">
										<label for="signuppsw">Password</label> <input type="password"
											class="form-control " id="signuppsw" placeholder="Password" name="password">
									</div>

								</li>
								<li><div class="form-group  navdropdownform2 ">
								<fieldset disabled>
                                          <label for="signuppswrp">Input password again</label> <input
											type="password" class="form-control  " id="signuppswrp"
											placeholder="Password">
                                   </fieldset>
                                          </div>
                                          </li>
								<li role="separator" class="divider"></li>
								<button type="submit" class="btn btn-info navdropdownbtn2">Sign up</button>
							</ul>
						</form>
					</div>
					<%
						}
					%>
				</div>
			</div>
			<!--collapse here-->
		</nav>
	</div>