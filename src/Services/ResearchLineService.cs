using Data.Repository;
using Entities;

namespace Services;

public class ResearchLineService
{
    private readonly ResearchLinesRepository _researchLinesRepository;


    public ResearchLineService(ResearchLinesRepository researchLinesRepository)
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
