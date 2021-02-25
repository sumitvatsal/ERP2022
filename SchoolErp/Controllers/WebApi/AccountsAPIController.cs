using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using schoolERP_BLL;
using System.Data;
using System.Globalization;
using iTextSharp;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI;
using System.ComponentModel;

using System.Drawing;
using System.Web;
using System.Web.SessionState;



namespace SchoolErp.Controllers.WebApi
{
   
    public class AccountsAPIController : ApiController
    {
        SCHOOLERPEntities db = new SCHOOLERPEntities();
       
        [System.Web.Http.Route("api/AccountsAPI/SaveHolidays")]
        [System.Web.Http.HttpPost]
        public string SaveHolidays(List<string> val)
        {
            //List<DateTime> li = new List<DateTime>();

            //DateTime stdt = Convert.ToDateTime(val[2]);
            //DateTime endt = Convert.ToDateTime(val[3]);
            //while (stdt <= endt)
            //{
            //    li.Add(stdt);
            //    stdt = stdt.AddDays(1);
            //}

            //validation should be there for date already assigned
                Holiday a = new Holiday();
           
            
                int ID = Convert.ToInt32(val[6]);

                if (ID == 0)
                {
                int SchoolIDch = Convert.ToInt32(val[5]);
                var checkdates = db.tblHolidays.Where(x => x.IsDeleted == null && x.SchoolID == SchoolIDch).ToList();
                int avi = 0;
                //int count = 0;
                foreach (var qq in checkdates)
                {


                    DateTime dbfromdate = Convert.ToDateTime(qq.DateFrom);
                    DateTime dbToDate = Convert.ToDateTime(qq.DateTo);
                    DateTime fromdate = Convert.ToDateTime(val[2]);
                    DateTime ToDate = Convert.ToDateTime(val[3]);
                    if ((fromdate >= dbfromdate && fromdate <= dbToDate) || (ToDate >= dbfromdate && ToDate <= dbToDate))
                    {


                        avi++;
                        //a.msg = avi+"Date Between Selected date ,already assigned as Holiday ";

                    }
                    else if (fromdate < dbfromdate && ToDate > dbToDate)
                    {
                        avi++;
                        //a.msg = avi + "Date Between Selected date ,already assigned as Holiday ";
                    }



                }
                if (avi != 0)
                {
                    a.msg = avi + "Holidays entry exist in Between Selected date ";
                }
                else
                {
                    tblHoliday hl = new tblHoliday();
                    hl.Name = val[0];
                    hl.Description = val[1];
                    hl.DateFrom = Convert.ToDateTime(val[2]);
                    hl.DateTo = Convert.ToDateTime(val[3]);
                    hl.AcademicYear = Convert.ToInt32(val[4]);
                    hl.SchoolID = Convert.ToInt32(val[5]);
                    hl.leaveCount = Convert.ToInt32(val[7]);
                    db.tblHolidays.Add(hl);
                    db.SaveChanges();
                    a.msg = "Holiday Assigned Successfully";
                }
               
                }
                else
                {
                    var check = db.tblHolidays.Where(x => x.ID == ID).FirstOrDefault();
                    if (check != null)
                    {
                    int SchoolIDch = Convert.ToInt32(val[5]);
                    var checkdates = db.tblHolidays.Where(x => x.IsDeleted == null && x.SchoolID == SchoolIDch &&x.ID!=ID).ToList();
                    int avi = 0;
                    //int count = 0;
                    foreach (var qq in checkdates)
                    {


                        DateTime dbfromdate = Convert.ToDateTime(qq.DateFrom);
                        DateTime dbToDate = Convert.ToDateTime(qq.DateTo);
                        DateTime fromdate = Convert.ToDateTime(val[2]);
                        DateTime ToDate = Convert.ToDateTime(val[3]);
                        if ((fromdate >= dbfromdate && fromdate <= dbToDate) || (ToDate >= dbfromdate && ToDate <= dbToDate))
                        {


                            avi++;
                            //a.msg = avi+"Date Between Selected date ,already assigned as Holiday ";

                        }
                        else if (fromdate < dbfromdate && ToDate > dbToDate)
                        {
                            avi++;
                            //a.msg = avi + "Date Between Selected date ,already assigned as Holiday ";
                        }



                    }
                    if (avi != 0)
                    {
                        a.msg = avi + "Holidays entry exist in Between Selected date ";
                    }
                    else
                    {
                        check.Name = val[0];
                        check.Description = val[1];
                        check.DateFrom = Convert.ToDateTime(val[2]);
                        check.DateTo = Convert.ToDateTime(val[3]);
                        check.AcademicYear = Convert.ToInt32(val[4]);
                        check.SchoolID = Convert.ToInt32(val[5]);
                        check.leaveCount = Convert.ToInt32(val[7]);
                        db.SaveChanges();
                        a.msg = "Holiday Updates Successfully";
                    }

                       
                    }

                }
            
          

           



            return a.msg;
        }

