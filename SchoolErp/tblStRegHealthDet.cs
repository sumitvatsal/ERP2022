//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SchoolErp
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblStRegHealthDet
    {
        public int ID { get; set; }
        public Nullable<int> StudentID { get; set; }
        public Nullable<double> Height { get; set; }
        public Nullable<double> Weight { get; set; }
        public Nullable<double> VisionLeft { get; set; }
        public Nullable<double> VisionRight { get; set; }
        public string MedicationDetails { get; set; }
        public Nullable<int> Status { get; set; }
    }
}
