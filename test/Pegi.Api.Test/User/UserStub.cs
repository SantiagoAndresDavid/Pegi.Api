namespace Pegi.Api.Test.User;

public static class UserStub
{
    public static readonly Entities.User User = new()
    {
        Name = "test",
        Password = "testUser@example.com",
        Role = "testPassword"
    };

    public static readonly Entities.User BadUser = new()
    {
        Name = "baduser",
        Password = "",
        Role = "testPassword"
    };
}
