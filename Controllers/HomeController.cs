using Microsoft.AspNetCore.Mvc;

namespace WanderScape.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index() => View();
        public IActionResult Destinations() => View();
        public IActionResult Packages() => View();
        public IActionResult About() => View();
        public IActionResult Contact() => View();
    }
}
