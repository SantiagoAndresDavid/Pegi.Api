using Data.Repository;
using Entities;

namespace Services;

public class ThematicAreaService
{
    private readonly ThematicAreasRepository _thematicAreasRepository;

    public ThematicAreaService(ThematicAreasRepository thematicAreasRepository)
    {
        _thematicAreasRepository = thematicAreasRepository;
    }

    public List<ThematicArea> GetLinesThematicAreas()
    {
        return _thematicAreasRepository.GetAll();
    }

    public List<ThematicArea> SearchThematicArea(string code)
    {
        return _thematicAreasRepository.Filter(area  =>
            area.ResearchSublineCode == code);
    }
}
