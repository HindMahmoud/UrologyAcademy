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
    
    public partial class room_history
    {
        public int id { get; set; }
        public Nullable<System.DateTime> date { get; set; }
        public Nullable<int> p_id { get; set; }
        public string p_name { get; set; }
        public Nullable<bool> status { get; set; }
        public Nullable<int> room_id { get; set; }
        public string room_name { get; set; }
        public Nullable<double> price { get; set; }
        public Nullable<double> total { get; set; }
        public Nullable<bool> check_out { get; set; }
        public Nullable<bool> del { get; set; }
        public Nullable<int> user_id { get; set; }
        public string user_name { get; set; }
        public Nullable<System.DateTime> date_now { get; set; }
        public Nullable<System.DateTime> from_date { get; set; }
        public Nullable<System.DateTime> to_date { get; set; }
        public string type { get; set; }
        public string notes { get; set; }
        public Nullable<double> dev_val { get; set; }
        public Nullable<double> enter_val { get; set; }
        public Nullable<double> total_val { get; set; }
        public Nullable<double> medical_care { get; set; }
        public Nullable<double> nursery_service { get; set; }
        public Nullable<double> artificialBreath_val { get; set; }
        public Nullable<double> treat_val { get; set; }
        public Nullable<double> foto_val { get; set; }
        public Nullable<double> oxcegin_val { get; set; }
        public Nullable<double> blood_change_val { get; set; }
        public Nullable<double> xray_val { get; set; }
        public Nullable<double> lab_val { get; set; }
        public Nullable<double> admistrations_val { get; set; }
        public Nullable<double> care_val { get; set; }
        public Nullable<double> insurance_val { get; set; }
        public Nullable<double> reminder_val { get; set; }
        public Nullable<int> ticketId { get; set; }
    }
}