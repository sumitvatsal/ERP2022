using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;



using schoolERP_BLL;



namespace SchoolErp.Controllers
{
    [Authorize]
    public class MastersController : Controller
    {
        SCHOOLERPEntities db = new SCHOOLERPEntities();
        // GET: Masters
        public ActionResult NewCountry()
        {
            return View();
       
        }

        public ActionResult NewState()
        {
            return View();
        }
        public ActionResult Gallery()
        {
            return View();
        }
        public ActionResult NewCity()
        {
            return View();
        }

        public ActionResult AddCourse()
        {
            return View();
        }

        public ActionResult AddBatch()
        {
            return View();
        }

        public ActionResult AddSection() {
            return View();
        }

        public ActionResult AddDesignation()
        {
            return View();
        }

        public ActionResult AddCast()
        {
            return View();
        }


        public ActionResult MasterStatus()
        {
            return View();
        }

        public ActionResult RoleMaster()
        {
            return View();
        }

        public ActionResult DepartmentMaster()
        {
            return View();
        }


        public ActionResult QualficationMaster()
        {
            return View();
        }


        public ActionResult MasterCastCategory()
        {
            return View();
        }

        public ActionResult StreamMaster()
        {
            return View();
        }

        public ActionResult DocumentMaster()
        {
            return View();
        }

        public ActionResult DocumentationNo() {

            return View();
        }

        public ActionResult SubjectMaster()
        {
            return View();
        }
        public ActionResult ClassTeacherMaster()
        {
            return View();
        }
        
        public ActionResult TeacherSubjectAllocation()
        {
            return View();
        }

        public ActionResult NewSchool()
        {
            return View();
        }
        public ActionResult AddDesignationSchoolAdmin()
        {
            return View();
        }
        public ActionResult DepartmentMasterSchoolAdmin()
        {
            return View();
        }
        public ActionResult QualficationMasterSchoolAdmin()
        {

            return View();
        }
        public ActionResult ViewEmployeeSchoolAdmin()
        {
            return View();
        }
        public ActionResult DocumentationNoSchoolAdmin()
        {
            return View();
        }

        public ActionResult DocumentMasterSchoolAdmin()
        {
            return View();
        }
        public ActionResult SchoolSmsDetails()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ViewPage1()
        {
            return View();
        }
        [HttpPost]
        public string testmethod(string number)
        {
            string a = number;
            return a;
        }
      
        

        //[HttpPost]
        //public ActionResult ViewPage1()
        //{
        //    return View();
        //}
    }
}