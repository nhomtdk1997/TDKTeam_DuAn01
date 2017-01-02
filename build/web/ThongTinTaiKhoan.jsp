<%-- 
    Document   : ThongTinTaiKhoan
    Created on : Dec 21, 2016, 11:31:10 AM
    Author     : DuongNguyen
--%>

<%@page import="com.javaweb.model.Quoctich"%>
<%@page import="com.javaweb.service.QuoctichService"%>
<%@page import="com.javaweb.model.Loaitaikhoan"%>
<%@page import="com.javaweb.service.LoaitaikhoanService"%>
<%@page import="com.javaweb.model.Nguoidung"%>
<%@page import="com.javaweb.service.NguoidungService"%>
<%@page import="com.javaweb.model.Taikhoan"%>
<%@page import="com.javaweb.service.TaikhoanService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin tài khoản</title>
        <%@include file="includes/headtag.jsp" %>
    </head>
    <%        if (session.getAttribute("kiemtra") != null) {
    %>
    <body onload="kiemtrathongtintaikhoan(<%=session.getAttribute("kiemtra")%>)">
        <%
            session.removeAttribute("kiemtra");
        } else {
        %>
    <body>
        <%
            }
        %>
        <%@include file="includes/headerUserFix.jsp" %>
        <section class="container" style="margin-top: 50px;">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center wow fadeInDown">
                        <h2>Thông tin tài khoản</h2>
                    </div>
                </div>
            </div>
            <%
                TaikhoanService tksv = new TaikhoanService();
                Taikhoan tk = null;
                NguoidungService ndsv = new NguoidungService();
                Nguoidung nd = new Nguoidung();
                LoaitaikhoanService ltksv = new LoaitaikhoanService();
                Loaitaikhoan ltk = new Loaitaikhoan();
                String idtk = "" + session.getAttribute("iduser");
                tk = tksv.GetUserById(idtk);
                int idnd = tk.getIdnguoidung();
                nd = ndsv.GetUserByIdNguoidung(idnd);
                int idLoaiTK = tk.getIdLoaiTk();
                ltk = ltksv.GetLoaitaikhoanByID(idLoaiTK);
                QuoctichService qtsv = new QuoctichService();
                Quoctich qt = new Quoctich();
                int idNguoidung = Integer.parseInt("" + session.getAttribute("idnguoidung"));
                nd = ndsv.GetUserByIdNguoidung(idNguoidung);
                int idQuoctich = nd.getQuocTich();
                qt = qtsv.GetQuoctichByID(idQuoctich);
            %>
            <div class="col-md-4">
                <form action="UserSuaTaiKhoanServlet" method="post">
                    <input class="hidden" name="idTaikhoan" value="<%=idtk%>">
                    <div class="form-group col-md-12">
                        <label>Tên đăng nhập<span class="required"> *</span></label>
                        <input name="Username" type="text" required value="<%=tk.getTenDangNhap()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-12">
                        <label>Địa chỉ Email<span class="required"> *</span></label>
                        <input name="Email" type="text" value="<%=tk.getEmail()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-12">
                        <label>Mật khẩu<span class="required"> *</span></label>
                        <input name="Passwd" type="password" required placeholder="Nhập mật khẩu mới!" class="form-control">
                    </div>
                    <div class="form-group col-md-12">
                        <label>Xác nhận mật khẩu<span class="required"> *</span></label>
                        <input name="Passwd2nd" type="password" required placeholder="Nhập để xác nhận lại mật khẩu!" class="form-control">
                    </div>
                    <input name="loaiTK" value="<%=tk.getIdLoaiTk()%>" class="hidden">
                    <div class="form-group col-md-12">
                        <div style="padding-left: 0px;" class="col-md-6 col-xs-6">
                            <p style="padding-top: 0px;">
                                <a href="index.jsp"><br>&laquo; Về trang chủ</a>
                            </p>
                        </div>
                        <div style="padding-right: 0px;" class="col-md-6 col-xs-6">
                            <button style="float: right;" type="submit" class="btn btn-blue">Sửa tài khoản</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-8">
                <form action="UserSuaThongTinServlet" method="post">
                    <input class="hidden" name="idNguoidung" value="<%=idNguoidung%>">
                    <div class="form-group col-md-5">
                        <label>Họ<span class="required"> *</span></label>
                        <input name="Ho" type="text" required value="<%=nd.getHo()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-7">
                        <label>Đệm và tên<span class="required"> *</span></label>
                        <input name="Demvaten" type="text" required value="<%=nd.getDemVaTen()%>" class="form-control">
                    </div>
                    <div class="col-md-5">
                        <label>Giới tính<span class="required"> *</span></label>
                        <%
                            if (nd.getGioiTinh() == true) {
                        %>
                        <fieldset>
                            <label class="form-control">
                                <div class="col-md-5 col-xs-2" style="padding-right: 0px;">
                                    <input class="form-title" type="radio" name="gender-switch" id="male" value="male" checked="checked">
                                    <span>Nam</span>
                                </div>
                                <div class="col-md-5 col-xs-2">
                                    <input type="radio" name="gender-switch" id="female" value="female">
                                    <span>Nữ</span>
                                </div>
                            </label>
                        </fieldset>
                        <%
                        } else {
                        %>
                        <fieldset>
                            <label class="form-control">
                                <div class="col-md-5 col-xs-2" style="padding-right: 0px;">
                                    <input class="form-title" type="radio" name="gender-switch" id="male" value="male">
                                    <span>Nam</span>
                                </div>
                                <div class="col-md-5 col-xs-2">
                                    <input type="radio" name="gender-switch" id="female" value="female" checked="checked">
                                    <span>Nữ</span>
                                </div>
                            </label>
                        </fieldset>
                        <%
                            }
                        %>
                    </div>
                    <div class="form-group col-md-7">
                        <label>Ngày sinh<span class="required"> *</span></label>
                        <input name="Ngaysinh" type="date" required value="<%=nd.getNgaySinh()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-4">
                        <label>Quốc tịch<span class="required"> *</span></label>
                        <select name="quoctich" class="form-control">
                            <option hidden="" selected="" value="<%=nd.getQuocTich()%>"><%=qt.getQuocTich()%></option>
                            <option value="1">AFGHANISTAN</option><option value="2">ALBANIA</option><option value="3">ALGERIA</option><option value="4">AMERICAN SAMOA</option>
                            <option value="5">ANDORRA</option><option value="6">ANGOLA</option><option value="7">ANGUILLA</option><option value="8">ANTARTICA</option>
                            <option value="9">ANTIGUA AND BARBUDA</option><option value="10">ARGENTINA</option><option value="11">ARMENIA</option><option value="12">ARUBA</option>
                            <option value="13">AUSTRALIA</option><option value="14">AUSTRIA</option><option value="15">AZERBAIJAN</option><option value="16">BAHAMAS</option>
                            <option value="17">BAHRAIN</option><option value="18">BANGLADESH</option><option value="19">BARBADOS</option><option value="20">BELARUS</option>
                            <option value="21">BELGIUM</option><option value="22">BELIZE</option><option value="23">BENIN</option><option value="24">BERMUDA</option>
                            <option value="25">BHUTAN</option><option value="26">BOLIVIA</option><option value="27">BOSNIA HERCEGOVINA</option><option value="28">BOTSWANA</option>
                            <option value="29">BOUVET ISLAND</option><option value="30">BRAZIL</option><option value="31">BRITISH INDIAN OCEAN TERRITORY</option>
                            <option value="32">BRUNEI DARUSSALAM</option><option value="33">BULGARIA</option><option value="34">BURKINA FASO</option><option value="35">BURMA</option>
                            <option value="36">BURUNDI</option><option value="37">CAMBODIA</option><option value="38">CAMEROON</option><option value="39">CANADA</option>
                            <option value="40">CANTON AND ENDERBURY ISLANDS</option><option value="41">CAPE VERDE</option><option value="42">CAYNAN ISLANDS</option>
                            <option value="43">CENTRAL AFRICAN REPUBLIC</option><option value="44">CHAD</option><option value="45">CHILE</option><option value="46">CHINA</option>
                            <option value="47">CHRISMAS ISLAND (INDIAN OCEAN)</option><option value="48">COCOS (KEELING) ISLANDS</option><option value="49">COLOMBIA</option>
                            <option value="50">COMOROS</option><option value="51">CONGO</option><option value="52">COOK ISLANDS</option><option value="53">COSTA RICA</option>
                            <option value="54">COTE DIVOIRE</option><option value="55">CROATIA</option><option value="56">CUBA</option><option value="57">CYPRUS</option>
                            <option value="58">CZECH REPUBLIC</option><option value="59">CZECHOSLOVAKIA</option><option value="60">DEMOCRATIC YEMEN</option>
                            <option value="61">DENMARK</option><option value="62">DJIBOUTI</option><option value="63">DOMINICA</option><option value="64">DOMINICAN REPUBLIC</option>
                            <option value="65">DRONNING MAUD LAND</option><option value="66">EAST TIMOR</option><option value="67">ECUADOR</option><option value="68">EGYPT</option>
                            <option value="69">EL SALVADOR</option><option value="70">EQUATORIAL GUINEA</option><option value="71">ERITREA</option><option value="72">ESTONIA</option>
                            <option value="73">ETHIOPIA</option><option value="74">FALKLAND ISLANDS</option><option value="75">FAROE ISLANDS</option>
                            <option value="76">FEDERAL SYSTEM OF MICRONESIA</option><option value="77">FIJI</option><option value="78">FINLAND</option>
                            <option value="79">FRANCE</option><option value="80">FRENCH GUIANA</option><option value="81">FRENCH POLYNESIA</option>
                            <option value="82">FRENCH SOUTHERN TERRITORIES</option><option value="83">GABON</option><option value="84">GAMBIA</option><option value="85">GEORGIA</option>
                            <option value="86">GERMANY</option><option value="87">GHANA</option><option value="88">GIBRALTAR</option><option value="89">GREAT BRITAIN</option>
                            <option value="90">GREECE</option><option value="91">GREENLAND</option><option value="92">GRENADA</option><option value="93">GUADELOUPE</option>
                            <option value="94">GUAM</option><option value="95">GUATEMALA</option><option value="96">GUINEA</option><option value="97">GUINEA-BISSAU</option>
                            <option value="98">GUYANA</option><option value="99">HAITI</option><option value="100">HEARD AND MCDONALD ISLANDS</option><option value="101">HONDURAS</option>
                            <option value="102">HONG KONG</option><option value="103">HUNGARY</option><option value="104">ICELAND</option><option value="105">INDIA</option>
                            <option value="106">INDONESIA</option><option value="107">IRAN (ISLAMIC REPUBLIC OF)</option><option value="108">IRAQ</option>
                            <option value="109">IRELAND</option><option value="110">ISRAEL</option><option value="111">ITALY</option><option value="112">JAMAICA</option>
                            <option value="113">JAPAN</option><option value="114">JOHNSTON ISLAND</option><option value="115">JORDAN</option><option value="116">KAZAKHSTAN</option>
                            <option value="117">KENIA</option><option value="118">KIRIBATI</option><option value="119">KOREA, DEMOCRATIC PEOPLES REPUBLIC</option>
                            <option value="120">KOREA, REPUBLIC OF KOREA</option><option value="121">KUWAIT</option><option value="122">KYRGYZSTAN (KIRGISTAN)</option>
                            <option value="123">LAO PEOPLES DEMOCRATIC REPUBLIC</option><option value="124">LATVIA</option><option value="125">LEBANON</option>
                            <option value="126">LESOTHO</option><option value="127">LIBERIA</option><option value="128">LIBYAN ARAB JAMAHIRIYA</option><option value="129">LIECHTENSTEIN</option>
                            <option value="130">LITHUINIA</option><option value="131">LUXEMBOURG</option><option value="132">MACAU</option><option value="133">MADAGASCAR</option>
                            <option value="134">MALAWI</option><option value="135">MALAYSIA</option><option value="136">MALDIVES</option><option value="137">MALI</option>
                            <option value="138">MALTA</option><option value="139">MARSHALL ISLANDS</option><option value="140">MARTINIQUE</option><option value="141">MAURITANIA</option>
                            <option value="142">MAURITUS</option><option value="143">MAYOTTE</option><option value="144">MEXICO</option><option value="145">MIDWAY ISLANDS</option>
                            <option value="146">MOLDOVA, REPUBLIC OF</option><option value="147">MONACO</option><option value="148">MONGOLIA</option><option value="149">MONTSERRAT</option>
                            <option value="150">MOROCCO</option><option value="151">MOZAMBIQUE</option><option value="152">MYANMAR</option><option value="153">NAMIBIA</option>
                            <option value="154">NAURU</option><option value="155">NEPAL</option><option value="156">NETHERLANDS</option><option value="157">NETHERLANDS ANTILLES</option>
                            <option value="158">NEW ZEALAND</option><option value="159">NICARAGUA</option><option value="160">NIGER</option><option value="161">NIGERIA</option>
                            <option value="162">NIUE</option><option value="163">NORFOLK ISLAND</option><option value="164">NORTHERN MARIANA ISLANDS</option><option value="165">NORWAY</option>
                            <option value="166">NOUVELLE CALEDONIA</option><option value="167">OMAN</option><option value="168">PACIFIC ISLANDS</option><option value="169">PAKISTAN</option>
                            <option value="170">PALAU</option><option value="171">PANAMA</option><option value="172">PAPUA NEW GUINEA</option><option value="173">PARAGUAY</option>
                            <option value="174">PERU</option><option value="175">PHILIPPINES</option><option value="176">PITCAIRN ISLAND</option><option value="177">POLAND</option>
                            <option value="178">PORTUGAL</option><option value="179">PUERTO RICO</option><option value="180">QATAR</option><option value="181">REPUBLIC OF SAN MARINO</option>
                            <option value="182">REUNION</option><option value="183">ROMANIA</option><option value="184">RUSSIAN FEDERATION</option><option value="185">RWANDA</option>
                            <option value="186">SAINT KITTS AND NEVIS</option><option value="187">SAINT LUCIA</option><option value="188">SAINT VINCENT AND THE GRENADINES</option>
                            <option value="189">SAMOA</option><option value="190">SAN MARINO</option><option value="191">SAO TOME AND PRINCIPE</option><option value="192">SAUDI ARABIA</option>
                            <option value="193">SENEGAL</option><option value="194">SEYCHELLES</option><option value="195">SIERRA LEONE</option><option value="196">SINGAPORE</option>
                            <option value="197">SLOVAKIA</option><option value="198">SLOVENIA</option><option value="199">SOLOMON ISLANDS</option><option value="200">SOMALIA</option>
                            <option value="201">SOUTH AFRICA</option><option value="202">SOUTH GEORGIA</option><option value="203">SPAIN AND CANARY ISLANDS</option>
                            <option value="204">SRI LANKA</option><option value="205">ST. HELENA</option><option value="206">ST. PIERRE AND MIQUELON</option><option value="207">SUDAN</option>
                            <option value="208">SURINAME</option><option value="209">SVALBARD AND JAN MAYEN ISLANDS</option><option value="210">SWEDEN</option>
                            <option value="211">SWITZERLAND</option><option value="212">SYRIAN ARAB REPUBLIC</option><option value="213">TAIWAN</option><option value="214">TAJIKISTAN</option>
                            <option value="215">TANZANIA, UNITED REPUBLIC</option><option value="216">THAILAND</option><option value="217">THE STATE OF PALESTINE</option>
                            <option value="218">TOGO</option><option value="219">TOKELAU</option><option value="220">TONGA</option><option value="221">TRINIDAD AND TOBAGO</option>
                            <option value="222">TUNISIA</option><option value="223">TURKEY</option><option value="224">TURKMENISTAN</option><option value="225">TURKS AND CAICOS ISLANDS</option>
                            <option value="226">TUVALU</option><option value="227">UGANDA</option><option value="228">UKRAINE</option><option value="229">UNITED ARAB EMIRATES</option>
                            <option value="230">UNITED KINGDOM</option><option value="231">UNITED STATES MINOR OUTLYING ISLAND</option><option value="232">UNITED STATES OF AMERICA</option>
                            <option value="233">UPPER VOLTA</option><option value="234">URUGUAY</option><option value="235">USSR</option><option value="236">UZBEKISTAN</option>
                            <option value="237">VANUATU</option><option value="238">VATICAN CITY STATE</option><option value="239">VENEZUELA</option>
                            <option value="240">VIETNAM</option>
                            <option value="241">VIRGIN ISLANDS, (BRITISH)</option><option value="242">VIRGIN ISLANDS, (U.S.)</option><option value="243">WAKE ISLAND</option>
                            <option value="244">WALLIS AND FUTUNA ISLANDS</option><option value="245">WESTERN SAHARA</option><option value="246">YEMEN, REPUBLIC OF</option>
                            <option value="247">YUGOSLAVIA</option><option value="248">ZAIRE</option><option value="249">ZAMBIA</option><option value="250">ZIMBABWE</option>
                        </select>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Địa chỉ<span class="required"> *</span></label>
                        <input name="Diachi" type="text" required value="<%=nd.getDiaChi()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Số điện thoại<span class="required"> *</span></label>
                        <input name="SDT" min="01000000000" max="09999999999" type="number" required value="<%=nd.getSdt()%>" class="form-control">
                    </div>
                    <div class="form-group col-md-6">
                        <label>Số CMND<span class="required"> *</span></label>
                        <input name="CMND" min="100000000" max="999999999999" type="number" required value="<%=nd.getSoCmnd()%>" class="form-control">
                    </div>

                    <div class="form-group col-md-12">
                        <div style="padding-right: 0px;">
                            <button style="float: right;" type="submit" class="btn btn-blue">Sửa thông tin</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
