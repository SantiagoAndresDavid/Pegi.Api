using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

[Table("professor")]
public class Professor : Person
{
    [Column("position")]
    public string Position { get; set; }
}
