using Entities;

namespace Pegi.Api.Test;

public static class UserStub
{
    public static readonly User user = new()
    {
        Name = "test",
        Password = "testUser@example.com",
        Role = "testPassword"
    };
}
