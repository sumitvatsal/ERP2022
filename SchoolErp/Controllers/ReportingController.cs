using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolErp.Controllers
{
    [Authorize]
    public class ReportingController : Controller
    {
        // GET: Reporting
        public ActionResult Employees()
        {
            return View();
        }
        public ActionResult StudentsReport()
        {
            return View();
        }
        public ActionResult FeePaidReports()
        {
            return View();
        }

        public ActionResult StudentAttendencReport()
        {
            return View();
        }

        public ActionResult EmployeeAttendenceReports()
        {
            return View();
        }
        public ActionResult ExpensesReports()
        {
            return View();
        }

        public ActionResult ClassTeacherReports()
        {
            return View();
        }

        public ActionResult LeaveRequestReports()
        {
            return View();
        }

        public ActionResult SalaryReports()
        {
            return View();
        }

        public ActionResult UnpaidFeeReports()
        {
            return View();
        }

        public ActionResult EmployeeDailyAttendenceReports()
        {
            return View();
        }

    }
}