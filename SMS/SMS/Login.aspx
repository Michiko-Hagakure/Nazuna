<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SMS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .login,
        .image {
            min-height: 100vh;
        }
        .bg-image {
            background-image: url('Images/Student Management.png');
            background-repeat: no-repeat;
        }
    </style>

    <script>

        function logFailed() {
            Swal.fire(
                'Login Failed!',
                'Incorrect Email or Password',
                'error'
            )
        }
        function logSuccess() {
            swal({
                title: "Login",
                text: "Login Success Redirecting in 3 seconds",
                type: "success",
                timer: 2000
            })
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row no-gutters">

                <div class="col-md-6 d-none d-md-flex bg-image"></div>

                <div class="col-md-6 bg-light">
                    <div class="login d-flex align-items-center py-5">

                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-4 pb-3">Sign In</h3>
                                    <p class="text-muted mb-4">Login</p>
                                    <div class="form-group mb-3">
                                        <input id="inputEmail" type="text" placeholder="Email address" required runat="server" autofocus="" class="form-control rounded-pill border-0 shadow-sm" />
                                    </div>

                                    <div class="form-group mb-3 mb-2">
                                        <input id="inputPassword" type="password" placeholder="••••••••" required runat="server" class="form-control rounded-pill border-0 shadow-sm" />
                                    </div>

                                    <asp:Button ID="btnLogin" runat="server" Text="Sign in" CssClass="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" BackColor="#5558C" OnClick="btnLogin_Click" />
                                    <div class="text-center d-flex justify-content-between mt-4">
                                        
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