        [System.Web.Http.Route("api/AccountsAPI/getAllHolidaysDetails")]
        [System.Web.Http.HttpPost]
        public Holiday[] getAllHolidaysDetails(List<string> val)
        {
            List<Holiday> list = new List<Holiday>();
            int SchoolID = Convert.ToInt32(val[0]);
            int c = 0;
            var result = (from hol in db.tblHolidays join
                         ac in db.tblAcademicYears on hol.AcademicYear equals ac.ID
                          join sc in db.tblSchoolDetails on hol.SchoolID equals sc.ID
                          where hol.SchoolID==SchoolID && hol.IsDeleted== null
                          select new
                          {
                              model = hol,
                              model1=ac,
                              Schoolname =sc.School

                          }
                          ).ToList();
                      
           foreach( var a in result)
            {
                c++;
                Holiday Holida = new Holiday();
                Holida.ID = a.model.ID;
                Holida.Name = a.model.Name;
                Holida.Description = a.model.Description;
                Holida.DateFrom =( (DateTime) a.model.DateFrom).ToString("MM/dd/yyyy",CultureInfo.InvariantCulture);
                Holida.DateTo = ((DateTime)a.model.DateTo).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                Holida.AcademicYear = a.model1.DateFrom.ToString("yyyy") + "-" + a.model1.DateTo.ToString("yyyy");
                Holida.School = a.Schoolname;
                Holida.count = c;
                Holida.days = Convert.ToInt32( a.model.leaveCount);
                list.Add(Holida);
            }

            return list.ToArray();

        }

      [System.Web.Http.Route("api/AccountsAPI/DeleteHolidays")]
      [System.Web.Http.HttpPost]
      public string DeleteHolidays(List<string> aa)
        {
            tblHoliday hl = new tblHoliday();
            int idd =Convert.ToInt32 (aa[0]);
            var check = db.tblHolidays.Where(x => x.ID == idd).FirstOrDefault();
         
            if (check !=null)
            {

                check.IsDeleted = 1;
                check.Deleted_on = DateTime.Now;
                
                db.SaveChanges();
            }
            return "Holiday Deleted Sucessfully";


            //tblHoliday hl = new tblHoliday();
            //int idd = Convert.ToInt32(aa[0]);
            //var check = db.tblHolidays.Where(x => x.ID == idd).FirstOrDefault();
            //if (check != null)
            //{
            //    db.tblHolidays.Remove(check);
            //    db.SaveChanges();
            //}
            //return "Holiday Deleted Sucessfully";

        }

            //[System.Web.Http.Route("api/AccountsAPI/TimeTableNEWWW")]
            //[System.Web.Http.HttpPost]


        //public string TimeTableNEWWW(List<string> val)
        //{

        //     TimeTableNEWW tt = new TimeTableNEWW();
        //    tbltimetableNew tt = new tbltimetableNew();
        //    tt.SchoolID = Convert.ToInt32(val[10]);
        //    tt.AcademicYear = Convert.ToInt32(val[0]);
        //    tt.Class = Convert.ToInt32(val[1]);
        //    tt.Section = Convert.ToInt32(val[2]);
        //    tt.Subject = Convert.ToInt32(val[3]);
        //    tt.TeacherID = Convert.ToInt32(val[4]);
        //    tt.Status = Convert.ToInt32(val[9]);
        //    DateTime starttimee = timeTo24Hrs(val[6]);
        //    TimeSpan ttst = starttimee.TimeOfDay;
        //    tt.StartTime = ttst;
        //    DateTime Endtimee = timeTo24Hrs(val[7]);
        //    TimeSpan ttEt = Endtimee.TimeOfDay;
        //    tt.EndTime = ttEt;
        //    tt.name = val[5];
        //    tt.WeekDays = val[8];
        //    db.tbltimetableNews.Add(tt);
        //    db.SaveChanges();
        //    return "";


        //}
        public DateTime timeTo24Hrs(string TimeFormat)
        {
            DateTime dt = DateTime.Parse(TimeFormat);
            return dt;
        }
        [System.Web.Http.Route("api/AccountsAPI/saveCategory")]
        [System.Web.Http.HttpPost]
        public string saveCategory(ExpCategory exp)
        {
            if (string.IsNullOrEmpty(exp.Id))
            {

                var check = db.tblExpenseCategories.Where(s => s.CategoryName == exp.Name && s.SchoolID==exp.SchoolID && s.IsDeleted==null).FirstOrDefault();
                if (check==null)
                {
                    tblExpenseCategory tb = new tblExpenseCategory();
                    tb.Id = Convert.ToInt16(exp.Id);
                    tb.CategoryName = exp.Name;
                    tb.Status = Convert.ToBoolean(exp.Status);
                    tb.SchoolID = Convert.ToInt32(exp.SchoolID);
                    db.tblExpenseCategories.Add(tb);
                    db.SaveChanges();
                    return "Category Inserted Successfully";
                }
                else
                {
                    return "Category name already Exist ";
                }
              
            }
            else
            {
                int idd = Convert.ToInt16(exp.Id);
                var check = db.tblExpenseCategories.Where(s => s.CategoryName == exp.Name && s.Id != idd && s.SchoolID==exp.SchoolID && s.IsDeleted==null).FirstOrDefault();
                if (check == null)
                {
                    var result = db.tblExpenseCategories.SingleOrDefault(s => s.Id == idd);
                    result.CategoryName = exp.Name;
                    result.Status = Convert.ToBoolean(exp.Status);
                    result.SchoolID = Convert.ToInt32(exp.SchoolID);
                    db.SaveChanges();
                    return "Category Updated Successfully";
                }
                else
                {
                    return "Category name already Exist ";
                }
            }
        }


