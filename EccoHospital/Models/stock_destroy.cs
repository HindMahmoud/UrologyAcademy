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
    
    public partial class stock_destroy
    {
        public int id { get; set; }
        public Nullable<int> prod_id { get; set; }
        public string prod_name { get; set; }
        public Nullable<double> qty { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> dep_id { get; set; }
        public string source { get; set; }
        public string dep_name { get; set; }
    }
}