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
    
    public partial class monthdetails
    {
        public int id { get; set; }
        public string code { get; set; }
        public string name { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string shiftstring { get; set; }
        public string day { get; set; }
        public Nullable<System.DateTime> come { get; set; }
        public Nullable<System.DateTime> go { get; set; }
        public Nullable<double> attendhours { get; set; }
        public Nullable<double> extrahour { get; set; }
        public Nullable<double> shorthour { get; set; }
        public Nullable<double> attentMintues { get; set; }
        public Nullable<double> extraMinutes { get; set; }
        public Nullable<double> shortMinutes { get; set; }
        public Nullable<int> dayNum { get; set; }
    }
}