        [System.Web.Http.Route("api/AccountsAPI/getAllCategory")]
        [System.Web.Http.HttpPost]
        public List<ExpCategory> getAllCategory(List <string> aa)
        {
            List<ExpCategory> list = new List<ExpCategory>();
            string loginuser = aa[0];
            int typeuser = Convert.ToInt32(aa[1]);


            if (typeuser == 2)
            {
                var result = (from a in db.tblExpenseCategories
                              join s in db.tblSchoolDetails on a.SchoolID equals s.ID
                              where a.IsDeleted == null
                              select new
                              {
                                  model = a,
                                  SchoolName = s.School
                              }

                          ).ToList();
                //  var result = db.tblExpenseCategories.ToList();
                foreach (var a in result)
                {
                    ExpCategory usr = new ExpCategory();
                    usr.Name = a.model.CategoryName;
                    usr.Id = a.model.Id.ToString();
                    usr.Status = a.model.Status.ToString();
                    if (a.model.Status.ToString() == "True")
                    {
                        usr.Status = "Activate";
                        usr.Extra10 = "btn btn-block btn-success btn-sm";
                    }
                    else
                    {
                        usr.Status = "DeActivate";
                        usr.Extra10 = "btn btn-block btn-danger btn-sm";
                    }
                    usr.School = a.SchoolName;
                    usr.SchoolID = Convert.ToInt32(a.model.SchoolID);
                    list.Add(usr);
                }
            }
            else
            {
                var result = (from a in db.tblExpenseCategories
                              join s in db.tblSchoolDetails on a.SchoolID equals s.ID
                              join em in db.tblEmployees on a.SchoolID equals em.SchoolID
                              where em.UserID == loginuser && em.IsDeleted==null && a.IsDeleted == null
                              select new
                              {
                                  model = a,
                                  SchoolName = s.School
                              }

                          ).ToList();
                //  var result = db.tblExpenseCategories.ToList();
                foreach (var a in result)
                {
                    ExpCategory usr = new ExpCategory();
                    usr.Name = a.model.CategoryName;
                    usr.Id = a.model.Id.ToString();
                    usr.Status = a.model.Status.ToString();
                    if (a.model.Status.ToString() == "True")
                    {
                        usr.Status = "Activate";
                        usr.Extra10 = "btn btn-block btn-success btn-sm";
                    }
                    else
                    {
                        usr.Status = "DeActivate";
                        usr.Extra10 = "btn btn-block btn-danger btn-sm";
                    }
                    usr.School = a.SchoolName;
                    usr.SchoolID = Convert.ToInt32(a.model.SchoolID);
                    list.Add(usr);
                }
            }
            return list;
            
        }


        [System.Web.Http.Route("api/AccountsAPI/deleteCategoyById")]
        [System.Web.Http.HttpPost]
        public string deleteCategoyById(Int32 id)
        {
            int idd = Convert.ToInt32(id);
            var aa = db.tblExpenseCategories.SingleOrDefault(s => s.Id == idd);
            aa.IsDeleted = 1;
            aa.Deleted_on = DateTime.Now;
            //var result = new tblExpenseCategory { Id = id };
            //db.Entry(result).State = System.Data.Entity.EntityState.Deleted;
            db.SaveChanges();
            return "Category Deleted Successfully";

        }


        [System.Web.Http.Route("api/AccountsAPI/getAllActiveCategoryBySchool")]
        [System.Web.Http.HttpPost]
        public List<ExpCategory> getAllActiveCategoryBySchool(List<string> id)
        {
            int SchoolID = Convert.ToInt32( id[0]);
            List<ExpCategory> list = new List<ExpCategory>();
            var result = db.tblExpenseCategories.Where(s => s.Status == true && s.SchoolID== SchoolID && s.IsDeleted==null).ToList();
            foreach (var a in result)
            {
                ExpCategory usr = new ExpCategory();
                usr.Name = a.CategoryName;
                usr.Id = a.Id.ToString();
                list.Add(usr);
            }
            return list;
        }

        [System.Web.Http.Route("api/AccountsAPI/getAllActiveCategory")]
        [System.Web.Http.HttpPost]
        public List<ExpCategory> getAllActiveCategory()
        {
            List<ExpCategory> list = new List<ExpCategory>();
            var result = db.tblExpenseCategories.Where(s=>s.Status==true).ToList();
            foreach (var a in result)
            {
                ExpCategory usr = new ExpCategory();
                usr.Name = a.CategoryName;
                usr.Id = a.Id.ToString();
                list.Add(usr);
            }
            return list;
        }

