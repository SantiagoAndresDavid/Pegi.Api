namespace Pegi.Api.Test.User;

public static class UserStub
{
    public static readonly Entities.User user = new()
    {
        Name = "test",
        Password = "testUser@example.com",
        Role = "testPassword"
    };
}
