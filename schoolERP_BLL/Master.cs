using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace schoolERP_BLL
{

    public class Licence    {        public int Id { get; set; }        public int SchoolID { get; set; }        public string LicenceNo { get; set; }        public string NoofStudent { get; set; }        public string Charges { get; set; }        public string ValidTo { get; set; }        public string RenewalDate { get; set; }        public string Active { get; set; }        public string UserName { get; set; }        public string Flag { get; set; }        public string SchoolName { get; set; }    }

    public class CHECKLICENCE    {        public int Id { get; set; }        public int SchoolID { get; set; }        public int NoofStudentLicenced { get; set; }
        public int NoofStudentSchool { get; set; }             public string SchoolName { get; set; }
        public string alertmsg { get; set; }


    }
    public class CountyMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Statuss { get; set; }
        public List<StateMaster> MasteState {get;set;}

        public string School { get; set; }
        public int SchoolID { get; set; }

    }

    public class StateMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Statuss { get; set; }
        public string CountryName { get; set; }
        public List<CityMaster> cities { get; set; }

    }

    public class CityMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string CountryId { get; set; }
        public string StateId { get; set; }
        public string Statuss { get; set; }

    }

    public class CourseMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Desc { get; set; }
        public string Code { get; set; }
       public string MiniumuAttendePer { get; set; }
        public string AttendenceType { get; set; }
        public string TotlWorkingDay { get; set; }
        public string Syllabus { get; set; }
        public string ID { get; set; }
        public string School { get; set; }
        public string Statusshow { get; set; }
        public List<SectionMaster> MasterSection { get; set; }
        public List<StreamMaster> MasterStream { get; set; }

        

    }

    public class BatchMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Statuss { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public string maxNoOfStudent { get; set; }
        public string Class { get; set; }

        public string School { get; set; }
        public int SchoolID { get; set; }
        public int classid { get; set; }
        public bool CurrActive { get; set; }
        public string CurrActiveShow { get; set; }
        public string StatusShow { get; set; }
    }

    public class SectionMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
       public string Class { get; set; }
        public string School { get; set; }
        public int SchoolID { get; set; }

    }

    public class CastMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Statusss { get; set; }

    }

    public class StatusMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }

    }

    public class RoleMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }

    }
    public class DriverEmployee
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int SchoolID { get; set; }
       
    }

    public class DepartmentMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Statuss { get; set; }
        
        public string School { get; set; }
        public int SchoolID { get; set; }
        public string ID { get; set; }
    }

    public class SchoolSMSMASTER
    {
        public int id { get; set; }
        public string authKey { get; set; }
        public string senderId { get; set; }
        public string SchoolID { get; set; }
        public bool active { get; set; }
        public string Statuss { get; set; }
        public string SchoolName { get; set; }
        //
    }
    public class QualficationMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }

        public string  SchoolID { get; set; }

    }

    public class CategoryMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Statusss { get; set; }

    }

    public class StreamMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public bool Status { get; set; }
        public string Class { get; set; }
        public string ClassId { get; set; }
        public int SchoolID { get; set; }
        public string School{ get; set; }
        public string StatusShow { get; set; }
    }

    public class DocumentMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string desc { get; set; }
        public string userType { get; set; }
        public string userId { get; set; }
        public bool Status { get; set; }
        public string Statusshow { get; set; }
        public int SchoolID { get; set; }
        public string School { get; set; }
    }


    public class CodeGenMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string DocType { get; set; }
        public string Prefix { get; set; }
        public string Suffix { get; set; }

        public string DocNo { get; set; }
        public string StartSeries { get; set; }
        public string Seprator { get; set; }
        public string LastSeries { get; set; }

        public bool Status { get; set; }
        public string Statusshow { get; set; }
        public string SchoolID { get; set; }
        public string School { get; set; }

    }

   

      

    public class SendEmail {

        public string Id { get; set; }
        public string EmailTo { get; set; }
        public string Subject { get; set; }
        public string Messsage { get; set; }

        public DateTime date { get; set; }
        public string TaskDate { get; set; }

        public Int64 EmpId { get; set; }
        public int SchoolID { get; set; }
        public string Thought { get; set; }
        public string Todaydate { get; set; }
    }
    public class  Holiday {
        public int count { get; set; }
        public int ID { get; set; }
        public string Name { get; set; }
        public string AcademicYear { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public Nullable<int> SchoolID { get; set; }
        public string Description { get; set; }
        public string School { get; set; }
        public string msg { get; set; }
        public int days { get; set; }
    }
  

    public class ExpCategory
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }
        public string Extra10 { get; set; }
        public int SchoolID { get; set; }
        public string School { get; set; }
    }

    public class PayeeDetails
    {

        public string Id { get; set; }

        public string Name { get; set; }
        public string Category { get; set; }
        public string PrimaryDate { get; set; }
        public string LastDate { get; set; }
        public string TotalAmount { get; set; }
        public string PaymentType { get; set; }
        public string PayingAmount { get; set; }
        public string PaymentDate { get; set; }
        public string PaymentMode { get; set; }
        public string Checqno { get; set; }
        public string ChequeDate { get; set; }
        public string BankName { get; set; }

        public string Remarks { get; set; }
        public string DuesAmount { get; set; }
        public string Status { get; set; }
        public string Extra1 { get; set; }
        public string Extra2 { get; set; }
        public string Extra3 { get; set; }
        public string School { get; set; }
        public int SchoolID { get; set; }
        public string BankRemarks { get; set; }
        
    }

    public class SubjectMaster
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Desc { get; set; }
        public string Color { get; set; }
        public bool Status { get; set; }
        public string stStatus { get; set; }
        public string School { get; set; }
        public int SchoolID { get; set; }
        public int classid { get; set; }
        public string classname { get; set; }
    }



    public class VedioAdvertising
    {
        public string Url { get; set; }
        public string Time { get; set; }
       public string Title { get; set; }

    }


}
