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
    
    public partial class rad_history
    {
        public int id { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> p_id { get; set; }
        public string p_name { get; set; }
        public Nullable<bool> status { get; set; }
        public Nullable<int> rad_id { get; set; }
        public string rad_name { get; set; }
        public Nullable<double> price { get; set; }
        public Nullable<bool> del { get; set; }
        public Nullable<int> user_id { get; set; }
        public string user_name { get; set; }
        public Nullable<System.DateTime> date_now { get; set; }
        public string rad_result { get; set; }
        public Nullable<int> ticketId { get; set; }
        public string docNmae { get; set; }
        public Nullable<double> discount { get; set; }
    }
}
