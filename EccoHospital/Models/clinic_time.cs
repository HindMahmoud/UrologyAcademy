//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EccoHospital.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class clinic_time
    {
        public int id { get; set; }
        public Nullable<System.TimeSpan> fromm { get; set; }
        public Nullable<System.TimeSpan> too { get; set; }
        public string day { get; set; }
        public Nullable<int> day_num { get; set; }
        public Nullable<int> doc_id { get; set; }
        public string doc_name { get; set; }
        public Nullable<int> clinic_id { get; set; }
        public string clinic_name { get; set; }
        public Nullable<bool> del { get; set; }
        public Nullable<int> user_id { get; set; }
        public string user_name { get; set; }
        public Nullable<System.DateTime> date_now { get; set; }
    }
}
