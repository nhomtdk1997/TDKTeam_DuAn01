<%-- 
    Document   : PageError
    Created on : Dec 24, 2016, 5:28:38 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>

        <!--- basic page needs ================================================== -->
        <meta charset="utf-8">
        <title>Error page</title>
        <meta name="description" content="">  
        <meta name="author" content="">

        <!-- mobile specific metas ================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

        <!-- CSS ================================================== -->
        <link rel="stylesheet" href="css/erbase.css">  
        <link rel="stylesheet" href="css/ermain.css">
        <link rel="stylesheet" href="css/ervendor.css">     

        <!-- script ================================================== -->
        <script src="js/modernizr.js"></script>

        <!-- favicons ================================================== -->
        <link rel="icon" type="image/png" href="img/logo/tablogo.png">

    </head>

    <body>

        <!-- header ================================================== -->
        <header class="main-header">
            <div class="row">
                <div class="logo">
                    <a href="index.jsp">Quatro</a>
                </div>   		
            </div>   

            <a class="menu-toggle" href="#"><span>Menu</span></a>	
        </header> <!-- /header -->

        <!-- navigation ================================================== -->
        <nav id="menu-nav-wrap">

            <h5>trang web</h5>   	
            <ul class="nav-list">
                <li><a href="index.jsp" title="">Trang chủ</a></li>
                <li><a href="index.jsp#timve" title="">Tìm vé</a></li>
                <li><a href="index.jsp#khuyenmai" title="">Khuyến mãi</a></li>
                <li><a href="index.jsp#tintuc" title="">Tin tức</a></li>
                <li><a href="index.jsp#service" title="">Điều khoản</a></li>					
                <li><a href="/index.jsp#contact" title="">Phản hồi</a></li>					
            </ul>

            <h5>Giới thiệu</h5>  
            <p>TDK Team xin chào và cảm ơn tất cả các bạn đã ghé thăm Website bán vé máy bay online của nhóm!</p>

        </nav>

        <!-- main content ================================================== -->
        <main id="main-404-content" class="main-content-static">

            <div class="content-wrap">

                <div class="shadow-overlay"></div>

                <div class="main-content">
                    <div class="row">
                        <div class="col-twelve">

                            <h1 class="kern-this">404 Error!</h1>
                            <p>
                                Trang này yêu cầu bạn phải đăng nhập!<br>
                                Có thể bạn đã chưa đăng nhập hoặc quyền hạn của bạn không thể xem trang này<br>
                                Bạn có thể quay trở lại trang trước hoặc quay về trang chủ theo liên kết dưới trang
                            </p>

                            <div class="search" style="display: none;">
                                <form>
                                    <input type="text" id="s" name="s" class="search-field" placeholder="Type and hit enter …">
                                </form>
                            </div>	   			

                        </div> <!-- /twelve --> 		   			
                    </div> <!-- /row -->    		 		
                </div> <!-- /main-content --> 

                <footer>
                    <div class="row">

                        <div class="col-seven tab-full social-links pull-right">
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>

                        <div class="col-five tab-full bottom-links">
                            <ul class="links">
                                <li><a href="javascript:history.go(-1)">&laquo; Trang trước</a> / <a href="index.jsp">Trang chủ &raquo;</a></li>
                                <li><a href="mailto:duongnxpk00662@fpt.edu.vn">Báo cáo lỗi!</a></li>			                    
                            </ul>

                            <div class="credits">
                                <p>Copyright © 2016. All right reserved - <a href="#">TDK Team</a></p>
                            </div>
                        </div>   		   		

                    </div> <!-- /row -->    		  		
                </footer>

            </div> <!-- /content-wrap -->

        </main> <!-- /main-404-content -->

        <div id="preloader"> 
            <div id="loader"></div>
        </div> 

        <!-- Java Script ================================================== --> 
        <script src="js/jquery-2.1.3.min.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/ermain.js"></script>

    </body>
</html>