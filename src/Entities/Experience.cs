using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;
[Table("Experiences")]
public class Experience : Study
{
    [Column("experience_position")]
    public string Position { get; set; }
}
