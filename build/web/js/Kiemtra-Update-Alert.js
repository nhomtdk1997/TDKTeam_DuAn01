/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Windows open center
function open_window(url, width, height) {
    var my_window;
    var center_left = (screen.width / 2) - (width / 2);
    var center_top = (screen.height / 2) - (height / 2);
    my_window = window.open(url, "Title", "scrollbars=1, width=" + width + ", height=" + height + ", left=" + center_left + ", top=" + center_top);
    my_window.focus();
}

//Kiểm tra tài khoản
function kiemtrataikhoan() {
    var a = document.getElementById("kiemtra").value;
    if (a == 1) {
        swal({
            title: "Cập nhật tài khoản thành công!",
            text: "Chờ 3s để trở về trang quản lý!",
            type: "success",
            timer: 2000,
            showConfirmButton: false
        },
                function () {
                    setTimeout(function () {
                        window.location = "TaiKhoan.jsp";
                    }, 500);
                });
    } else if (a == 0) {
        swal({
            title: "Cập nhật tài khoản thất bại!",
            text: "Hãy kiểm tra lại các thông tin trước khi cập nhật!",
            type: "error",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        },
                function () {
                    setTimeout(function () {
                        swal("Kiểm tra lại các thông tin!", "", "info");
                    }, 1000);
                });
    }
}
;
