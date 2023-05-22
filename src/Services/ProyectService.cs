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

    public (string, bool?) UpdateProyect(Proyect proyect)
    {
        try
        {
            _proyectRepository.Update(proyect);
            return ("se actualizo con exito", true);
        }
        catch (AuthException e)
        {
            return ("error", false);
        }
    }

    public (string,bool?) UpdateStatusProyect(string code,string status,int? score)
    {
        try
        {
            Proyect? proyect = _proyectRepository.Find(proyect => proyect.Code == code);
            proyect!.Status = status;
            proyect!.Score = score;
            _proyectRepository.Update(proyect);
            return ("se modifico con exito",true);
        }
        catch(AuthException e)
        {
            return ("error",false);
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

    public string DeleteProyect(string code)
    {
        try
        {
            Proyect? proyect =
                _proyectRepository.Find(proyect => proyect.Code == code);
            _proyectRepository.Delete(proyect!);
            return "se borro con exito";
        }
        catch (Exception e)
        {
            throw new PersonExeption(
                $"Ha ocurrido un error al eliminar {e.Message}");
        }
    }

    public List<Proyect> GetAll()
    {
        return _proyectRepository.GetAll();
    }


    public Proyect? GetProyectCode(string code)
    {
        return _proyectRepository.Find(proyect => proyect.Code == code);
    }

}
