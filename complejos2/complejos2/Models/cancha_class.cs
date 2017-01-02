using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Login.Models
{
    public class CursoValidar
    {
        [DisplayName("id_cancha")]
        public int id_cancha { get; set; }

        [DisplayName("nombre cancha")]
        [Required(ErrorMessage = "invalido")]
        [StringLength(30, ErrorMessage = "no mas de 30")]
        public string nombre { get; set; }

        [DisplayName("descripcion")]
        [Required(ErrorMessage = "invalido")]
        [StringLength(50, ErrorMessage = "no mas de 50")]
        public string correo_c { get; set; }

        
    }
}