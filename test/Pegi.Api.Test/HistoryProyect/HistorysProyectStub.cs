namespace Pegi.Api.Test.HistoryProyect;

public class HistorysProyectStub
{
    public static readonly List<Entities.HistoryProyect> HistoryProyects = new List<Entities.HistoryProyect>()
    {
        new Entities.HistoryProyect(proyectCode:"1",proyectFeedBackCode:1)
        {
            Code = 1,
            ProyectFeedBackCode = 1,
            ProyectCode = "1",
        },
        new Entities.HistoryProyect(proyectCode:"1",proyectFeedBackCode:1)
        {
            Code = 2,
            ProyectFeedBackCode = 1,
            ProyectCode = "1",
        },
        new Entities.HistoryProyect(proyectCode:"1",proyectFeedBackCode:1)
        {
            Code = 3,
            ProyectFeedBackCode = 1,
            ProyectCode = "1",
        }
    };
}
