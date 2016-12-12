<%-- 
    Document   : slider
    Created on : Nov 14, 2016, 4:19:29 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--
       Home Slider
       ==================================== -->
<section id="home">     
    <div id="home-carousel" class="carousel slide" data-interval="false">
        <ol class="carousel-indicators">
            <li data-target="#home-carousel" data-slide-to="0" class="active"></li>
            <li data-target="#home-carousel" data-slide-to="1"></li>
            <li data-target="#home-carousel" data-slide-to="2"></li>
        </ol>
        <!--/.carousel-indicators-->

        <div class="carousel-inner">

            <div class="item active"  style="background-image: url('img/slider/slider1.jpg')" >
                <div class="carousel-caption">
                    <div class="animated bounceInRight">
                        <h2>Tìm & Đặt Vé – Khuyến Mại</h2>
                        <p>Nắm bắt cơ hội du ngoạn vòng quanh thế giới với giá tốt từ TDK Team
                            Đặt vé trực tuyến từ sớm để tiết kiệm tối ưu cho chuyến đi của mình.</p>
                    </div>
                </div>
            </div>              

            <div class="item" style="background-image: url('img/slider/slider7.jpg')">                
                <div class="carousel-caption">
                    <div class="animated bounceInDown">
                        <h2>Giá Vé Đặc Biệt</h2>
                        <p>Du lịch trở nên dễ dàng hơn với các ưu đãi giá vé của TDK Team
                            Đặc biệt áp dụng cho một số nhóm hành khách đặc biệt.</p>
                    </div>
                </div>
            </div>

            <div class="item" style="background-image: url('img/slider/slider5.jpg')">                 
                <div class="carousel-caption">
                    <div class="animated bounceInUp">
                        <h2>Chăm Sóc Khách Hàng</h2>
                        <p>Nhân viên phục vụ khách hàng một cách tận tình, trợ giúp khách hàng 24/24</p>
                    </div>
                </div>
            </div>
        </div>
        <!--/.carousel-inner-->
        <nav id="nav-arrows" class="nav-arrows hidden-xs hidden-sm visible-md visible-lg">
            <a class="sl-prev hidden-xs" href="#home-carousel" data-slide="prev">
                <i class="fa fa-angle-left fa-3x"></i>
            </a>
            <a class="sl-next" href="#home-carousel" data-slide="next">
                <i class="fa fa-angle-right fa-3x"></i>
            </a>
        </nav>

    </div>
</section>
<!--
End #home Slider
========================== -->

