//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace complejos2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class horas
    {
        public horas()
        {
            this.cancha = new HashSet<cancha>();
        }
    
        public int id_horoas { get; set; }
        public Nullable<int> C1 { get; set; }
        public Nullable<int> C2 { get; set; }
        public Nullable<int> C3 { get; set; }
        public Nullable<int> C4 { get; set; }
        public Nullable<int> C5 { get; set; }
        public Nullable<int> C6 { get; set; }
        public Nullable<int> C7 { get; set; }
        public Nullable<int> C8 { get; set; }
        public Nullable<int> C9 { get; set; }
        public Nullable<int> C10 { get; set; }
        public Nullable<int> C11 { get; set; }
        public Nullable<int> C12 { get; set; }
        public Nullable<int> C13 { get; set; }
        public Nullable<int> C14 { get; set; }
        public Nullable<int> C15 { get; set; }
    
        public virtual ICollection<cancha> cancha { get; set; }
    }
}