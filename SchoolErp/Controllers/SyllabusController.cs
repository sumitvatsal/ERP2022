using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolErp.Controllers
{
    [Authorize]
    public class SyllabusController : Controller
    {
        // GET: Syllabus
        public ActionResult CreateSyllabus()
        {
            return View();
        }
        public ActionResult ViewSyllabus()
        {
            return View();
        }
        public ActionResult ViewStudentSyllabus()
        {
            return View();
        }
        public ActionResult ViewParentSyllabus()
        {
            return View();
        }
        
    }
}