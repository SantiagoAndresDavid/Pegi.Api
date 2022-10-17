using Entities;

namespace Data.Repository.shared;


public class PeopleRepository : Repository<Person>
{
    public PeopleRepository(PegiDbContext context) : base(context)
    {
    }

}
