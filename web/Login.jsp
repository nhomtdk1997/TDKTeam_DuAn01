<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <%@include file="includes/headtag.jsp" %>
</head>

<body>
    <header id="navigation" class="navbar-fixed-top">
        <div class="container">

            <div class="navbar-header">
                <!-- responsive nav button -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- /responsive nav button -->

                <!-- logo -->
                <h1 class="navbar-brand">
                    <a href="#body">
                        <img src="img/logo.png" alt="TDKTeam Logo">
                    </a>
                </h1>
                <!-- /logo -->
            </div>
            
            <!-- main nav -->
            <nav class="collapse navigation navbar-collapse navbar-right" role="navigation">
                <ul id="nav" class="nav navbar-nav">
                    <li class="current"><a href="index.jsp">Home</a></li>
                    <li><a href="#contact">Đăng Nhập</a></li>
                </ul>
            </nav>
            <!-- /main nav -->
            
        </div>
    </header>
    
    <!-- include slider -->
    <%@include file="includes/slider.jsp" %>
    <!-- end include slider -->
    
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="section-title text-center wow fadeInDown">
                    <h2>ĐĂNG NHẬP</h2>
                </div>
                <div class="col-md-6 col-sm-9 wow fadeInLeft">
                    <div class="contact-form clearfix">
                        <form action="LoginServlet" method="post">
                            <div class="input-field">
                                <input type="text" class="form-control" name="username" placeholder="Your Email or Username" required="">
                            </div>
                            <div class="input-field">
                                <input type="password" class="form-control" name="pwd" placeholder="Password" required="">
                            </div>
                            <div class="inputdn">
                                <input type="submit" class="btn btn-blue pull-right" value="ĐĂNG NHẬP" id="msg-submit">
                            </div>
                            <div class="inputdk">
                                <a href="Register.jsp">
                                    <input type="button"  class="btn btn-blue pull-right" value="ĐĂNG KÝ" id="msg-submit">  
                                </a>
                            </div>
                        </form>
                    </div> <!-- end .contact-form -->
                </div>
            </div>
    </section>

    <!-- include footer -->
    <%@include file="includes/footer.jsp" %>
    <!-- end include footer -->

</body>
</html>
