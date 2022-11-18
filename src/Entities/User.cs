using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;

[Table("users")]
public class User
{
    [Key]
    [Column("user_name")]
    public string? Name { get; set; }

    [Column("user_password")]
    public string? Password { get; set; }

    [Column("user_rol")]
    public string? Role { get; set; }

    [ForeignKey("person_document")]
    public Person? Person { get; set; }
}
