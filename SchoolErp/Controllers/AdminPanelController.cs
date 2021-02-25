using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolErp.Controllers
{
    [Authorize]
    public class AdminPanelController : Controller
    {
        // GET: AdminPanel

        public ActionResult Dashboard()
        {
            return View();
        }
        public ActionResult SuperAdminDashboard()
        {
            return View();
        }
        
      
        public ActionResult SchoolAdminDashboard()
        {
            return View();
        }
        public ActionResult StudentDashboard()
        {
            //ViewBag.CurrntDate = DateTime.Now.ToString("dddd ,MMMM dd, yyyy");
            //SCHOOLERPEntities db = new SCHOOLERPEntities();
            //var thoughts = db.tblThoughtsOfDays.SingleOrDefault();
            //ViewBag.thoughts = thoughts.Thoughts;
            return View();
        }

        public ActionResult SchoolDetails()
        {
            return View();
        }

        public ActionResult RoleAssignment()
        {
            return View();
        }
        public ActionResult SchoolRoleManagement()
        {
            return View();
        }
        public ActionResult AddAttendenceMachine()
        {
            return View();
        }
        public ActionResult ConferenceRoom()
        {
            return View();
        }

    }
}