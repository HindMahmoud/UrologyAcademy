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
    
    public partial class medicin
    {
        public int id { get; set; }
        public string name { get; set; }
        public Nullable<double> price { get; set; }
        public Nullable<double> buy_price { get; set; }
        public Nullable<double> quantity { get; set; }
        public string code { get; set; }
        public Nullable<double> alert_qty { get; set; }
        public Nullable<int> alert_ex_date { get; set; }
        public string type { get; set; }
        public string company { get; set; }
    }
}
