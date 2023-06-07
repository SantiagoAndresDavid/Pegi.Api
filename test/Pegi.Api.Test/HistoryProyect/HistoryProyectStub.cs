using Pegi.Api.Test.Proyect;

namespace Pegi.Api.Test.HistoryProyect;

public class HistoryProyectStub
{
    public static readonly Entities.HistoryProyect HistoryProyect = new(proyectCode:"1",proyectFeedBackCode:1)
    {
        Code = 1,

    };

    public static readonly Entities.HistoryProyect BadHistoryProyect = new(proyectCode:null ,proyectFeedBackCode:null)
    {
        Code = null,
        ProyectFeedBackCode = null,
        ProyectCode = "",
    };
}
