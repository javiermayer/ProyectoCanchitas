using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using complejos2.Models;

namespace complejos2.App_Start.Controllers
{
    public class MantenimientoController : Controller
    {
        private Complejos2Entities db = new Complejos2Entities();

        //
        // GET: /Mantenimiento/

        public ActionResult Index()
        {
            var cancha = db.cancha.Include(c => c.horas1).Include(c => c.complejo).Include(c => c.tipo_cancha);
            return View(cancha.ToList());
        }

        //
        // GET: /Mantenimiento/Details/5

        public ActionResult Details(int id = 0)
        {
            cancha cancha = db.cancha.Find(id);
            if (cancha == null)
            {
                return HttpNotFound();
            }
            return View(cancha);
        }

        //
        // GET: /Mantenimiento/Create

        public ActionResult Create()
        {
            ViewBag.horas = new SelectList(db.horas, "id_horoas", "id_horoas");
            ViewBag.id_complejo = new SelectList(db.complejo, "id_complejo", "nombre");
            ViewBag.id_tipo = new SelectList(db.tipo_cancha, "id_tipo", "descripcion");
            return View();
        }

        //
        // POST: /Mantenimiento/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(cancha cancha)
        {
            if (ModelState.IsValid)
            {
                db.cancha.Add(cancha);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.horas = new SelectList(db.horas, "id_horoas", "id_horoas", cancha.horas);
            ViewBag.id_complejo = new SelectList(db.complejo, "id_complejo", "nombre", cancha.id_complejo);
            ViewBag.id_tipo = new SelectList(db.tipo_cancha, "id_tipo", "descripcion", cancha.id_tipo);
            return View(cancha);
        }

        //
        // GET: /Mantenimiento/Edit/5

        public ActionResult Edit(int id = 0)
        {
            cancha cancha = db.cancha.Find(id);
            if (cancha == null)
            {
                return HttpNotFound();
            }
            ViewBag.horas = new SelectList(db.horas, "id_horoas", "id_horoas", cancha.horas);
            ViewBag.id_complejo = new SelectList(db.complejo, "id_complejo", "nombre", cancha.id_complejo);
            ViewBag.id_tipo = new SelectList(db.tipo_cancha, "id_tipo", "descripcion", cancha.id_tipo);
            return View(cancha);
        }

        //
        // POST: /Mantenimiento/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(cancha cancha)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cancha).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.horas = new SelectList(db.horas, "id_horoas", "id_horoas", cancha.horas);
            ViewBag.id_complejo = new SelectList(db.complejo, "id_complejo", "nombre", cancha.id_complejo);
            ViewBag.id_tipo = new SelectList(db.tipo_cancha, "id_tipo", "descripcion", cancha.id_tipo);
            return View(cancha);
        }

        //
        // GET: /Mantenimiento/Delete/5

        public ActionResult Delete(int id = 0)
        {
            cancha cancha = db.cancha.Find(id);
            if (cancha == null)
            {
                return HttpNotFound();
            }
            return View(cancha);
        }

        //
        // POST: /Mantenimiento/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            cancha cancha = db.cancha.Find(id);
            db.cancha.Remove(cancha);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}