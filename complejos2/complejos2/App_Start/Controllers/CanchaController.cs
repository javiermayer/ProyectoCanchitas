using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using complejos2.Models;

namespace complejos2.Controllers
{
    public class CursoController : Controller
    {
        //
        // GET: /Curso/
        private Complejos2Entities bd = new Complejos2Entities();
        public ActionResult Index()
        {

            return View(bd.cancha.ToList());
        }
        public ActionResult crearCancha()
        {

            return View();
        }
        [HttpPost]
        public ActionResult crearCancha(cancha cancha)
        {
            if (ModelState.IsValid)
            {
                bd.cancha.Add(cancha);
                bd.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View(cancha);
            }


        }

        [HttpPost]
        public ActionResult eliminarCancha(cancha cancha)
        {
            if (ModelState.IsValid)
            {
                bd.cancha.Remove(cancha);
                bd.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                return View(cancha);
            }


        }


    }
}
