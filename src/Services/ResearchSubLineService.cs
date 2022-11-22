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

    public ResearchSubline? SearchSubLine(string code)
    {
        return _researchSubLinesRepository.Find(line =>
            line.Code == code);
    }


}
