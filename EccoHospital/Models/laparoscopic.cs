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
    
    public partial class laparoscopic
    {
        public int id { get; set; }
        public Nullable<int> pat_id { get; set; }
        public Nullable<int> PatServ_id { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public string anesthesia { get; set; }
        public string panoramic { get; set; }
        public string uterus { get; set; }
        public string uterus_abnormal { get; set; }
        public string uterus_adhesion { get; set; }
        public string bladder { get; set; }
        public string LtTubes { get; set; }
        public string LtTubesComment { get; set; }
        public string LtOvary { get; set; }
        public string LtOvaryComment { get; set; }
        public string LtOvarainFossa { get; set; }
        public string LtOvarainFossaComment { get; set; }
        public string RtTubes { get; set; }
        public string RtTubesComment { get; set; }
        public string RtOvary { get; set; }
        public string RtOvaryComment { get; set; }
        public string RtOvarainFossa { get; set; }
        public string RtOvarainFossaComment { get; set; }
        public string douglas { get; set; }
        public string uterosacral { get; set; }
        public string operative { get; set; }
        public string impression { get; set; }
    }
}
