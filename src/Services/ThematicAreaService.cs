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

    public ThematicArea? SearchThematicArea(string code)
    {
        return _thematicAreasRepository.Find(area  =>
            area.Code == code);
    }
}
