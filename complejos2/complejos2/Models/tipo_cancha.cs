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
    
    public partial class tipo_cancha
    {
        public tipo_cancha()
        {
            this.cancha = new HashSet<cancha>();
        }
    
        public int id_tipo { get; set; }
        public string descripcion { get; set; }
        public Nullable<int> Tamaño_de_cancha { get; set; }
        public string tipo_suelo { get; set; }
    
        public virtual ICollection<cancha> cancha { get; set; }
    }
}
