using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;
[Table("Experiences")]
public class Experience : Person
{
    [Column("experience_position")]
    public string Position { get; set; }
}
