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
    
    public partial class loan_installment
    {
        public int id { get; set; }
        public Nullable<int> loan_id { get; set; }
        public Nullable<double> value { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<bool> payed { get; set; }
        public Nullable<int> emp_id { get; set; }
        public Nullable<int> lab_id { get; set; }
        public string title { get; set; }
    }
}