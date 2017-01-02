using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using complejos2.Models;
namespace complejos2.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Usuario/
        private Complejos2Entities bd = new Complejos2Entities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Validar()
        {
            if (Request.Cookies["nombreUsuario"] != null) {

                Response.Cookies["nombreUsuario"].Expires = DateTime.Now.AddDays(-1);
            }
            if (Request.Cookies["nombre_usuario"] != null)
            {
                Response.Cookies["nombre_usuario"].Expires = DateTime.Now.AddDays(-1);
            }

            return View();
        }
        [HttpPost]
        
        public ActionResult Validar(string user, string pasword)
        {
            //IEnumerable<usuario> objeto = null;
            //usuario usuario = new usuario();
            //objeto = usuario.



            usuario us =  bd.usuario.FirstOrDefault(d => d.nombreUsuario == user & d.contraseña == pasword);
            if (us != null)
            {
                //Request.Cookies["NombreUsuario"]= us.nombreUsuario.ToString();
                
                HttpCookie myCookie = new HttpCookie("UserSettings");
                myCookie["nombreUsuario"] = us.nombreUsuario;
                myCookie["nombre_usuario"] = us.nombre_usuario;
                myCookie.Expires = DateTime.Now.AddDays(1d);
                Response.Cookies.Add(myCookie);
          
                return RedirectToAction("Index", "Mantenimiento");
            }
            else
            {
                return RedirectToAction("NoHallado", "Login");
            }
            


        }
        public ActionResult NoHallado()
        {
            ViewBag.Error = ("no se encontro usuario o contraseña");
            return View();
        }

      


    }
}

