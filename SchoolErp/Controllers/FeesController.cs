﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SchoolErp.Controllers
{
    [Authorize]
    public class FeesController : Controller
    {
        // GET: Fees
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult FeeCategory()
        {
            return View();
        }
        public ActionResult FeeStructure()
        {
            return View();
        }
        public ActionResult FeeStructureConfig()
        {
            return View();
        }
        public ActionResult FeeStudentSearch()
        {
            return View();
        }
        public ActionResult FeeCalculation()
        {
            return View();
        }
        public ActionResult AssignFeeStructure()
        {
            return View();
        }
        public ActionResult FeeReceiptStudentList()
        {
            return View();
        }
        public ActionResult FeeReceipt()
        {
            return View();
        }
        public ActionResult StudentFeeDashBoard()
        {
            return View();
        }
        public ActionResult StudentFeeCalculation()
        {
            return View();
        }
        public ActionResult ParentsFeeDashBoard()
        {
            return View();
        }

        public ActionResult StudentFeeCalculationParent()
        {
            return View();
        }

    }
}