/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function LoginFunction() {
    var username = document.getElementById('username');
    var password = document.getElementById('pwd');
    if (!username.value == "" && !password.value == "") {
        $('.progress').show();
        $('.progress-bar').animate({width: "100%"}, 100);
        $('#btndangnhap').hide();
    }
}