using Data.Repository.shared;

namespace Data.Repository;

public class ResearchSubLinesRepository : Repository<ResearchSubLinesRepository>
{
    public ResearchSubLinesRepository(PegiDbContext context) : base(context)
    {
    }
}
