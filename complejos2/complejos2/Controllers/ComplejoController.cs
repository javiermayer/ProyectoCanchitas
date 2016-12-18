using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using complejos2.Models;

namespace complejos2.Controllers
{
    public class ComplejoController : Controller
    {
        //
        // GET: /Complejo/
        Complejos2Entities entidad = new Complejos2Entities();


        public ActionResult Index()
        {
            var ListaComplejos= entidad.complejo;
            return View(ListaComplejos.ToList());
        }
        public ActionResult ListaMaestraCanchas()
        {
            var ListaCanchas = entidad.cancha;
            return View(ListaCanchas.ToList());
        }

        public ActionResult HorarioPorCancha() {
            var modelo = from p in entidad.horas
                         from c in entidad.cancha
                         where p.id_horoas == c.horas select p;
                       
            return View(modelo.ToList());
        }

        public ActionResult ListadoComplejoConDescripcion() {
            var modelo = from p in entidad.complejo
                         join c in entidad.cancha
                         on p.id_complejo equals c.id_complejo

                         select new Lacancha
                         {
                             nombre= c.nombre,
                             ComplejoPerteneciente =p.nombre
                         };
            return View(modelo.ToList());

        }
    }
}