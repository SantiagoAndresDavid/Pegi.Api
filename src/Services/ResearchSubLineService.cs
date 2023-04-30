using Data.Repository;
using Data.Repository.shared;
using Entities;

namespace Services;

public class ResearchSubLineService
{
    private readonly IRepository<ResearchSubline> _researchSubLinesRepository;

    public ResearchSubLineService(IRepository<ResearchSubline> researchSubLinesRepository)
    {
        _researchSubLinesRepository = researchSubLinesRepository;
    }

    public List<ResearchSubline> GetLines()
    {
        return _researchSubLinesRepository.GetAll();
    }

    public List<ResearchSubline> SearchSubLine(string code)
    {
        return _researchSubLinesRepository.Filter(line =>
            line.ResearchLineCode == code);
    }


}
