using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;
[Table("cities")]
public class City
{
    [Key]
    [Column("city_id")]
    public int Id { get; set; }

    [Column("city_name")]
    public string Name { get; set;  }

    public string DepartmenId { get; set; }

    [ForeignKey("d  eparment_id")]
    public Department Department { get; set; }
}
