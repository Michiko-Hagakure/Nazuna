// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
function verifyUser() {
    var user = $('#username').val();
    var pass = $('#password').val();
    if (user == '' || pass == '') {
        Swal.fire({
            icon: 'error',
            title: 'No information provided!',
            text: 'Please provide valid credential!'
        })
    } else {
        $.ajax({
            type: "POST",
            url: "/Index?handler=GetAjax",
            data: { "User": user, "Pass": pass },
            contentType: 'application/x-www-form-urlencoded',
            dataType: "json",
            headers: {
                "RequestVerificationToken":
                    $('input:hidden[name="__RequestVerificationToken"]').val()
            },
            success: function (accountVerified) {
                var falseORTrue = accountVerified;
                if (falseORTrue == true) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Success',
                        text: 'Username and Password is correct!'
                    })
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cant verify',
                        text: 'Username or Password is incorrect!'
                    })
                }
            }
        })
    }
}