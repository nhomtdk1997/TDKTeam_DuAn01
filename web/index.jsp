<%-- 
    Document   : index
    Created on : Oct 12, 2016, 3:43:01 PM
    Author     : DuongNguyen
--%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <!-- Mobile Specific Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Always force latest IE rendering engine -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Meta Keyword -->
    <meta name="keywords" content="one page, business template, single page, onepage, responsive, parallax, creative, business, html5, css3, css3 animation">
    <!-- meta character set -->
    <meta charset="utf-8">

    <!-- Site Title -->
    <title>TDK_Team_Website Vé Máy Bay</title>
    <%@include file="includes/headtag.jsp" %>
    <%@include file="includes/popuplogin.jsp" %>
</head>

<body>
    <%@include file="includes/header.jsp" %>
    <%@include file="includes/slider.jsp" %>

    <!--
    #datve
    ========================== -->
    <section id="datve">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Tìm vé</h2>
                        <p>Tìm chuyến bay</p>
                    </div>
                </div>
            </div>
            <div class="row timvemotchang">
                <form action="TimChuyenBayServlet" method="post">
                    <div class="form-group col-md-12 modal-content formdatve">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Tìm vé một chặng</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row tu-den col-md-4">
                                <span id="idghichu">Điểm khởi hành<span class="required">*</span></span>
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <select name="Tu-vemotchang" class="selectpicker form-control" required="">
                                                <option disabled selected value> -- Chọn điểm khởi hành -- </option>
                                                <optgroup label="Miền Bắc">
                                                    <option>Hà Nội</option>
                                                    <option>Hải Phòng</option>
                                                    <option>Điện Biên</option>
                                                    <option>Đồng Hới</option>
                                                </optgroup>
                                                <optgroup label="Miền Trung">
                                                    <option>Buôn Mê Thuột</option>
                                                    <option>Chu Lai</option>
                                                    <option>Huế</option>
                                                    <option>Pleiku</option>
                                                    <option>Quy Nhơn</option>
                                                    <option>Thanh Hóa</option>
                                                    <option>TP. Vinh</option>
                                                    <option>Tuy Hòa</option>
                                                    <option>Đà Nẵng</option>
                                                </optgroup>
                                                <optgroup label="Miền Nam">
                                                    <option>Đà Lạt</option>
                                                    <option>Cà Mau</option>
                                                    <option>Côn Đảo</option>
                                                    <option>Cần Thơ</option>
                                                    <option>Nha Trang</option>
                                                    <option>Phú Quốc</option>
                                                    <option>Rạch Giá</option>
                                                    <option>TP. Hồ Chí Minh</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <span id="idghichu">Điểm đến<span class="required">*</span></span>
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <select name="Den-vemotchang" class="selectpicker form-control" required="">
                                                <option disabled selected value> -- Chọn điểm đến -- </option>
                                                <optgroup label="Miền Bắc">
                                                    <option>Hà Nội</option>
                                                    <option>Hải Phòng</option>
                                                    <option>Điện Biên</option>
                                                    <option>Đồng Hới</option>
                                                </optgroup>
                                                <optgroup label="Miền Trung">
                                                    <option>Buôn Mê Thuột</option>
                                                    <option>Chu Lai</option>
                                                    <option>Huế</option>
                                                    <option>Pleiku</option>
                                                    <option>Quy Nhơn</option>
                                                    <option>Thanh Hóa</option>
                                                    <option>TP. Vinh</option>
                                                    <option>Tuy Hòa</option>
                                                    <option>Đà Nẵng</option>
                                                </optgroup>
                                                <optgroup label="Miền Nam">
                                                    <option>Đà Lạt</option>
                                                    <option>Cà Mau</option>
                                                    <option>Côn Đảo</option>
                                                    <option>Cần Thơ</option>
                                                    <option>Nha Trang</option>
                                                    <option>Phú Quốc</option>
                                                    <option>Rạch Giá</option>
                                                    <option>TP. Hồ Chí Minh</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row ngay-di-ve col-md-4">
                                <span id="idghichu">Ngày khởi hành<span class="required">*</span></span>
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <input name="Ngaykhoihanh-motchang" type="date" class="ngaydi form-control" required="">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row col-md-4 soluonghk">
                                <span>Người lớn (>12 tuổi)<span class="required">*</span></span>
                                <div class="row">
                                    <div class="col-md-10">
                                        <div class="form-group">
                                            <select class="selectpicker form-control" required="">
                                                <option disabled selected value> -- Chọn số người -- </option>
                                                <option>1 người</option>
                                                <option>2 người</option>
                                                <option>3 người</option>
                                                <option>4 người</option>
                                                <option>5 người</option>
                                                <option>6 người</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span>Trẻ em (2<12 tuổi)<span class="required">*</span></span>
                                            <select class="selectpicker form-control">
                                                <option>0 người</option>
                                                <option>1 người</option>
                                                <option>2 người</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <span>Trẻ em (<2 tuổi)<span class="required">*</span></span>
                                            <select class="selectpicker form-control">
                                                <option>0 người</option>
                                                <option>1 người</option>
                                                <option>2 người</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btndatve btn btn-blue col-md-12">Tìm vé</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!--
    End #datve
    ========================== -->

    <!--
    #quotes
    ========================== -->
    <section id="quotes">
        <div class="container">
            <div class="row wow zoomIn">
                <div class="col-lg-12">
                    <div class="call-to-action text-center">
                        <p>Đặt vé trực tuyến dễ dàng và nhanh chóng với TDK Team</p>
                        <span><a href="#">Xem chi tiết tại đây!</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--
    End #quotes
    ========================== -->

    <!--
    #khuyenmai
    ========================== -->
    <section id="khuyenmai">
        <div class="container">
            <div class="row">

                <div class="section-title text-center wow fadeInUp">
                    <h2>Khuyến mãi</h2>    
                    <p>Thông tin khuyến mãi đặt biệt từ website bán vé máy bay trực tuyến TDK Team</p>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp">
                    <div class="pricing-table text-center">
                        <div class="price">
                            <span class="plan">Hà Nội > TP.HCM</span>
                            <span class="value"><small>$</small><strong>25</strong>/MO</span>
                        </div>
                        <ul class="text-center">
                            <li>Giảm 15%</li>
                            <li>Ghế hạng A</li>
                            <li>2h > 10h</li>
                        </ul>
                        <a href="#" class="btn btn-price">Mua Ngay</a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="pricing-table text-center">
                        <div class="price">
                            <span class="plan">TP.BMT > Hà Nội</span>
                            <span class="value"><small>$</small><strong>18</strong>/MO</span>
                        </div>
                        <ul class="text-center">
                            <li>Giảm 20%</li>
                            <li>Ghế hạng A</li>
                            <li>1h > 5h</li>
                        </ul>
                        <a href="#" class="btn btn-price">Mua Ngay</a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="0.6s">
                    <div class="pricing-table text-center">
                        <div class="price">
                            <span class="plan">TP.BMT > TP.HCM</span>
                            <span class="value"><small>$</small><strong>13</strong>/MO</span>
                        </div>
                        <ul class="text-center">
                            <li>Giảm 10%</li>
                            <li>Ghế hạng A</li>
                            <li>1h > 2h</li>
                        </ul>
                        <a href="#" class="btn btn-price">Mua Ngay</a>
                    </div>
                </div>

                <div class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-delay="0.9s">
                    <div class="pricing-table text-center">
                        <div class="price">
                            <span class="plan">Khác</span>
                            <span class="value"><small>$</small><strong>??</strong>/MO</span>
                        </div>
                        <ul class="text-center">
                            <li>Giảm ?%</li>
                            <li>Ghế hạng A</li>
                            <li>2h > 5h</li>
                        </ul>
                        <a href="#" class="btn btn-price">Mua Ngay</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 wow fadeInUp">
                    <div class="special-plan text-center">
                        <p>Mọi thắc mắc gì xin liên hệ với chúng tôi!</p>
                        <a href="#" class="btn btn-blue">Liên hệ chúng tôi</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--
    End #khuyenmai
    ========================== -->

    <!--
    #quotes
    ========================== -->
    <section id="quotes">
        <div class="container">
            <div class="row wow zoomIn">
                <div class="col-lg-12">
                    <div class="call-to-action text-center">
                        <p>Nắm bắt cơ hội du ngoạn vòng quanh thế giới với giá tốt từ TDK Team.
                            Đặt vé trực tuyến từ sớm để tiết kiệm tối ưu cho chuyến đi của mình.</p>
                        <span><a href="#">Xem chi tiết tại đây!</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--
    End #quotes
    ========================== -->


    <!--
    #tintuc
    ========================== -->

    <section id="tintuc">

        <div class="section-title text-center wow fadeInDown">
            <h2>Tin Tức</h2>    
            <p>Cập nhật liên tục các thông tin, tin tức về các dịch vụ hàng không, khuyến mãi cho khách hàng!
                Thông tin dịch vụ có thể phục vụ cho khách hàng và các thông tin khác</p>
        </div>

        <nav class="project-filter clearfix text-center wow fadeInLeft"  data-wow-delay="0.5s">
            <ul class="list-inline">
                <li><a href="javascript:;" class="filter" data-filter="all">Tất cả</a></li>
                <li><a href="javascript:;" class="filter" data-filter=".app">Tin nổi bật</a></li>
                <li><a href="javascript:;" class="filter" data-filter=".photography">Tin khuyến mãi</a></li>
                <li><a href="javascript:;" class="filter" data-filter=".web">Tin dịch vụ</a></li>
                <li><a href="javascript:;" class="filter" data-filter=".print">Tin khác</a></li>
            </ul>
        </nav>

        <div id="projects" class="clearfix">

            <figure class="mix portfolio-item app">
                <img class="img-responsive" src="img/portfolio/portfolio-1.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-1.jpg" title="Title One" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item photography">
                <img class="img-responsive" src="img/portfolio/portfolio-2.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-2.jpg" title="Title Two" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item web">
                <img class="img-responsive" src="img/portfolio/portfolio-3.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-3.jpg" title="Title Three" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item print">
                <img class="img-responsive" src="img/portfolio/portfolio-4.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-4.jpg" title="Title Four" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item app">
                <img class="img-responsive" src="img/portfolio/portfolio-4.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-4.jpg" title="Title Five" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item photography">
                <img class="img-responsive" src="img/portfolio/portfolio-1.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-1.jpg" title="Title Six" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item web app">
                <img class="img-responsive" src="img/portfolio/portfolio-2.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-2.jpg" title="Title Seven" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

            <figure class="mix portfolio-item print web">
                <img class="img-responsive" src="img/portfolio/portfolio-3.jpg" alt="Portfolio Item">
                <a href="img/portfolio/portfolio-3.jpg" title="Title Eight" rel="portfolio" class="fancybox"><span class="plus"></span></a>
                <figcaption class="mask">
                    <h3>Awesome Image</h3>
                    <span>Photography</span>
                </figcaption>
            </figure>

        </div> <!-- end #projects -->

    </section>
    <!--
    End #tintuc
    ========================== -->

    <!--
    #quotes
    ========================== -->
    <section id="quotes">
        <div class="container">
            <div class="row wow zoomIn">
                <div class="col-lg-12">
                    <div class="call-to-action text-center">
                        <p>Du lịch trở nên dễ dàng hơn với các ưu đãi giá vé của TDK Team
                            Đặc biệt áp dụng cho một số nhóm hành khách đặc biệt.</p>
                        <span><a href="#">Xem chi tiết tại đây!</a></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--
    End #quotes
    ========================== -->

    <!--
    #service
    ========================== -->
    <section id="service">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Điều Khoản Sử Dụng</h2>    
                        <p>Điều kiện và điền khoản để sử dụng hệ thống!</p>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-md-6 col-sm-12 wow fadeInLeft">
                    <div class="media">
                        <a href="#" class="pull-left">
                            <img src="img/icons/monitor.png" class="media-object" alt="Monitor">
                        </a>
                        <div class="media-body">
                            <h3>Tiêu chí và điều kiện sử dụng hệ thống mua vé trực tuyến</h3>
                            <p>Với TDK Team, việc mua vé trực tuyến thật dễ dàng. Chỉ với vài nhấp chuột,
                                quý khách lên được kế hoạch cho hành trình của mình.</p>
                        </div>
                    </div>

                </div>

                <div class="col-md-6 col-sm-12 wow fadeInRight" data-wow-delay="0.2s">
                    <div class="media">
                        <a href="#" class="pull-left">
                            <img src="img/icons/vanchuyen.png" alt="VanChuyen">
                        </a>
                        <div class="media-body">
                            <h3>Điều kiện vận chuyển</h3><br>
                            <p>Như mọi hãng hàng không khác, TDK Team áp dụng một số điều kiện vận 
                                chuyển để bảo đảm an toàn và tiện ích cho hành khách trên các chuyến bay.</p><br>
                        </div>
                    </div>

                </div>

                <div class="col-md-6 col-sm-12 wow fadeInLeft">
                    <div class="media">
                        <a href="#" class="pull-left">
                            <img src="img/icons/chinhsach.png" alt="ChinhSach">
                        </a>
                        <div class="media-body">
                            <h3>Điều kiện sử dụng trang web</h3>
                            <p>Để đảm bảo quyền lợi cho người dùng website TDK Team, 
                                chúng tôi áp dụng các điều kiện sau đối với người dùng truy cập và sử dụng website www.tdkteam.com</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-sm-12 wow fadeInRight" data-wow-delay="0.2s">
                    <div class="media">
                        <a href="#" class="pull-left">
                            <img src="img/icons/baomat.png" alt="BaoMat">
                        </a>
                        <div class="media-body">
                            <h3>Chính sách bảo mật</h3>
                            <p>Bảo mật thông tin cá nhân của quý khách là một trong những ưu tiên hàng đầu của chúng tôi. Vì vậy,
                                TDK Team áp dụng những chính sách bảo mật sau để bảo đảm thông tin 
                                Quý khách cung cấp sẽ chỉ được dùng cho mục đích thích hợp.</p>
                        </div>
                    </div>
                </div>

            </div> <!-- end .row -->
        </div> <!-- end .container -->
    </section>
    <!--
    End #dieukhoan
    ========================== -->


    <!--
    #subscribe
    ========================== -->
    <section id="subscribe">
        <div class="container">
            <div class="row">

                <div class="col-md-7 wow fadeInLeft">
                    <form action="#" method="post" class="subscription-form">
                        <i class="fa fa-envelope-o fa-lg"></i>
                        <input type="email" name="subscribe" class="subscribe" placeholder="YOUR MAIL" required="">
                        <input type="submit" value="SUBSCRIBE" id="mail-submit">
                    </form>
                </div>

                <div class="col-md-4 text-left wow fadeInRight">
                    <p>Để nhận được các thông tin về các chuyến bay giá rẻ, ưu đãi đặt biệt trên website 
                        của chúng tôi một cách nhanh nhất, hãy để lại Email chúng tôi sẽ gửi nó đến bạn!</p>
                </div>
            </div>
        </div>
    </section>
    <!--
    End #subscribe
    ========================== -->

    <!--
    #contact
    ========================== -->
    <section id="contact">
        <div class="container">
            <div class="row">

                <div class="section-title text-center wow fadeInDown">
                    <h2>Phản hồi</h2>
                    <p>Nếu bạn có thắc mắc cần được giải đáp hoặc yêu cầu nào đó khó giải quyết,
                        hãy để lại thông tin và gửi đến chúng tôi, chúng tôi sẽ giải quyết yêu cầu của bạn một cách nhanh nhất</p>
                </div>

                <div class="col-md-8 col-sm-9 wow fadeInLeft">
                    <div class="contact-form clearfix">
                        <form action="index.html" method="post">
                            <div class="input-field">
                                <input type="text" class="form-control" name="name" placeholder="Your Name" required="">
                            </div>
                            <div class="input-field">
                                <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
                            </div>
                            <div class="input-field message">
                                <textarea name="message" class="form-control" placeholder="Your Message" required=""></textarea>
                            </div>
                            <input type="submit" class="btn btn-blue pull-right" value="SEND MESSAGE" id="msg-submit">
                        </form>
                    </div> <!-- end .contact-form -->
                </div> <!-- .col-md-8 -->

                <div class="col-md-4 col-sm-3 wow fadeInRight">
                    <div class="contact-details">
                        <span>GET IN TOUCH</span>
                        <p>+00 123.456.789 <br> <br> +00 123.456.789</p>
                    </div> <!-- end .contact-details -->

                    <div class="contact-details">
                        <span>GET IN TOUCH</span>
                        <p>+00 123.456.789 <br> <br> +00 123.456.789</p>
                    </div> <!-- end .contact-details -->
                </div> <!-- .col-md-4 -->

            </div>
        </div>
    </section>
    <!--
    End #contact
    ========================== -->
    <%@include file="includes/footer.jsp" %>
</body>
</html>
