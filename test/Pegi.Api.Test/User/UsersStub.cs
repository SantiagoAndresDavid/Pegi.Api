namespace Pegi.Api.Test.User;

public class UsersStub
{
    public static readonly List<Entities.User> Users = new List<Entities.User>()
    {
        new Entities.User()
        {
            Name = "User1",
            Password = "password1",
            Role = "Role1"
        },
        new Entities.User()
        {
            Name = "User2",
            Password = "password2",
            Role = "Role2"
        },
        new Entities.User()
        {
            Name = "User3",
            Password = "password3",
            Role = "Role3"
        }
        // Puedes añadir más usuarios a la lista si es necesario
    };
}
