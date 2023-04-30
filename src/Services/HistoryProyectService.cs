using Data.Repository.shared;
using Entities;
using Entities.Exceptions;

namespace Services;

public class HistoryProyectService
{
    private readonly IRepository<HistoryProyect> _historyProyectRepository;

    public HistoryProyectService(IRepository<HistoryProyect> historyProyectRepository)
    {
        _historyProyectRepository = historyProyectRepository;
    }

    public (string, bool) SaveProyectlHistory(HistoryProyect historyProyect)
    {
        try
        {
            _historyProyectRepository.Save(historyProyect);
            return ("se ha guardado con exito", true);
        }
        catch (HistoryProyectExeption e)
        {
            return (e.Message, false);
        }
    }

    public List<HistoryProyect> SearchProyectHistory(string codeProyect)
    {
        return _historyProyectRepository.Filter(historyProyect =>
            historyProyect.ProyectCode == codeProyect);
    }


}
