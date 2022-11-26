using Data.Repository;
using Entities;
using Entities.Exceptions;

namespace Services;

public class ProposalService
{
    private readonly ProposalRepository _proposalRepository;

    public ProposalService(ProposalRepository proposalRepository)
    {
        _proposalRepository = proposalRepository;
    }

    public (string, bool) SaveProposal(Proposal proposal)
    {
        try
        {
            _proposalRepository.Save(proposal);
            return ("se ha guardado con exito", true);
        }
        catch (ProposalExeption e)
        {
            return (e.Message, false);
        }
    }

    public (string,bool?) UpdateProposal(Proposal proposal)
    {
        try
        {
            _proposalRepository.Update(proposal);
            return ("se actualizo con exito",true);
        }
        catch(AuthException e)
        {
            return ("error",false);
        }
    }

    public List<Proposal> GetLines()
    {
        return _proposalRepository.GetAll();
    }

    public Proposal? SearchProposal(string personDocument)
    {
        return _proposalRepository.Find(line =>
            line.PersonDocument == personDocument);
    }
}
