using Data.Repository;
using Data.Repository.shared;
using Entities;

namespace Services;

public class ResearchLineService
{
    private readonly IRepository<ResearchLine> _researchLinesRepository;

    public ResearchLineService(IRepository<ResearchLine> researchLinesRepository)
    {
        _researchLinesRepository = researchLinesRepository;
    }

    public List<ResearchLine> GetLines()
    {
        return _researchLinesRepository.GetAll();
    }

    public ResearchLine? SearchLine(string code)
    {
        return _researchLinesRepository.Find(line =>
            line.Code == code);
    }

}
