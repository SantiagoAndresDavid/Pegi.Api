using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

public class Experience : Study
{
    [Column("experience_position")]
    public string Position { get; set; }
}
