using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Entities;
[Table("studies")]
public class Study
{
    [Key]
    [Column("study_code")]
    public int Code { get; set; }

    [Column("study_institution")]
    public string Institution { get; set; }

    [Column("study_start_date")]
    public DateTime StartDate { get; set; }

    [Column("study_end_date")]
    public DateTime EndDate { get; set; }

    public string DeparmentCode { get; set; }
    [ForeignKey("DeparmentCode")]
    public Department? Department { get; set; }
}
