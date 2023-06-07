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

    public static readonly Entities.User EncrypeUser = new()
    {
        Name = "test",
        Password = "$2b$10$XE5v8Qvu/Ld/1ovC9l5oYuCQ0l.KnOj.14/FgcJCQirTKjv9AQi52",
        Role = "testPassword"
    };
}
