<%-- 
    Document   : Register
    Created on : Oct 12, 2016, 4:20:13 PM
    Author     : DuongNguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <%@include file="includes/headtag.jsp" %>
        <%@include file="includes/popuplogin.jsp" %>
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <%@include file="includes/slider.jsp" %>

        <section id="contact">
            <div class="container">
                <div class="row col-md-12">
                    <form action="RegisterServlet" method="post">

                        <div class="col-md-4">
                            <div class="row form-group col-md-12">
                                <label>Tên đăng nhập<span class="required"> *</span></label>
                                <input name="Username" type="text" required id="memberUsername" class="form-control">
                            </div>
                            <div class="row form-group col-md-12">
                                <label>Mật khẩu<span class="required"> *</span></label>
                                <input name="Passwd" type="password" required id="memberPasswd" class="form-control">
                            </div>
                            <div class="row form-group col-md-12">
                                <label>Xác nhận mật khẩu<span class="required"> *</span></label>
                                <input name="Passwd2nd" type="password" required id="memberPasswd2nd" class="form-control">
                            </div>
                            <div class="row form-group col-md-12">
                                <label>Địa chỉ Email<span class="required"> *</span></label>
                                <input name="Email" type="text" id="memberEmail" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Họ<span class="required"> *</span></label>
                                    <input name="LastName" type="text" required id="memberLastName" class="form-control" placeholder="Nhập theo CMND/Hộ chiếu - Ví dụ: Nguyễn">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Đệm và Tên<span class="required"> *</span></label>
                                    <input name="FirstName" type="text" required id="memberFirstName" class="form-control" placeholder="Nhập theo CMND/Hộ chiếu - Ví dụ: Văn An">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-3">
                                    <label>Giới tính<span class="required"> *</span></label>
                                    <fieldset>
                                        <label class="form-group">
                                            <input class="form-title" type="radio" name="gender-switch" id="male" value="male" checked="checked">
                                            <span>Nam</span>
                                        </label>
                                        <label>
                                            <input type="radio" name="gender-switch" id="female" value="female">
                                            <span>Nữ</span>
                                        </label>
                                    </fieldset>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Ngày<span class="required"> *</span></label>
                                    <select name="ngay" class="form-control" required>
                                        <option hidden="" selected=""></option>
                                        <option value="1">01</option><option value="2">02</option><option value="3">03</option>
                                        <option value="4">04</option><option value="5">05</option><option value="6">06</option>
                                        <option value="7">07</option><option value="8">08</option><option value="9">09</option>
                                        <option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                        <option value="13">13</option><option value="14">14</option><option value="15">15</option>
                                        <option value="16">16</option><option value="17">17</option><option value="18">18</option>
                                        <option value="19">19</option><option value="20">20</option><option value="21">21</option>
                                        <option value="22">22</option><option value="23">23</option><option value="24">24</option>
                                        <option value="25">25</option><option value="26">26</option><option value="27">27</option>
                                        <option value="28">28</option><option value="29">29</option><option value="30">30</option>
                                        <option value="31">31</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Tháng<span class="required"> *</span></label>
                                    <select name="thang" class="form-control" required>
                                        <option hidden="" selected=""></option>
                                        <option value="1">01</option><option value="2">02</option><option value="3">03</option><option value="4">04</option>
                                        <option value="5">05</option><option value="6">06</option><option value="7">07</option><option value="8">08</option>
                                        <option value="9">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label>Năm<span class="required"> *</span></label>
                                    <select name="nam" class="form-control" required>
                                        <option hidden="" selected=""></option>
                                        <option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option>
                                        <option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option>
                                        <option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option>
                                        <option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option>
                                        <option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option>
                                        <option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option>
                                        <option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option>
                                        <option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option>
                                        <option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option>
                                        <option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option>
                                        <option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option>
                                        <option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option>
                                        <option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option>
                                        <option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option>
                                        <option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option>
                                        <option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option>
                                        <option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option>
                                        <option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option>
                                        <option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option>
                                        <option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option>
                                        <option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option>
                                        <option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option>
                                        <option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option>
                                        <option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option>
                                        <option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option>
                                        <option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option>
                                        <option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option>
                                        <option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option>
                                        <option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option>
                                        <option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option>
                                        <option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option>
                                        <option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option>
                                        <option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option>
                                        <option value="1917">1917</option><option value="1916">1916</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label>Quốc tịch<span class="required"> *</span></label>
                                    <select name="quoctich" class="form-control">
                                        <option hidden="" value="0"></option>
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
                                        <option selected="" value="240">VIETNAM</option>
                                        <option value="241">VIRGIN ISLANDS, (BRITISH)</option><option value="242">VIRGIN ISLANDS, (U.S.)</option><option value="243">WAKE ISLAND</option>
                                        <option value="244">WALLIS AND FUTUNA ISLANDS</option><option value="245">WESTERN SAHARA</option><option value="246">YEMEN, REPUBLIC OF</option>
                                        <option value="247">YUGOSLAVIA</option><option value="248">ZAIRE</option><option value="249">ZAMBIA</option><option value="250">ZIMBABWE</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-8">
                                    <label>Địa chỉ<span class="required"> *</span></label>
                                    <input name="Address1" type="text" id="companyAddress1" class="form-control">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label>Số CMND/Hộ chiếu<span class="required"> *</span></label>
                                    <input name="PasportNum" type="text" id="memberPasportNum" class="form-control">
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Số điện thoại liên hệ<span class="required"> *</span></label>
                                    <input name="SDT" type="text" id="SDT" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <input style="float: right;" name="DangKy" type="submit" class="btn btn-blue" value="Đăng ký">
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
