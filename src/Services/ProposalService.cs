using Data.Repository;
using Entities;

namespace Services;

public class ProposalService
{
    private readonly ProposalRepository _proposalRepository;

    public ProposalService(ProposalRepository proposalRepository)
    {
        _proposalRepository = proposalRepository;
    }

    public List<Proposal> GetLines()
    {
        return _proposalRepository.GetAll();
    }

    public Proposal? SearchProposale(string code)
    {
        return _proposalRepository.Find(line =>
            line.Code == code);
    }
}
