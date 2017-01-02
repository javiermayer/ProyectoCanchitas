using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace complejos2.Models
{
    public class usuario_class
    {
        [DisplayName("codigo del curso")]
        public int nombreUsuario { get; set; }

        [DisplayName("contraseña")]
        [Required(ErrorMessage = "invalido")]
        [StringLength(30, ErrorMessage = "no mas de 30")]
        public string contraseña { get; set; }

        [DisplayName("correo electronico")]
        [Required(ErrorMessage = "invalido")]
        [StringLength(50, ErrorMessage = "no mas de 50")]
        [EmailAddress(ErrorMessage = "email invalido")]
        public string nombre_usuario { get; set; }
    }
}