using Data.Repository.shared;
using Entities;

namespace Data.Repository;

public class UserRepository : Repository<User>
{
    public UserRepository(PegiDbContext context) : base(context)
    {
    }
}
