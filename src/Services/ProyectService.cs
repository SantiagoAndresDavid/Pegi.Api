using Data.Repository;
using Entities;
using Entities.Exceptions;

namespace Services;

public class ProyectService
{
    private readonly ProyectRepository _proyectRepository;

    public ProyectService(ProyectRepository proyectRepository)
    {
        _proyectRepository = proyectRepository;
    }

    public (string, bool) SaveProyect(Proyect proyect)
    {
        try
        {
            _proyectRepository.Save(proyect);
            return ("se ha guardado con exito", true);
        }
        catch (ProposalExeption e)
        {
            return (e.Message, false);
        }
    }

    public (string, bool?) UpdateProyect(Proyect proposal)
    {
        try
        {
            _proyectRepository.Update(proposal);
            return ("se actualizo con exito", true);
        }
        catch (AuthException e)
        {
            return ("error", false);
        }
    }

    public List<Proyect> GetProyects(string personDocument)
    {
        return _proyectRepository.Filter(proyect =>
            proyect.PersonDocument != null &&
            proyect.PersonDocument == personDocument);
    }

    public Proyect? SearchProyect(string personDocument)
    {
        return _proyectRepository.Find(proyect =>
            proyect.PersonDocument == personDocument);
    }

}
