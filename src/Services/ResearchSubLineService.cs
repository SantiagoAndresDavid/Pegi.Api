using Data.Repository;
using Entities;

namespace Services;

public class ResearchSubLineService
{
    private readonly ResearchSubLinesRepository _researchSubLinesRepository;


    public ResearchSubLineService(ResearchSubLinesRepository researchSubLinesRepository)
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
