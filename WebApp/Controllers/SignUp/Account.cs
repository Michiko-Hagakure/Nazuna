using Microsoft.AspNetCore.Mvc;

namespace WebApp.Controllers.SignUp
{
    public class Account : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult SignUp()
        {
            return View();
        }
    }
}
