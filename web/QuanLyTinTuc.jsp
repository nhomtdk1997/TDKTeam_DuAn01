<%-- 
    Document   : TinTuc
    Created on : Dec 6, 2016, 11:20:08 AM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Tintuc"%>
<%@page import="com.javaweb.service.TintucService"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tin tức</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <body>
        <%@include file="includes/headerManageFix.jsp" %>

        <%            
            int pageSize = 5;
            int pageNumber = 1;
            request.setCharacterEncoding("UTF-8");
            ArrayList<Tintuc> listTintuc = null;
            TintucService tintucservice = new TintucService();

            if (request.getParameter("Page") != null) {
                session.setAttribute("Page", request.getParameter("Page"));
                pageNumber = Integer.parseInt(request.getParameter("Page"));
            } else {
                session.setAttribute("Page", "1");
            }
            String TintucKey = "";
            if (request.getParameter("Timkiem") != null) {
                session.setAttribute("searchTintucKey", request.getParameter("Timkiem"));
                TintucKey = request.getParameter("Timkiem");
                listTintuc = tintucservice.SearchTintuc(pageSize, pageNumber, TintucKey);
                session.removeAttribute("searchTintucKey");
            } else {
                listTintuc = tintucservice.GetAllTintuc(pageSize, pageNumber);
            }

            int pageCount = (tintucservice.tintuccount / pageSize)
                    + (tintucservice.tintuccount % pageSize > 0 ? 1 : 0);

            String nextPage = (pageCount > pageNumber
                    ? (pageNumber + 1) : pageNumber) + "";
            String prePage = (pageNumber <= 1 ? 1 : pageNumber - 1) + "";

            String folderupload = getServletContext().getInitParameter("file-upload");
        %>
        <section class="container-fluid" style="margin-top: 50px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Quản lý tin tức</h2>
                        <p>Bảng tổng hợp tin tức</p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-2">
                            <a href="ThemTinTuc.jsp"><button class="col-md-9 btn btn-success">+ Thêm tin tức</button></a>
                        </div>
                        <div class="col-md-2 col-md-offset-8">
                            <form action="QuanLyTinTuc.jsp" method="get">
                                <div class="input-group">
                                    <input type="date" class="form-control" name="Timkiem" placeholder="Tìm kiếm theo ngày đăng...">
                                    <span class="input-group-btn">     
                                        <button class="btn btn-warning" type="submit">Search!</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>                        
                            <th>idTK</th>                        
                            <th>Hình ảnh</th>                                               
                            <th>Tiêu đề</th>                                               
                            <th>Ngày đăng</th>
                            <th>Ghi chú</th>
                            <th>Sửa</th>                       
                            <th>Xóa</th>                       
                            <th>Chi tiết ...</th>                       
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listTintuc.size(); i++) {
                                Tintuc tintuc = listTintuc.get(i);
                        %>        

                        <tr>
                            <td><%=i%></td>                        
                            <td><%= tintuc.getIdTaiKhoan()%></td>
                            <td style="width: 300px;"><img class="img-thumbnail" src="<%=folderupload%><%=tintuc.getImgLink()%>"></td>
                            <td><%= tintuc.getTieuDe()%></td>
                            <td style="width: 200px;"><%= tintuc.getNgayDang()%></td>
                            <td><%= tintuc.getGhiChu()%></td>
                            <td style="width: 40px;">
                                <a href="SuaTinTuc.jsp?idTintuc=<%= tintuc.getIdtintuc()%>"><input type="button" class="btn btn-primary" name="suatintuc" value="Sửa"/></a>
                            </td>
                            <td style="width: 47px;">
                                <a id="xoatintuc" onclick="kiemtraxoatintuc(<%= tintuc.getIdtintuc()%>)">
                                    <input type="button" class="btn btn-danger" name="xoatintuc" value="Xóa" />
                                </a>
                            </td>
                            <td style="width: 57px;">
                                <input onclick="openInNewTab('TinTucDetail.jsp?idTintuc=<%= tintuc.getIdtintuc()%>');" type="button" class="btn btn-success" name="xoatintuc" value="Chi tiết" />
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <%
                    String keyurl = "";
                    if (!TintucKey.equals("")) {
                        keyurl = "&key=" + TintucKey;
                    }
                %>
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a  aria-label="Previous" href="?Page=<%=prePage%><%=keyurl%>"> <span aria-hidden="true">&laquo;</span></a></li>
                            <%
                                for (int j = 1; j <= pageCount; j++) {
                                    if (pageNumber == j) {
                            %>
                        <li class="active"><a href="?Page=<%=j%><%=keyurl%>"><%=j%></a></li>
                            <%
                            } else {
                            %>                                   
                        <li ><a href="?Page=<%=j%><%=keyurl%>"><%=j%></a></li>
                            <%
                                    }
                                }
                            %>
                        <li ><a aria-label="Next" href="?Page=<%=nextPage%><%=keyurl%>"><span aria-hidden="true">&raquo;</span></a></li>
                    </ul>
                </nav>
            </div>
        </section>

        <%@include file="includes/footer.jsp" %>
    </body>
</html>
