using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

[Table("professor")]
public class Professor
{
    [Key] public string person_document { get; set; }
    [ForeignKey("person_document")] public Person Person { get; set; }

    [Column("position")] public string Position { get; set; }
}
