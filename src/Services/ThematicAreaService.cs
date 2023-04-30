using Data.Repository;
using Data.Repository.shared;
using Entities;

namespace Services;

public class ThematicAreaService
{
    private readonly IRepository<ThematicArea> _thematicAreasRepository;

    public ThematicAreaService(IRepository<ThematicArea> thematicAreasRepository)
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
