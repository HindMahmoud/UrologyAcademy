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
    
    public partial class savee
    {
        public int id { get; set; }
        public string title { get; set; }
        public Nullable<double> in_value { get; set; }
        public Nullable<double> out_value { get; set; }
        public Nullable<double> balance { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string type { get; set; }
        public string notes { get; set; }
        public Nullable<int> p_id { get; set; }
        public Nullable<bool> del { get; set; }
        public Nullable<int> user_id { get; set; }
        public string user_name { get; set; }
        public Nullable<int> item_id { get; set; }
        public Nullable<int> paylist_id { get; set; }
        public Nullable<double> disc { get; set; }
        public Nullable<int> ticketId { get; set; }
    }
}
