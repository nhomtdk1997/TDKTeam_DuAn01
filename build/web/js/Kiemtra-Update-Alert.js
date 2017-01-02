/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//Windows center open
function open_window(url, width, height) {
    var my_window;
    var center_left = (screen.width / 2) - (width / 2);
    var center_top = (screen.height / 2) - (height / 2);
    my_window = window.open(url, "Title", "scrollbars=1, width=" + width + ", height=" + height + ", left=" + center_left + ", top=" + center_top);
    my_window.focus();
}

//Kiểm tra Tài khoản
function kiemtrataikhoan(a) {
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

//Kiểm tra Người dùng
function kiemtranguoidung(a) {
    if (a == 1) {
        swal({
            title: "Cập nhật thông tin thành công!",
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
            title: "Cập nhật thông tin thất bại!",
            text: "Hãy kiểm tra lại các thông tin trước khi cập nhật!",
            type: "error",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        },
                function () {
                    setTimeout(function () {
                        swal("Kiểm tra lại các thông tin!", "Có thể SĐT hoặc CMND bạn nhập đã được đăng ký!", "info");
                    }, 1000);
                });
    }
}
;

//Kiểm tra Xóa thông tin tài khoản + người dùng
function kiemtraxoataikhoan(idTaikhoan, idNguoidung) {
    var a = document.getElementById('xoataikhoan');
    swal({
        title: "Bạn chắc chắn muốn xóa?",
        text: "Nếu bạn xóa, tất cả thông tin tài khoản lẫn thông tin người dùng đều sẽ bị xóa hết!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Xóa bỏ!",
        cancelButtonText: "Hủy bỏ!",
        closeOnConfirm: false,
        closeOnCancel: false,
        showLoaderOnConfirm: true
    },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Xóa tài khoản!", "Tài khoản và các thông tin của bạn sẽ bị xóa...", "success");
                    setTimeout(function () {
                        window.location = "XoaTaiKhoan.jsp?idTaikhoan=" + idTaikhoan + "&idNguoidung=" + idNguoidung;
                    }, 1500);
                } else {
                    swal("Hủy bỏ xóa!", "Thông tin của bạn đã được an toàn, không bị xóa!", "error");
                }
            });
}
;

//Kiểm tra Đăng nhập
function kiemtradangnhap(a) {
    if (a == 1) {
        swal({
            title: "Đăng nhập thành công!",
            text: "Chờ xử lý đăng nhập...",
            type: "success",
            timer: 2000,
            showConfirmButton: false
        });
    } else if (a == 0) {
        swal({
            title: "Đăng nhập thất bại!",
            type: "error",
            text: "Tên đăng nhập hoặc mật khẩu không chính xác\n<a href='' data-toggle='modal' data-target='#myModal'><button>Đăng nhập lại!</button></a>",
            html: true,
            showConfirmButton: false
        });
    }
}
;

//Kiểm tra Đăng ký
function kiemtradangky(a) {
    if (a == 1) {
        swal({
            title: "Đăng ký thành công!",
            text: "Chờ 3s để trở về trang chủ!",
            type: "success",
            timer: 2000,
            showConfirmButton: false
        },
                function () {
                    setTimeout(function () {
                        window.location = "index.jsp";
                    }, 500);
                });
    } else if (a == 0) {
        swal("Đăng ký thất bại", "Kiểm tra lại thông tin đăng ký!", "error");
    }
}
;

//Kiểm tra Thông tin tài khoản
function kiemtrathongtintaikhoan(a) {
    if (a == 1) {
        swal({
            title: "Cập nhật thông tin thành công!",
            text: "Chờ 3s để cập nhật lại thông tin!",
            type: "success",
            timer: 2000,
            showConfirmButton: false
        },
                function () {
                    setTimeout(function () {
                        window.location = "ThongTinTaiKhoan.jsp";
                    }, 500);
                });
    } else if (a == 0) {
        swal({
            title: "Cập nhật thông tin thất bại!",
            text: "Hãy kiểm tra lại các thông tin trước khi cập nhật!",
            type: "error",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        },
                function () {
                    setTimeout(function () {
                        swal("Kiểm tra lại các thông tin!", "SĐT, CMND bị trùng hoặc không đúng mẫu!\nHoặc mật khẩu không trùng khớp!", "info");
                    }, 1000);
                });
    }
}
;

//Kiểm tra Chuyến bay
function kiemtrachuyenbay(a) {
    if (a == 1) {
        swal({
            title: "Cập nhật chuyến bay thành công!",
            text: "Chờ 3s để trở về trang quản lý!",
            type: "success",
            timer: 2000,
            showConfirmButton: false
        },
                function () {
                    setTimeout(function () {
                        window.location = "ChuyenBay.jsp";
                    }, 500);
                });
    } else if (a == 0) {
        swal({
            title: "Cập nhật chuyến bay thất bại!",
            text: "Hãy kiểm tra lại các thông tin trước khi cập nhật!",
            type: "error",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        });
    }
}
;

//Kiểm tra Xóa thông tin Chuyến bay
function kiemtraxoachuyenbay(idChuyenbay) {
    var a = document.getElementById('xoachuyenbay');
    swal({
        title: "Bạn chắc chắn muốn xóa?",
        text: "Tất cả thông tin của chuyến bay này đều sẽ bị xóa hết!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Xóa bỏ!",
        cancelButtonText: "Hủy bỏ!",
        closeOnConfirm: false,
        closeOnCancel: false,
        showLoaderOnConfirm: true
    },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Xóa chuyến bay!", "Tất cả thông tin của chuyến bay này đều sẽ bị xóa", "success");
                    setTimeout(function () {
                        window.location = "XoaChuyenBay.jsp?idChuyenbay=" + idChuyenbay;
                    }, 1500);
                } else {
                    swal("Hủy bỏ xóa!", "Thông tin của bạn đã được an toàn!", "error");
                }
            });
}
;

//Kiểm tra Tin tức
function kiemtratintuc(a) {
    if (a == 1) {
        swal({
            title: "Cập nhật tin tức thành công!",
            text: "Chờ 3s để trở về trang quản lý!",
            type: "success",
            timer: 2000,
            showConfirmButton: false
        },
                function () {
                    setTimeout(function () {
                        window.location = "QuanLyTinTuc.jsp";
                    }, 500);
                });
    } else if (a == 0) {
        swal({
            title: "Cập nhật tin tức thất bại!",
            text: "Hãy kiểm tra lại các thông tin trước khi cập nhật!",
            type: "error",
            closeOnConfirm: false,
            showLoaderOnConfirm: true
        });
    }
}
;

//Kiểm tra Xóa thông tin Tin tức
function kiemtraxoatintuc(idTintuc) {
    var a = document.getElementById('xoatintuc');
    swal({
        title: "Bạn chắc chắn muốn xóa?",
        text: "Tất cả thông tin của tin tức này đều sẽ bị xóa hết!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Xóa bỏ!",
        cancelButtonText: "Hủy bỏ!",
        closeOnConfirm: false,
        closeOnCancel: false,
        showLoaderOnConfirm: true
    },
            function (isConfirm) {
                if (isConfirm) {
                    swal("Xóa tin tức!", "Tất cả thông tin của tin tức này đều sẽ bị xóa", "success");
                    setTimeout(function () {
                        window.location = "XoaTinTuc.jsp?idTintuc=" + idTintuc;
                    }, 1500);
                } else {
                    swal("Hủy bỏ xóa!", "Thông tin của bạn đã được an toàn!", "error");
                }
            });
}
;

//
function openInNewTab(url) {
  var win = window.open(url, '_blank');
  win.focus();
}