        [System.Web.Http.Route("api/AccountsAPI/savePayeementsDetails")]
        [System.Web.Http.HttpPost]
        public string savePayeementsDetails(PayeeDetails pd)
        {
            if (string.IsNullOrEmpty(pd.Id))
            {
                tblExPayeeDetail pay = new tblExPayeeDetail();
                pay.PayeeName = pd.Name;
                pay.CategoryId = pd.Category;
                pay.PrimaryDate = Convert.ToDateTime(pd.PrimaryDate);
                pay.LastDate = Convert.ToDateTime(pd.LastDate);
                pay.TotalAmount = pd.TotalAmount;
                pay.DuesAmount = pd.DuesAmount;
                pay.PaymentType = Convert.ToInt64(pd.PaymentType);
                pay.SchoolID = Convert.ToInt32(pd.SchoolID);
                if (pay.PaymentType == 3)
                {
                    pay.PayingAmount = pd.PayingAmount;
                }
                if (pay.PaymentType == 1 || pay.PaymentType == 2)
                {
                    pay.PayingAmount = pd.PayingAmount;

                    pay.PaymentDate = Convert.ToDateTime(pd.PaymentDate);
                    pay.PaymentMode = pd.PaymentMode;
                    if (pay.PaymentMode == "Cheque")
                    {
                        pay.ChequeNo = pd.Checqno;
                        pay.ChequeDate = Convert.ToDateTime(pd.ChequeDate);
                        pay.BankName = pd.BankRemarks;
                    }



                    pay.Remarks = pd.Remarks;
                }
                //   pay.Status = Convert.ToBoolean(pd.Status);
                db.tblExPayeeDetails.Add(pay);
                db.SaveChanges();

                int id = pay.Id;
                if (pay.PaymentType != 3)
                {

                    tblTransExPayeeDetail pay1 = new tblTransExPayeeDetail();
                    pay1.ExpDetailsId = Convert.ToInt64(id);
                    pay1.PayingAmount = pd.PayingAmount;
                    pay1.PaymentDate = Convert.ToDateTime(pd.PaymentDate);
                    pay1.PaymentMode = pd.PaymentMode;
                    if (pay1.PaymentMode == "Cheque")
                    {
                        pay1.chequeNo = pd.Checqno;
                        pay1.ChequeDate = Convert.ToDateTime(pd.ChequeDate);
                        pay1.BankName = pd.BankRemarks;
                    }

                    pay1.Remarks = pd.Remarks;
                    pay1.SchoolID = pd.SchoolID;
                    db.tblTransExPayeeDetails.Add(pay1);
                    db.SaveChanges();
                }


                return "Payment Added Successfully";

            }
            else
            {
                int id = Convert.ToInt16(pd.Id);
                var result = db.tblExPayeeDetails.SingleOrDefault(s => s.Id == id);
                result.PayeeName = pd.Name;
                result.CategoryId = pd.Category;
                result.PrimaryDate = Convert.ToDateTime(pd.PrimaryDate);
                result.LastDate = Convert.ToDateTime(pd.LastDate);
                result.TotalAmount = pd.TotalAmount;
                result.PaymentType = Convert.ToInt64(pd.PaymentType);
                result.SchoolID = Convert.ToInt32(pd.SchoolID);
                if (pd.PaymentType == "1" && pd.PaymentType == "2")
                {
                    result.PayingAmount = pd.PayingAmount;
                    result.PaymentDate = Convert.ToDateTime(pd.PaymentDate);
                    if (pd.PaymentMode == "Cheque")
                    {
                        result.PaymentMode = pd.PaymentMode;
                        result.ChequeNo = pd.Checqno;
                        result.ChequeDate = Convert.ToDateTime(pd.ChequeDate);
                        result.BankName = pd.BankRemarks;
                    }
                    result.Remarks = pd.Remarks;
                }
                //  result.Status = Convert.ToBoolean(pd.Status);
                db.SaveChanges();
                return "Payment Updated Successfully";
            }

        }

