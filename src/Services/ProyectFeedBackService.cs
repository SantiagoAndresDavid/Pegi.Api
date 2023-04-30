using Data.Repository;
using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class ProyectFeedBackService
{
    private readonly IRepository<ProyectFeedBack> _proyectFeedBackRepository;

    public ProyectFeedBackService(IRepository<ProyectFeedBack> proyectFeedBackRepository)
    {
        _proyectFeedBackRepository = proyectFeedBackRepository;
    }


    public (string, bool) SaveProyectFeedBack(ProyectFeedBack proyectFeedBack)
    {
        try
        {
            _proyectFeedBackRepository.Save(proyectFeedBack);
            return ("se ha guardado con exito", true);
        }
        catch (ProyectFeedBackExeption e)
        {
            return (e.Message, false);
        }
    }
}