        [System.Web.Http.Route("api/AccountsAPI/getAllPaymentDetails")]
        [System.Web.Http.HttpPost]
        public List<PayeeDetails> getAllPaymentDetails(List<string> aa)
        {
            List<PayeeDetails> list = new List<PayeeDetails>();
            string loginuser = aa[0];
            int typeuser = Convert.ToInt32(aa[1]);
            sqlHelper obj = new sqlHelper();
           
             if(typeuser==2)
            {
                DataTable dt = obj.getDataTable(@"select s.School,ep.SchoolID,ec.CategoryName,case when ep.PaymentType='1' then 'Pay Now' when
                                           ep.PaymentType = '2' then 'Pay Now' else 'Pay Later' end paymentType, ep.* from tblExPayeeDetails ep
                                           left outer join tblExpenseCategory ec on ec.Id = ep.CategoryId join tblSchoolDetails s on s.ID=ep.SchoolID
                                           where DuesAmount!='0' and ep.IsDeleted is null ");

                //            DataTable dt = obj.getDataTable(@"select ec.CategoryName,case when ep.PaymentType='1' then 'Pay Now' when
                //ep.PaymentType = '2' then 'Pay Now' else 'Pay Later' end paymentType, ep.* from tblExPayeeDetails ep
                //   left outer join tblExpenseCategory ec on ec.Id = ep.CategoryId where DuesAmount!='0'");
                foreach (DataRow dr in dt.Rows)
                {
                    PayeeDetails usr = new PayeeDetails();
                    usr.Category = dr["CategoryName"].ToString();
                    usr.Id = dr["Id"].ToString();
                    usr.Name = dr["PayeeName"].ToString();

                    usr.PaymentType = dr["paymentType"].ToString();
                    usr.TotalAmount = dr["TotalAmount"].ToString();
                    usr.PayingAmount = dr["PayingAmount"].ToString();
                    usr.DuesAmount = dr["DuesAmount"].ToString();
                    usr.PrimaryDate = ((DateTime)dr["PrimaryDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    usr.LastDate = ((DateTime)dr["LastDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
                    usr.School = dr["School"].ToString();
                    list.Add(usr);
                }
            }
             else
            {
                DataTable dt = obj.getDataTable(@"select s.School,ep.SchoolID,ec.CategoryName,case when ep.PaymentType='1' then 'Pay Now' when
                                           ep.PaymentType = '2' then 'Pay Now' else 'Pay Later' end paymentType, ep.* from tblExPayeeDetails ep
                                           left outer join tblExpenseCategory ec on ec.Id = ep.CategoryId join tblSchoolDetails s on s.ID=ep.SchoolID
                                           left outer join tblEmployee em on ep.SchoolID =em.SchoolID where em.UserID= '" + loginuser + "' and em.IsDeleted is null and DuesAmount!='0' and ep.IsDeleted is null ");

                //            DataTable dt = obj.getDataTable(@"select ec.CategoryName,case when ep.PaymentType='1' then 'Pay Now' when
                //ep.PaymentType = '2' then 'Pay Now' else 'Pay Later' end paymentType, ep.* from tblExPayeeDetails ep
                //   left outer join tblExpenseCategory ec on ec.Id = ep.CategoryId where DuesAmount!='0'");
                foreach (DataRow dr in dt.Rows)
                {
                    PayeeDetails usr = new PayeeDetails();
                    usr.Category = dr["CategoryName"].ToString();
                    usr.Id = dr["Id"].ToString();
                    usr.Name = dr["PayeeName"].ToString();

                    usr.PaymentType = dr["paymentType"].ToString();
                    usr.TotalAmount = dr["TotalAmount"].ToString();
                    usr.PayingAmount = dr["PayingAmount"].ToString();
                    usr.DuesAmount = dr["DuesAmount"].ToString();
                    usr.PrimaryDate = ((DateTime)dr["PrimaryDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    usr.LastDate = ((DateTime)dr["LastDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
                    usr.School = dr["School"].ToString();
                    list.Add(usr);
                }
            }
            return list;
        }

        [System.Web.Http.Route("api/AccountsAPI/countpaymentAllTypeBySchool")]
        [System.Web.Http.HttpPost]
        public string countpaymentAllTypeBySchool(List<string> id)
        {
            int SchoolID = Convert.ToInt32 (id[0]);
            sqlHelper obj = new sqlHelper();
            string TotalAmount = obj.ExecuteScaler("select SUM(cast(TotalAmount as float)) TotalAmount from tblExPayeeDetails where  SchoolID='"+ SchoolID + "' and IsDeleted is null and DuesAmount!='0'");
            string PaidAmount = obj.ExecuteScaler("select SUM(cast(PayingAmount as float)) TotalAmount from tblExPayeeDetails where SchoolID='" + SchoolID + "' and IsDeleted is null and DuesAmount!='0'");
            string DuesAmount = obj.ExecuteScaler("select SUM(cast(DuesAmount as float)) TotalAmount from tblExPayeeDetails where SchoolID='" + SchoolID + "' and IsDeleted is null and DuesAmount!='0'");
            return TotalAmount + "***" + PaidAmount + "***" + DuesAmount;
        }


        [System.Web.Http.Route("api/AccountsAPI/countpaymentAllType")]
        [System.Web.Http.HttpPost]
        public string countpaymentAllType()
        {
            sqlHelper obj = new sqlHelper();
            string TotalAmount = obj.ExecuteScaler("select SUM(cast(TotalAmount as float)) TotalAmount from tblExPayeeDetails where DuesAmount!='0'");
            string PaidAmount = obj.ExecuteScaler("select SUM(cast(PayingAmount as float)) TotalAmount from tblExPayeeDetails where DuesAmount!='0'");
            string DuesAmount = obj.ExecuteScaler("select SUM(cast(DuesAmount as float)) TotalAmount from tblExPayeeDetails where DuesAmount!='0'");
            return TotalAmount+"***"+PaidAmount+"***"+DuesAmount;
        }

        [System.Web.Http.Route("api/AccountsAPI/editPaymentUpdateDetails")]
        [System.Web.Http.HttpPost]
        public PayeeDetails editPaymentUpdateDetails(List<string> id)
        {
        
            sqlHelper obj = new sqlHelper();
            DataTable dt = obj.getDataTable(@"select s.School,ep.SchoolID, ec.CategoryName,case when ep.PaymentType='1' then 'Pay Now' when
                            ep.PaymentType = '2' then 'Pay Now' else 'Pay Later' end paymentType, ep.* from tblExPayeeDetails ep
                            left outer join tblExpenseCategory ec on ec.Id = ep.CategoryId join tblSchoolDetails s on s.ID=ep.SchoolID
                            where ep.Id=" + id[0]);
            //DataTable dt = obj.getDataTable(@"select ec.CategoryName,case when ep.PaymentType='1' then 'Pay Now' when
            //                ep.PaymentType = '2' then 'Pay Now' else 'Pay Later' end paymentType, ep.* from tblExPayeeDetails ep
            //                left outer join tblExpenseCategory ec on ec.Id = ep.CategoryId
            //                where ep.Id=" + id[0]);
            PayeeDetails usr = new PayeeDetails();
            foreach (DataRow dr in dt.Rows)
            {
               // PayeeDetails usr = new PayeeDetails();
                usr.Category = dr["CategoryName"].ToString();
                usr.Id = dr["Id"].ToString();
                usr.Name = dr["PayeeName"].ToString();
                usr.PaymentType = dr["paymentType"].ToString();
                usr.TotalAmount = dr["TotalAmount"].ToString();
                usr.PayingAmount = dr["PayingAmount"].ToString();
                usr.DuesAmount = dr["DuesAmount"].ToString();
                usr.PrimaryDate = ((DateTime)dr["PrimaryDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                usr.LastDate = ((DateTime)dr["LastDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                usr.School = dr["School"].ToString();
                usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
               
            }
            return usr;
        }

        [System.Web.Http.Route("api/AccountsAPI/updatePayeementsDetails")]
        [System.Web.Http.HttpPost]
        public string updatePayeementsDetails(PayeeDetails pd)
        {
             
                tblTransExPayeeDetail pay = new tblTransExPayeeDetail();
                pay.ExpDetailsId = Convert.ToInt32(pd.Id);
              
                    pay.PayingAmount = pd.PayingAmount;

                    pay.PaymentDate = Convert.ToDateTime(pd.PaymentDate);
                    pay.PaymentMode = pd.PaymentMode;
                    if (pay.PaymentMode == "Cheque")
                    {
                        pay.chequeNo = pd.Checqno;
                        pay.ChequeDate = Convert.ToDateTime(pd.ChequeDate);
                        pay.BankName = pd.BankRemarks;
                    }
 
                    pay.Remarks = pd.Remarks;
                   pay.SchoolID = pd.SchoolID;
                db.tblTransExPayeeDetails.Add(pay);
                db.SaveChanges();
            sqlHelper obj = new sqlHelper();
            string PreviousDueAmount = obj.ExecuteScaler("select DuesAmount from tblExPayeeDetails where SchoolID='"+pd.SchoolID+ "' and IsDeleted is null and Id=" + pd.Id);
            string PreviousPaidAmount = obj.ExecuteScaler("select PayingAmount from tblExPayeeDetails where SchoolID='" + pd.SchoolID + "' and IsDeleted is null and Id=" + pd.Id);
            int id = Convert.ToInt32(pd.Id);
            var result = db.tblExPayeeDetails.SingleOrDefault(s => s.Id == id && s.SchoolID==pd.SchoolID);
            //Int64 due = Convert.ToInt64(PreviousDueAmount) - Convert.ToInt64(pd.PayingAmount);
            result.DuesAmount = (Convert.ToInt64(PreviousDueAmount) - Convert.ToInt64(pd.PayingAmount)).ToString();
            result.PayingAmount= (Convert.ToInt64(PreviousPaidAmount) + Convert.ToInt64(pd.PayingAmount)).ToString();
            db.SaveChanges();
            return "OK";





        }


        [System.Web.Http.Route("api/AccountsAPI/deletePayableDetailsById")]
        [System.Web.Http.HttpPost]
        public string deletePayableDetailsById(List<string> id)
        {
            Int32 idd = Convert.ToInt32(id[0]);
            //var  tbl = new tblExPayeeDetail { Id = idd };
            //db.Entry(tbl).State = System.Data.Entity.EntityState.Deleted;
            var aa = db.tblExPayeeDetails.SingleOrDefault(s => s.Id == idd);
            aa.IsDeleted = 1;
            aa.Deleted_on = DateTime.Now;
            db.SaveChanges();
            return "OKK";

        }

        //[System.Web.Http.Route("api/AccountsAPI/getAllPayingPaymentDetailsIntopdf")]
        //[System.Web.Http.HttpPost]
        //public List<PayeeDetails> getAllPayingPaymentDetailsIntopdf(List<string> id)
        //{
        //    DataTable datatable = new DataTable();
        //    List<PayeeDetails> list = new List<PayeeDetails>();
        //    sqlHelper obj = new sqlHelper();
        //    int SchoolID = Convert.ToInt32(id[0]);

        //    datatable.Columns.Add(new DataColumn("Category"));
        //    datatable.Columns.Add(new DataColumn("Payee"));
        //    datatable.Columns.Add(new DataColumn("Payment Mode"));
        //    datatable.Columns.Add(new DataColumn("Paying Amount"));
        //    datatable.Columns.Add(new DataColumn("Remarks"));
        //    datatable.Columns.Add(new DataColumn("Payment Date"));
           
        //    DataTable dt = obj.getDataTable(@"select ep.SchoolID, ec.CategoryName,ee.PayeeName, ep.* from tblTransExPayeeDetails ep
        //                  left outer join tblExPayeeDetails ee on ee.Id=ep.ExpDetailsId
        //                  left outer join tblExpenseCategory ec on ec.Id = ee.CategoryId join tblSchoolDetails s on s.ID=ep.SchoolID  
						  // where  ep.SchoolID='"+ SchoolID + "'  and ep.IsDeleted is null  order by ep.Id desc");

               

        //        foreach (DataRow dr in dt.Rows)
        //        {
        //            PayeeDetails usr = new PayeeDetails();
        //            // PayeeDetails usr = new PayeeDetails();
        //            usr.Category = dr["CategoryName"].ToString();
        //            usr.Id = dr["Id"].ToString();
        //            usr.Name = dr["PayeeName"].ToString();
        //            usr.PaymentMode = dr["PaymentMode"].ToString();
        //            usr.Remarks = dr["Remarks"].ToString();
        //            usr.PayingAmount = dr["PayingAmount"].ToString();
        //            // usr.DuesAmount = dr["DuesAmount"].ToString();
        //            usr.PaymentDate = ((DateTime)dr["PaymentDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        //            // usr.LastDate = ((DateTime)dr["LastDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        //            usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
        //        list.Add(usr);
               

        //        }
        //    datatable.Rows.Add(list);
        //    iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
        //    rec.BackgroundColor = new BaseColor(System.Drawing.Color.Olive);
        //    Document doc = new Document(rec);
        //    doc.SetPageSize(iTextSharp.text.PageSize.A4);
        //    PdfWriter writer = PdfWriter.GetInstance(doc, HttpContext.Current.Response.OutputStream);
        //    doc.Open();
        //    //Creating paragraph for header
        //    BaseFont bfntHead = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
        //    iTextSharp.text.Font fntHead = new iTextSharp.text.Font(bfntHead, 16, 1, iTextSharp.text.BaseColor.ORANGE);
        //    Paragraph prgHeading = new Paragraph();
        //    prgHeading.Alignment = Element.ALIGN_LEFT;
        //    prgHeading.Add(new Chunk("Employee Details".ToUpper(), fntHead));
        //    doc.Add(prgHeading);
        //    //Adding paragraph for report generated by
        //    Paragraph prgGeneratedBY = new Paragraph();
        //    BaseFont btnAuthor = BaseFont.CreateFont(BaseFont.TIMES_ROMAN, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
        //    iTextSharp.text.Font fntAuthor = new iTextSharp.text.Font(btnAuthor, 8, 2, iTextSharp.text.BaseColor.BLUE);
        //    prgGeneratedBY.Alignment = Element.ALIGN_RIGHT;
        //    prgGeneratedBY.Add(new Chunk("Report Generated by : ASPArticles", fntAuthor));
        //    prgGeneratedBY.Add(new Chunk("\nGenerated Date : " + DateTime.Now.ToShortDateString(), fntAuthor));
        //    doc.Add(prgGeneratedBY);
        //    //Adding a line
        //    Paragraph p = new Paragraph(new Chunk(new iTextSharp.text.pdf.draw.LineSeparator(0.0F, 100.0F, iTextSharp.text.BaseColor.BLACK, Element.ALIGN_LEFT, 1)));
        //    doc.Add(p);
        //    //Adding line break
        //    doc.Add(new Chunk("\n", fntHead));
        //    //Adding  PdfPTable
        //    PdfPTable table = new PdfPTable(datatable.Columns.Count);
        //    for (int i = 0; i < datatable.Columns.Count; i++)
        //    {
        //        string cellText = HttpContext.Current.Server.HtmlDecode(datatable.Columns[i].ColumnName);
        //        PdfPCell cell = new PdfPCell();
        //        cell.Phrase = new Phrase(cellText, new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.TIMES_ROMAN, 10, 1, new BaseColor(System.Drawing.ColorTranslator.FromHtml("#ffffff"))));
        //        cell.BackgroundColor = new BaseColor(System.Drawing.ColorTranslator.FromHtml("#990000"));
        //        //cell.Phrase = new Phrase(cellText, new Font(Font.FontFamily.TIMES_ROMAN, 10, 1, new BaseColor(grdStudent.HeaderStyle.ForeColor)));
        //        //cell.BackgroundColor = new BaseColor(grdStudent.HeaderStyle.BackColor);
        //        cell.HorizontalAlignment = Element.ALIGN_CENTER;
        //        cell.PaddingBottom = 5;
        //        table.AddCell(cell);
        //    }
        //    //writing table Data
        //    for (int i = 0; i < datatable.Rows.Count; i++)
        //    {
        //        for (int j = 0; j < datatable.Columns.Count; j++)
        //        {
        //            table.AddCell(datatable.Rows[i][j].ToString());
        //        }
        //    }
        //    doc.Add(table);
        //    doc.Close();
        //    writer.Close();
        //    HttpContext.Current.Response.ContentType ="application/pdf";
        //    HttpContext.Current.Response.AddHeader("content-disposition", "attachment;" + "filename=EmployeeDetails.pdf");
        //    HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    HttpContext.Current.Response.Write(doc);
        //    HttpContext.Current.Response.End();
        //    //Response.ContentType = "application/pdf";
        //    //Response.AddHeader("content-disposition", "attachment;" + "filename=EmployeeDetails.pdf");
        //    //Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    //Response.Write(doc);
        //    //Response.End();
       

        //    return list;
        //}


        [System.Web.Http.Route("api/AccountsAPI/getAllPayingPaymentDetails")]
        [System.Web.Http.HttpPost]
        public  List<PayeeDetails> getAllPayingPaymentDetails(List <string > aa)
        {
            List<PayeeDetails> list = new List<PayeeDetails>();
            sqlHelper obj = new sqlHelper();
            string loginuser = aa[0];
            int typeuser = Convert.ToInt32(aa[1]);
           
            if (typeuser ==2)
            {
                DataTable dt = obj.getDataTable(@"select s.School,ep.SchoolID, ec.CategoryName,ee.PayeeName, ep.* from tblTransExPayeeDetails ep
                          left outer join tblExPayeeDetails ee on ee.Id=ep.ExpDetailsId
                          left outer join tblExpenseCategory ec on ec.Id = ee.CategoryId join tblSchoolDetails s on s.ID=ep.SchoolID where ep.IsDeleted is null
						  order by ep.Id desc");

                //            DataTable dt = obj.getDataTable(@"select ec.CategoryName,ee.PayeeName, ep.* from tblTransExPayeeDetails ep
                //left outer join tblExPayeeDetails ee on ee.Id=ep.ExpDetailsId
                //left outer join tblExpenseCategory ec on ec.Id = ee.CategoryId order by ep.Id desc");

                foreach (DataRow dr in dt.Rows)
                {
                    PayeeDetails usr = new PayeeDetails();
                    // PayeeDetails usr = new PayeeDetails();
                    usr.Category = dr["CategoryName"].ToString();
                    usr.Id = dr["Id"].ToString();
                    usr.Name = dr["PayeeName"].ToString();
                    usr.PaymentMode = dr["PaymentMode"].ToString();
                    usr.Remarks = dr["Remarks"].ToString();
                    usr.PayingAmount = dr["PayingAmount"].ToString();
                    // usr.DuesAmount = dr["DuesAmount"].ToString();
                    usr.PaymentDate = ((DateTime)dr["PaymentDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    // usr.LastDate = ((DateTime)dr["LastDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
                    usr.School = dr["School"].ToString();
                    list.Add(usr);

                }
            }
            else
            {
                DataTable dt = obj.getDataTable(@"select s.School,ep.SchoolID, ec.CategoryName,ee.PayeeName, ep.* from tblTransExPayeeDetails ep
                          left outer join tblExPayeeDetails ee on ee.Id=ep.ExpDetailsId
                          left outer join tblExpenseCategory ec on ec.Id = ee.CategoryId join tblSchoolDetails s on s.ID=ep.SchoolID
						  left outer join tblEmployee em on em.SchoolID=ep.SchoolID 
						   where em.UserID='" + loginuser + "' and em.IsDeleted is null and ep.IsDeleted is null  order by ep.Id desc");

                //            DataTable dt = obj.getDataTable(@"select ec.CategoryName,ee.PayeeName, ep.* from tblTransExPayeeDetails ep
                //left outer join tblExPayeeDetails ee on ee.Id=ep.ExpDetailsId
                //left outer join tblExpenseCategory ec on ec.Id = ee.CategoryId order by ep.Id desc");

                foreach (DataRow dr in dt.Rows)
                {
                    PayeeDetails usr = new PayeeDetails();
                    // PayeeDetails usr = new PayeeDetails();
                    usr.Category = dr["CategoryName"].ToString();
                    usr.Id = dr["Id"].ToString();
                    usr.Name = dr["PayeeName"].ToString();
                    usr.PaymentMode = dr["PaymentMode"].ToString();
                    usr.Remarks = dr["Remarks"].ToString();
                    usr.PayingAmount = dr["PayingAmount"].ToString();
                    // usr.DuesAmount = dr["DuesAmount"].ToString();
                    usr.PaymentDate = ((DateTime)dr["PaymentDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    // usr.LastDate = ((DateTime)dr["LastDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                    usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
                    usr.School = dr["School"].ToString();
                    list.Add(usr);

                }
            }
            return list;
        }

        [System.Web.Http.Route("api/AccountsAPI/countTotalPayingAmountbySchool")]
        [System.Web.Http.HttpPost]
        public string countTotalPayingAmountbySchool(List<string> id)
        {
            int SchoolID = Convert.ToInt32(id[0]);
            sqlHelper obj = new sqlHelper();

            string payingAmount = obj.ExecuteScaler("select SUM(cast(PayingAmount as float)) TotalAmount from tblTransExPayeeDetails where SchoolID='"+SchoolID+"' and IsDeleted is null");
            return payingAmount;
        }

        [System.Web.Http.Route("api/AccountsAPI/countTotalPayingAmount")]
        [System.Web.Http.HttpPost]
        public string countTotalPayingAmount()
        {
            sqlHelper obj = new sqlHelper();
           
            string payingAmount = obj.ExecuteScaler("select SUM(cast(PayingAmount as float)) TotalAmount from tblTransExPayeeDetails");
            return payingAmount ;
        }
         

       [System.Web.Http.Route("api/AccountsAPI/searchPaymentDetails")]
       [System.Web.Http.HttpPost]
       public List<PayeeDetails> searchPaymentDetails(PayeeDetails payee)
        {
            sqlHelper obj = new sqlHelper();
            List<PayeeDetails> list = new List<PayeeDetails>();
      

            string[] cols = { "@name", "@date", "@paymentMode","@SchoolID"};
            object[] vals = { payee.Name, payee.PaymentDate, payee.PaymentMode,payee.SchoolID};

            DataTable dt = obj.sp_GetDataTable("sp_searchExpensePaymentDetails", cols, vals);
            foreach (DataRow dr in dt.Rows)
            {
                PayeeDetails usr = new PayeeDetails();
                // PayeeDetails usr = new PayeeDetails();
                usr.Category = dr["CategoryName"].ToString();
                usr.Id = dr["Id"].ToString();
                usr.Name = dr["PayeeName"].ToString();
                usr.PaymentMode = dr["PaymentMode"].ToString();
                usr.Remarks = dr["Remarks"].ToString();
                usr.PayingAmount = dr["PayingAmount"].ToString();
                // usr.DuesAmount = dr["DuesAmount"].ToString();
                usr.PaymentDate = ((DateTime)dr["PaymentDate"]).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                usr.SchoolID = Convert.ToInt32(dr["SchoolID"]);
                usr.School = dr["School"].ToString();
                list.Add(usr);

            }
            return list;
        }


        [System.Web.Http.Route("api/AccountsAPI/deleteExpanseDetailsById")]
        [System.Web.Http.HttpPost]
        public string deleteExpanseDetailsById(List<string> id)
        {
            Int32 idd = Convert.ToInt32(id[0]);
            //var tbl = new tblTransExPayeeDetail{ Id = idd };
            //db.Entry(tbl).State = System.Data.Entity.EntityState.Deleted;
            var aa = db.tblTransExPayeeDetails.SingleOrDefault(s => s.Id == idd);
            aa.IsDeleted = 1;
            aa.Deleted_on = DateTime.Now;
            db.SaveChanges();
            return "OKK";

        }


        

    }
}
